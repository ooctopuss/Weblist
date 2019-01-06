/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Tools.Escape;
import db.daos.ImmagineDAO;
import db.daos.UtenteDAO;
import db.entities.Immagine;
import db.entities.Utente;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author octopussy
 */
@MultipartConfig
public class ModAccServlet extends HttpServlet {
    private UtenteDAO utenteDao;
    private String uploadDir;
    private ImmagineDAO immaginiDao;
    
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            utenteDao = daoFactory.getDAO(UtenteDAO.class);
            immaginiDao = daoFactory.getDAO(ImmagineDAO.class);
        } catch (DAOFactoryException ex) {
            throw new ServletException("Impossible to get dao factory for user storage system", ex);
        }
        uploadDir = getServletContext().getInitParameter("uploadP");
        if (uploadDir == null) {
            throw new ServletException("Please supply uploadDir parameter");
        }
        
        String contextPath = this.getClass().getResource("/").getPath();
        
        if (!contextPath.endsWith("\\")) {
            contextPath += "\\";
        }
        if (!uploadDir.startsWith("\\")) {
            uploadDir = "\\"+ uploadDir;
        }
       
        String contesto = contextPath.substring(1,contextPath.indexOf("/target"));
        uploadDir = contesto+"\\src\\main\\webapp"+uploadDir ;
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = Escape.escapeMetaCharacters(request.getParameter("email"));
        
        String cognome = Escape.escapeMetaCharacters(request.getParameter("cognome"));
        String nome = Escape.escapeMetaCharacters(request.getParameter("nome"));
        HttpSession session = request.getSession(false);
        Utente ut =(Utente) session.getAttribute("utente");
        if(cognome == null){
            cognome = ut.getCognome();
        }
        if(nome == null)
            nome = ut.getNome();
        int idImmagine = -1;
        idImmagine=caricaImm(request,immaginiDao);
        if( idImmagine != -1 )
            ut.setAvatar(idImmagine);
        ut.setCognome(cognome);
        ut.setNome(nome);
        
        
        session.setAttribute("utente",ut);
        utenteDao.updateUtente(ut);

        
        response.sendRedirect("pages/Account.jsp");
    }
    public int caricaImm(HttpServletRequest request,ImmagineDAO immagineDao) throws IOException, ServletException{
        File uploadDirFile = new File(uploadDir);
        
        Part filePart1 = request.getPart("profilo");
        if ((filePart1 != null) && (filePart1.getSize() > 0)) {
            String filename1 = Paths.get(filePart1.getSubmittedFileName()).getFileName().toString();//MSIE  fix.
            String formato = filename1.substring(filename1.indexOf("."));
            
            do{
                filename1 = Immagine.generateUniqueFileName();
                filename1 = filename1+formato;
            }while(immagineDao.getImmagine(filename1) != null);
            File file1 = new File(uploadDirFile, filename1);
             
            try (InputStream fileContent = filePart1.getInputStream()) {
                Files.copy(fileContent, file1.toPath());
                
            }
            immagineDao.insertImmagine(new Immagine(filename1));
            return immagineDao.getImmagine(filename1).getIdImmagine();
        }
        return -1;
    }

}
