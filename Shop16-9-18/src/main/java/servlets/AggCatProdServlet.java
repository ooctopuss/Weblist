/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Tools.Escape;
import db.daos.CategoriaProdottoDAO;
import db.daos.LogoDAO;
import db.entities.CategoriaProdotto;
import db.entities.Immagine;
import db.entities.Logo;
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
public class AggCatProdServlet extends HttpServlet {
    
    private LogoDAO logoDao;
    private CategoriaProdottoDAO categProdottoDao;
    private String uploadDir;
    

    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            logoDao =  daoFactory.getDAO(LogoDAO.class);;
            categProdottoDao = daoFactory.getDAO(CategoriaProdottoDAO.class);
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

   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = Escape.escapeMetaCharacters(request.getParameter("nome"));
        String descrizione = Escape.escapeMetaCharacters(request.getParameter("descrizione"));
        int idLogo = caricaLogo(request,logoDao);
        HttpSession session = request.getSession(false);

        session.setAttribute("categorieP",null);
        categProdottoDao.insertCategoriaProdotto(new CategoriaProdotto(nome,descrizione,idLogo));
        
        response.sendRedirect(request.getContextPath() + "/pages/CategProdotto.jsp");
 
        
    }
    public int caricaLogo(HttpServletRequest request,LogoDAO logoDao) throws IOException, ServletException{
        File uploadDirFile = new File(uploadDir);
        
        Part filePart1 = request.getPart("logo");
        if ((filePart1 != null) && (filePart1.getSize() > 0)) {
            String filename1 = Paths.get(filePart1.getSubmittedFileName()).getFileName().toString();//MSIE  fix.
            String formato = filename1.substring(filename1.indexOf("."));
            
            do{
                filename1 = Immagine.generateUniqueFileName();
                filename1 = filename1+formato;
            }while(logoDao.getLogo(filename1) != null);
            File file1 = new File(uploadDirFile, filename1);
             
            try (InputStream fileContent = filePart1.getInputStream()) {
                Files.copy(fileContent, file1.toPath());
                
            }
            
            logoDao.insertLogo(new Logo(filename1));
            int i = logoDao.getLogo(filename1).getId();
            
            return i;
        }
        return -1;
    }

    
}
