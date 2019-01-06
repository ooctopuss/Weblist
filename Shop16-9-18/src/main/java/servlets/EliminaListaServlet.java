/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.daos.AccessoChatDAO;
import db.daos.ListaSpesaDAO;
import db.daos.ProdottoDAO;
import db.entities.Utente;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author octopussy
 */

public class EliminaListaServlet extends HttpServlet {
    private ListaSpesaDAO listaDao;
    private ProdottoDAO prodDao;
    private AccessoChatDAO accDao;
   
    
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            accDao = daoFactory.getDAO(AccessoChatDAO.class);
            listaDao = daoFactory.getDAO(ListaSpesaDAO.class);
            prodDao = daoFactory.getDAO(ProdottoDAO.class);
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
        HttpSession session=request.getSession(); 
        int idLista = Integer.parseInt(request.getParameter("idList"));
        prodDao.deleteProdottoLista(idLista);
        Utente ut = (Utente) session.getAttribute("utente");
        if(ut != null){
            accDao.deleteAccessoChat(idLista, ut.getId());
        }
        listaDao.deleteListaSpesa(idLista);
        
        if(session.getAttribute("utenteAnon")!= null && (int)session.getAttribute("utenteAnon") == idLista){
            Cookie cLista = new Cookie("ListaSpesa", null);
            cLista.setMaxAge(0);
            response.addCookie(cLista);
            session.setAttribute("utenteAnon",null);
            response.sendRedirect(request.getContextPath() + "/HomeU.jsp");

        }else{
            response.sendRedirect(request.getContextPath() + "/pages/chkListe.jsp");
        }

    }

    

}
