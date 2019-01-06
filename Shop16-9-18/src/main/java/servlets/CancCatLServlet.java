/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.daos.CategoriaListaDAO;
import db.daos.ImmagineDAO;
import db.entities.Immagine;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Safouane
 */
public class CancCatLServlet extends HttpServlet {
    private CategoriaListaDAO catLDao;
    private String uploadDir;
    private ImmagineDAO immDao;
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            immDao = daoFactory.getDAO(ImmagineDAO.class);
            catLDao = daoFactory.getDAO(CategoriaListaDAO.class);
            
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
        int id = Integer.parseInt(request.getParameter("idCatL"));
        File file;
        List<Immagine> immagini = immDao.getAllImmaginiCategoriaLista(id);
        for(int i = 0; i< immagini.size();i++){
            file = new File(uploadDir+"\\"+immagini.get(i).getIndirizzo());
            file.delete();
        }
        
        HttpSession session = request.getSession(false);
        session.setAttribute("categorieL",null);
         
        
        catLDao.deleteCategoriaLista(id);
        response.sendRedirect("pages/CategListe.jsp");
       
    }


}
