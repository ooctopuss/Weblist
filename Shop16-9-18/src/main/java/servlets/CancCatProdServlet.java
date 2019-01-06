/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.daos.CategoriaProdottoDAO;
import db.daos.LogoDAO;
import db.exceptions.DAOException;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author octopussy
 */
public class CancCatProdServlet extends HttpServlet {
    private CategoriaProdottoDAO catPDao;
    private LogoDAO logDao;
    private String uploadDir;
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            
            catPDao = daoFactory.getDAO(CategoriaProdottoDAO.class);
            
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
        int id = Integer.parseInt(request.getParameter("idCatProdotto"));
        HttpSession session = request.getSession(false);
        session.setAttribute("categorieP",null);
        session.setAttribute("prodotti", null);
        File file;
         try {
            file = new File(uploadDir+"\\"+logDao.getByPrimaryKey(catPDao.getByPrimaryKey(id).getIdLogo()));
            file.delete();
        } catch (DAOException ex) {
            Logger.getLogger(CancProdServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        catPDao.deleteCategoriaProdotto(id);
        response.sendRedirect("pages/CategProdotto.jsp");
    }

}
