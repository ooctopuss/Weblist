/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Tools.Email;
import Tools.Escape;
import db.daos.AccessoChatDAO;
import db.daos.ListaSpesaDAO;
import db.daos.UtenteDAO;
import db.daos.Utente_has_ListaSpesaDAO;
import db.entities.AccessoChat;
import db.entities.Utente;
import db.entities.Utente_has_ListaSpesa;
import db.exceptions.DAOException;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Safouane
 */
public class CondListaServlet extends HttpServlet {
    private UtenteDAO utenteDao;
    private Utente_has_ListaSpesaDAO utLDao;
    private AccessoChatDAO accDao;
    private Email emailInv = new Email();
    private ListaSpesaDAO listaDao;
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            listaDao = daoFactory.getDAO(ListaSpesaDAO.class);
            utenteDao = daoFactory.getDAO(UtenteDAO.class);
            utLDao = daoFactory.getDAO(Utente_has_ListaSpesaDAO.class);
            accDao = daoFactory.getDAO(AccessoChatDAO.class);
   
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
        int idLista = Integer.parseInt(request.getParameter("idL"));
        int modCat = 0;
        int aggProd = 0;
        int elProd = 0;
        int elLista = 0;
        if(request.getParameter("modCat") != null){
            modCat = 1;
        }
        if(request.getParameter("aggProd") != null){
            aggProd = 1;
        }
        if(request.getParameter("elProd") != null){
            elProd = 1;
        }
        if(request.getParameter("elLista") != null){
            elLista = 1;
        }
        Utente ut = null;
         try {
             ut = utenteDao.getUtente(email);
         } catch (DAOException ex) {
             Logger.getLogger(CondListaServlet.class.getName()).log(Level.SEVERE, null, ex);
         }
         
        
        if(ut == null){
            response.sendRedirect("pages/Lista.jsp?adascaowdwd="+idLista+"&u="+1);
        }else{
            try {
                if(utLDao.getUtente_has_ListaSpesa(ut.getId(), idLista) != null){
                    response.sendRedirect("pages/Lista.jsp?adascaowdwd="+idLista+"&u="+2);
                }else{
                    utLDao.insertUtente_has_ListaSpesa(new Utente_has_ListaSpesa(ut.getId(),idLista,0,modCat,aggProd,elProd,elLista));
                    accDao.insertAccessoChat(new AccessoChat(idLista,ut.getId()));
                    emailInv.inviaEmail(request, ut, 0,listaDao.getByPrimaryKey(idLista).getNome());
                    response.sendRedirect("pages/Lista.jsp?adascaowdwd="+idLista);
                }
            } catch (DAOException ex) {
                Logger.getLogger(CondListaServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
}
