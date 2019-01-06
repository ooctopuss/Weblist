/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Tools.Escape;
import db.daos.UtenteDAO;
import db.entities.Utente;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author octopussy
 */
public class ModPswServlet extends HttpServlet {
    private UtenteDAO utenteDao;
    
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            utenteDao = daoFactory.getDAO(UtenteDAO.class);
        } catch (DAOFactoryException ex) {
            throw new ServletException("Impossible to get dao factory for user storage system", ex);
        }
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
        String pss1 = Escape.escapeMetaCharacters(request.getParameter("password1"));
        String pss2 = Escape.escapeMetaCharacters(request.getParameter("password2"));
        
        Utente ut = new Utente();
        if(pss2.compareTo(pss1) != 0){
            request.setAttribute("errorMessage", "Invalid user or password");
            request.getRequestDispatcher("Account.jsp").forward(request, response);
        
        }else{
            pss2 = ut.getPasswordEncrypt(pss1);
            
            utenteDao.updatePsw(pss2, email);
        }
        response.sendRedirect("pages/Account.jsp");
    }

    

}
