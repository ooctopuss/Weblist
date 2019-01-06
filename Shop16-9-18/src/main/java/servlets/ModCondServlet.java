/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.daos.Utente_has_ListaSpesaDAO;
import db.entities.Utente_has_ListaSpesa;
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
public class ModCondServlet extends HttpServlet {
    private Utente_has_ListaSpesaDAO utLDao;
   
    
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            
            utLDao = daoFactory.getDAO(Utente_has_ListaSpesaDAO.class);
   
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
        int idUtente = Integer.parseInt(request.getParameter("idUtente"));
        int idLista = Integer.parseInt(request.getParameter("idLista"));
        int modCat = 0;
        int aggProd = 0;
        int elProd = 0;
        int elLista = 0;
        int annulla = 0;
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
        if(request.getParameter("annulla") != null){
           annulla = 1;
        }
        
        
        if(annulla == 1){
            utLDao.deleteUtente_has_ListaSpesa(idUtente, idLista);
        }else{
            utLDao.update(new Utente_has_ListaSpesa(idUtente,idLista,0,modCat,aggProd,elProd,elLista));
        }
        response.sendRedirect("pages/Lista.jsp?adascaowdwd="+idLista);

    }

   

}
