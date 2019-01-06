/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.daos.ListaSpesa_has_ProdottoDAO;
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
public class rimuoviProdServlet extends HttpServlet {
    private ListaSpesa_has_ProdottoDAO listaPDao;
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            
            listaPDao = daoFactory.getDAO(ListaSpesa_has_ProdottoDAO.class);
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
        int idProd = Integer.parseInt(request.getParameter("idProdotto"));
        int idLista = Integer.parseInt(request.getParameter("idList"));
        listaPDao.deleteListaP(idLista, idProd);
        response.sendRedirect(request.getContextPath() + "/pages/Lista.jsp?adascaowdwd="+idLista);
    }

    

}
