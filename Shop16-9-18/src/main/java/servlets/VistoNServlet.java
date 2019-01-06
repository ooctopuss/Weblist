/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.daos.ScadenzaDAO;
import Tools.Notifiche;
import db.entities.Scadenza;
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
public class VistoNServlet extends HttpServlet {
    private ScadenzaDAO scadDao;
    
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
           
            scadDao = daoFactory.getDAO(ScadenzaDAO.class);
        } catch (DAOFactoryException ex) {
            throw new ServletException("Impossible to get dao factory for user storage system", ex);
        }
    }
   
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
        doPost(request, response);
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
        int idProdotto = Integer.parseInt(request.getParameter("idProdotto"));
        int idLista = Integer.parseInt(request.getParameter("idLista"));
        Scadenza scaden = null;
        try {
            scaden = scadDao.getScadenza(idProdotto, idLista);
        } catch (DAOException ex) {
            Logger.getLogger(VistoNServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        scaden.setVisto(0);
        scadDao.updateScadenza(scaden);
        scaden.setContEmail(0);
        scadDao.updateContEmail(scaden);
        HttpSession session=request.getSession();
        List<Notifiche> notifiche = (List<Notifiche>)session.getAttribute("notifiche");
        
        for(int i = 0; i < notifiche.size();i++){
            if(notifiche.get(i).getIdProdotto() == idProdotto && notifiche.get(i).getIdLista() == idLista){
                notifiche.remove(i);
            }
        }
        session.setAttribute("notifiche", notifiche);
        if(notifiche.isEmpty())
            session.setAttribute("notif", 0);
        
        response.sendRedirect(request.getContextPath() + "/pages/Lista.jsp?adascaowdwd="+idLista);
    }

    

}
