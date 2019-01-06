/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.daos.ListaSpesa_has_ProdottoDAO;
import db.entities.ListaSpesa_has_Prodotto;
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
 * @author octopussy
 */
public class AggProdLista extends HttpServlet {
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
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        session.setAttribute("listeP",null);
        
        int idLista = Integer.parseInt(request.getParameter("list"));
        int idPro = Integer.parseInt(request.getParameter("pro"));
        
        if(listaPDao.checkListaP(idLista, idPro) == true){
            response.sendRedirect(request.getContextPath() + "/pages/Lista.jsp?adascaowdwd="+idLista+"&cont="+1);
        }else{
            listaPDao.insertListaSpesa(new ListaSpesa_has_Prodotto(idLista,idPro,0));
            response.sendRedirect(request.getContextPath() + "/pages/Lista.jsp?adascaowdwd="+idLista+"&cont="+0);
        
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
        HttpSession session = request.getSession(false);
        session.setAttribute("listeP",null);
        int idLista = Integer.parseInt(request.getParameter("idList"));
        String[] outerArray=request.getParameterValues("autocomplete-2");
        
            for(int i = 0; i< outerArray.length; i++){
                if(listaPDao.checkListaP(idLista, Integer.parseInt(outerArray[i])) == true){
                    response.sendRedirect(request.getContextPath() + "/pages/Lista.jsp?adascaowdwd="+idLista+"&cont="+1);
                }
                listaPDao.insertListaSpesa(new ListaSpesa_has_Prodotto(idLista,Integer.parseInt(outerArray[i]),0));
            }
        
        if(!response.isCommitted()){
            response.sendRedirect(request.getContextPath() + "/pages/Lista.jsp?adascaowdwd="+idLista+"&cont="+0);
        }
    }

   
}
