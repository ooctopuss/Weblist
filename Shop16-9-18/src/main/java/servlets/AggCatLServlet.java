/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Tools.Escape;
import db.daos.CategoriaListaDAO;
import db.daos.ImmagineDAO;
import db.daos.TypesDAO;
import db.entities.CategoriaLista;
import db.entities.Immagine;
import db.entities.Types;
import db.exceptions.DAOException;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Safouane
 */
@MultipartConfig
public class AggCatLServlet extends HttpServlet {

    private String uploadDir;
    private CategoriaListaDAO catLDao;
    private ImmagineDAO immaginiDao;
    private TypesDAO tipoDao;
    
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            
            immaginiDao = daoFactory.getDAO(ImmagineDAO.class);
            catLDao = daoFactory.getDAO(CategoriaListaDAO.class);
            tipoDao = daoFactory.getDAO(TypesDAO.class);
            
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
        
        
        int idTypes = Integer.parseInt(request.getParameter("nome"));
        String descrizione =  Escape.escapeMetaCharacters(request.getParameter("descrizione"));
        
        Types t = null;
        try {
            t = tipoDao.getByPrimaryKey(idTypes);
        } catch (DAOException ex) {
            Logger.getLogger(AggCatLServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        HttpSession session = request.getSession(false);
        session.setAttribute("categorieL", null);
        
        
        catLDao.insertCategoriaLista(new CategoriaLista(t.getNomeIt(),descrizione,idTypes));
        try {
            caricaMultImm(request,immaginiDao,catLDao.getCatIdTypes(idTypes).getId());
        } catch (DAOException ex) {
            Logger.getLogger(AggCatLServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("pages/CategListe.jsp");
       
        
    }
    
  
    public void caricaMultImm(HttpServletRequest request,ImmagineDAO immagineDao, int idCategoriaLista) throws IOException, ServletException{
        File uploadDirFile = new File(uploadDir);
        List<Part> multiFileParts = request.getParts().stream().filter(part -> "immagine".equals(part.getName())).collect(Collectors.toList());
        if ((multiFileParts != null) && !multiFileParts.isEmpty()) {
            for (Part multiFilePart : multiFileParts) {
                String filename1 = Paths.get(multiFilePart.getSubmittedFileName()).getFileName().toString();
                String formato = filename1.substring(filename1.indexOf("."));
            
                do{
                    filename1 = Immagine.generateUniqueFileName();
                    filename1 = filename1+formato;
                }while(immagineDao.getImmagine(filename1) != null);
                File file = new File(uploadDirFile, filename1);
                try (InputStream fileContent = multiFilePart.getInputStream()) {
                    Files.copy(fileContent, file.toPath());
                }
                immagineDao.insertImmagineCategoriaLista(new Immagine(filename1,idCategoriaLista,0));
            }   
        }else{
            immagineDao.insertImmagineCategoriaLista(new Immagine(immagineDao.getAllImmaginiCategoriaLista(idCategoriaLista).get(0).getIndirizzo(),idCategoriaLista,0));
        }
    }

    

}
