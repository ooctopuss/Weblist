/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Tools.Escape;

import db.daos.MessaggioDAO;
import db.entities.Messaggio;
import db.entities.Utente;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Safouane
 */
public class inviaMessaggioServlet extends HttpServlet {
    
    private MessaggioDAO messaggioDao;
    
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
           
            messaggioDao = daoFactory.getDAO(MessaggioDAO.class);
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
        
        HttpSession session = request.getSession();
        Utente ut = (Utente) session.getAttribute("utente");
        String mex = Escape.escapeMetaCharacters(request.getParameter("messaggio"));
        int idLista = Integer.parseInt(request.getParameter("idLista"));
        if(mex.length() > 0){
            if(mex.length() > 140){
                int c = 0;
                for(int i = 0 ; i <= (int)mex.length()/140;i++ ){
                    if(i == (int)(mex.length()/140)){
                        messaggioDao.insertMessaggio(new Messaggio(mex.substring(c, mex.length()),idLista,ut.getId()));
                        c = c+ 140+1;
                    }else{
                        messaggioDao.insertMessaggio(new Messaggio(mex.substring(c, c+140),idLista,ut.getId()));
                        c = c+ 140;
                    }
                }
            }else{
                Messaggio messaggio = new Messaggio();

                messaggio.setListaSpesa_idListaSpesa(idLista);
                messaggio.setUtente_idUtente(ut.getId());
                messaggio.setMessaggio(mex);

                messaggioDao.insertMessaggio(messaggio);

            }
        }
        
    }
}
