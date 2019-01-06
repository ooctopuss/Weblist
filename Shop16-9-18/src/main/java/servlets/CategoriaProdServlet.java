/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.daos.CategoriaProdottoDAO;
import db.daos.LogoDAO;
import db.entities.CategoriaProdotto;
import db.exceptions.DAOException;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.IOException;
import java.util.List;
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
public class CategoriaProdServlet extends HttpServlet {
    private String uploadDir;
    private LogoDAO logoDao;
    private CategoriaProdottoDAO categProdottoDao;
    private List<CategoriaProdotto> categorie;

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
        uploadDir = getServletContext().getInitParameter("uploadDir");
        if (uploadDir == null) {
            throw new ServletException("Please supply uploadDir parameter");
        }
     
    }
  

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            categorie = categProdottoDao.getAll();
        } catch (DAOException ex) {
            Logger.getLogger(CategoriaProdServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpSession session=request.getSession(); 
       
            session.setAttribute("categorieCP",categorie);  
        
            session.setAttribute("logoDaoCP",logoDao);
       
            session.setAttribute("uploadDir", uploadDir);
        request.getRequestDispatcher("pages/CategProdotto.jsp").include(request, response);
    }
}    
        