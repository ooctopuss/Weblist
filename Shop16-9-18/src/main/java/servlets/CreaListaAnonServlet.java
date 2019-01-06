/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Tools.Escape;
import db.daos.ImmagineDAO;
import db.daos.ListaSpesaDAO;
import db.entities.Immagine;
import db.entities.ListaSpesa;
import db.exceptions.DAOException;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
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
public class CreaListaAnonServlet extends HttpServlet {
    private String uploadDir;
    private ListaSpesaDAO listaDao;
    private ImmagineDAO immaginiDao;
   
    
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            immaginiDao = daoFactory.getDAO(ImmagineDAO.class);
            listaDao = daoFactory.getDAO(ListaSpesaDAO.class);
   
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
        Cookie[] cookies=request.getCookies();
        String lista = null;
        
        if (cookies != null){
            for (Cookie cookie : cookies) {
                if(cookie.getName().equals("ListaSpesa")) 
                    lista = cookie.getValue();
            }
        }
        if(lista == null){
            String nome = Escape.escapeMetaCharacters(request.getParameter("nome"));
            String descrizione = Escape.escapeMetaCharacters(request.getParameter("descrizione"));
            int idCategoriaLista = Integer.parseInt(request.getParameter("catL"));
            int idImmagine = caricaImm(request,immaginiDao);
            
            listaDao.insertListaSpesa(new ListaSpesa(nome,descrizione,idCategoriaLista,idImmagine));
            ListaSpesa l = null;
      
            try {
                 l = listaDao.getListaImmagine(idImmagine);

            } catch (DAOException ex) {
                Logger.getLogger(CreaListaServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            Cookie cLista = new Cookie("ListaSpesa", ""+l.getId());
            cLista.setMaxAge(60 * 60 * 24 * 15);//15 days
            response.addCookie(cLista);
            HttpSession session=request.getSession();  
                session.setAttribute("utenteAnon",l.getId());  
            response.sendRedirect("pages/Lista.jsp?adascaowdwd="+l.getId());
        }else{
            response.sendRedirect("pages/Lista.jsp?adascaowdwd="+Integer.parseInt(lista));
        }
    }
    
    public int caricaImm(HttpServletRequest request,ImmagineDAO immagineDao) throws IOException, ServletException{
        File uploadDirFile = new File(uploadDir);
        
        Part filePart1 = request.getPart("immagine");
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
