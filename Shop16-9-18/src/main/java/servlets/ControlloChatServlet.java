/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.daos.AccessoChatDAO;
import db.daos.ImmagineDAO;
import db.daos.ListaSpesaDAO;
import db.daos.MessaggioDAO;
import db.daos.UtenteDAO;
import db.daos.Utente_has_ListaSpesaDAO;
import db.entities.ListaSpesa;
import db.entities.Messaggio;
import db.entities.Utente;
import db.entities.Utente_has_ListaSpesa;
import db.exceptions.DAOException;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
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
 * @author Safouane
 */
public class ControlloChatServlet extends HttpServlet {
    private ListaSpesaDAO listaDao;
    private MessaggioDAO messaggioDao;
    private ImmagineDAO immagineDao;
    private AccessoChatDAO accDao;
    private Utente_has_ListaSpesaDAO utLDao;
    
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            utLDao = daoFactory.getDAO(Utente_has_ListaSpesaDAO.class);
            accDao = daoFactory.getDAO(AccessoChatDAO.class);
            listaDao = daoFactory.getDAO(ListaSpesaDAO.class);
            messaggioDao = daoFactory.getDAO(MessaggioDAO.class);
            immagineDao = daoFactory.getDAO(ImmagineDAO.class);
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
        if(ut != null){
            List<Utente_has_ListaSpesa> utLS = new ArrayList();
            int idLista;
            boolean nuovo = false;
            int idUtente = ut.getId();
            List<Messaggio> messaggi = new ArrayList();

            String uploadDir = (String) session.getAttribute("uploadDir");
            try {
                utLS = utLDao.getAllListUtente(ut.getId());
            } catch (DAOException ex) {
                Logger.getLogger(ControlloChatServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.setContentType("text/html");

            for(int i=0;i < utLS.size();i++){
                if(utLS.get(i).getIdUtente() == idUtente){
                    idLista = utLS.get(i).getIdListaSpesa();
                    try {
                        messaggi = messaggioDao.getMessaggioNuovo(idLista,accDao.getAccessoChat(idLista, idUtente).getUltimo());
                    } catch (DAOException ex) {
                        Logger.getLogger(ControlloChatServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    if(messaggi.size()>0){
                        nuovo = true;
                    }
                }
            }


            if(nuovo == false){
                response.getWriter().write("<li class=\"nav-item dropdown text-center\"><a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n" +
    "                                    <img src=\"../TemplateAvatar/chat1.png\" width=\"25\" height=\"25\" />\n" +
    "                                </a><div class=\"dropdown-menu dropdown-menu-right\" aria-labelledby=\"navbarDropdownMenuLink\" >");
            }else{
                response.getWriter().write("<li class=\"nav-item dropdown text-center\"><a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n" +
    "                                    <img src=\"../TemplateAvatar/chat2.png\" width=\"25\" height=\"25\" />\n" +
    "                                </a><div class=\"dropdown-menu dropdown-menu-right\" aria-labelledby=\"navbarDropdownMenuLink\" >");
            }
            if(utLS.size() > 0){
                for(int i=0;i < utLS.size();i++){

                    if(utLS.get(i).getIdUtente() == idUtente){
                        idLista = utLS.get(i).getIdListaSpesa();
                        try {
                            messaggi = messaggioDao.getMessaggioNuovo(idLista,accDao.getAccessoChat(idLista, idUtente).getUltimo() );
                        } catch (DAOException ex) {
                            Logger.getLogger(ControlloChatServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        if(messaggi.size()>0){
                            try {
                                response.getWriter().write("<a class=\"nav-link text-center\" style=\"background:#7bb8c4\" href=\"Chat.jsp?list="+idLista+"\"><img src=\""+uploadDir+"\\"+immagineDao.getByPrimaryKey(listaDao.getListaSpesa(idLista).getIdImmagine()).getIndirizzo()+"\" draggable=\"false\" width=\"25\" height=\"25\"/>"+listaDao.getByPrimaryKey(idLista).getNome()+"<div class=\"dropdown-divider\"></div>");
                            } catch (DAOException ex) {
                                Logger.getLogger(ControlloChatServlet.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }else{
                            try {
                                response.getWriter().write("<a class=\"nav-link text-center\" style=\"background:white\" href=\"Chat.jsp?list="+idLista+"\"><img src=\""+uploadDir+"\\"+immagineDao.getByPrimaryKey(listaDao.getListaSpesa(idLista).getIdImmagine()).getIndirizzo()+"\" draggable=\"false\" width=\"25\" height=\"25\"/>"+listaDao.getByPrimaryKey(idLista).getNome()+"<div class=\"dropdown-divider\"></div>");
                            } catch (DAOException ex) {
                                Logger.getLogger(ControlloChatServlet.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                    }
                }
                response.getWriter().write("</div></li>");
            }else{
                response.getWriter().write("<a class=\"nav-link text-center\" href=\"\">NESSUNA CHAT PRESENTE</a>\n" +
"                                </div>\n" +
"                            </li>");            
            
            }



        }
    }
        
}
