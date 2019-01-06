/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.daos.ListaSpesa_has_ProdottoDAO;
import db.daos.ScadenzaDAO;
import db.daos.UtenteDAO;
import db.entities.ListaSpesa_has_Prodotto;
import db.entities.Scadenza;
import db.exceptions.DAOException;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.IOException;

import java.sql.Time;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;


import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Safouane
 */
@MultipartConfig
public class CheckProdServlet extends HttpServlet {
    private ListaSpesa_has_ProdottoDAO listaPDao;
    private ScadenzaDAO scadDao;
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            
            listaPDao = daoFactory.getDAO(ListaSpesa_has_ProdottoDAO.class);
            scadDao = daoFactory.getDAO(ScadenzaDAO.class);
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
        int idProdotto = Integer.parseInt(request.getParameter("idProdottoC"));
        int idLista = Integer.parseInt(request.getParameter("idL"));
        ListaSpesa_has_Prodotto lp = null;
        Scadenza scad = null;
        Time time;
   
        try {
            lp = listaPDao.getLista(idProdotto,idLista);
        } catch (DAOException ex) {
            Logger.getLogger(CheckProdServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(lp.getChecked() == 1){
            listaPDao.updateListaP(new ListaSpesa_has_Prodotto(idLista,idProdotto,0));
        }else{
            listaPDao.updateListaP(new ListaSpesa_has_Prodotto(idLista,idProdotto,1));
            try {
                scad = scadDao.getScadenza(idProdotto, idLista);
            } catch (DAOException ex) {
                Logger.getLogger(CheckProdServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(scad == null){
                time = new java.sql.Time(System.currentTimeMillis());
                scadDao.insertScadenza(new Scadenza(idProdotto,idLista,0,1,time,time,0));
            }else{
                int media = scad.getMedia();
                int contatore = scad.getContatore();
                contatore ++;
                
                LocalTime primo = scad.getPrimo().toLocalTime();
                LocalTime ultimo = LocalTime.now();
                LocalTime diff= ultimo.minusNanos(primo.toNanoOfDay());
                
                int sec = diff.toSecondOfDay();
                media = sec/contatore;
                
                scadDao.updateScadenza(new Scadenza(idProdotto,idLista,media,contatore,Time.valueOf(primo),Time.valueOf(ultimo),1));
            }
        }
        HttpSession session = request.getSession(false);
        session.setAttribute("listeP",null);
        
        response.sendRedirect(request.getContextPath() + "/pages/Lista.jsp?adascaowdwd="+idLista+"&cont="+0);
        
    }

   

}
