/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.daos.AccessoChatDAO;
import db.daos.ImmagineDAO;
import db.daos.MessaggioDAO;
import db.daos.UtenteDAO;
import db.entities.AccessoChat;
import db.entities.Immagine;
import db.entities.Messaggio;
import db.entities.Utente;
import db.exceptions.DAOException;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.IOException;
import java.sql.Timestamp;
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
public class messaggiServlet extends HttpServlet {
    
    private UtenteDAO utenteDao;
    private MessaggioDAO messaggioDao;
    private ImmagineDAO immagineDao;
    private AccessoChatDAO accDao;
    
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            accDao = daoFactory.getDAO(AccessoChatDAO.class);
            utenteDao = daoFactory.getDAO(UtenteDAO.class);
            messaggioDao = daoFactory.getDAO(MessaggioDAO.class);
            immagineDao = daoFactory.getDAO(ImmagineDAO.class);
        } catch (DAOFactoryException ex) {
            throw new ServletException("Impossible to get dao factory for user storage system", ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        int idLista = Integer.parseInt(request.getParameter("idLista"));
        
        Utente ut = (Utente) session.getAttribute("utente");
        List<Messaggio> messaggi = null;
        Immagine im = null;
        Immagine imM = null;
        List<Utente> utenti = null;
        Utente utM = null;
        
        Date date= new Date();
        long time = date.getTime();
        Timestamp ultimo= new Timestamp(time);
        try {
            utenti = utenteDao.getAll();
        } catch (DAOException ex) {
            Logger.getLogger(messaggiServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        accDao.updateAccessoChat(new AccessoChat(idLista,ut.getId(),ultimo));
        try {
            messaggi = messaggioDao.getAllMessaggioLista(idLista);
        } catch (DAOException ex) {
            Logger.getLogger(messaggiServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.setContentType("text/html");
        response.getWriter().write("<div class=\"card-body msg_card_body\">");
        for (int i=0; i < messaggi.size();i++) {
            if(ut.getId() == messaggi.get(i).getUtente_idUtente()){
                try {
                    im = immagineDao.getByPrimaryKey(ut.getAvatar());
                } catch (DAOException ex) {
                    Logger.getLogger(messaggiServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                response.getWriter().write("<div class=\"d-flex justify-content-end mb-4\">\n" +
"		<div class=\"msg_cotainer_send  d-none d-lg-block\"><p align=\"center\">" +messaggi.get(i).getMessaggio()+
"			</p><font size=\"1px\" color=\"white\"><p align=\"center\"> <font size=\"3px\" color=\"#ff4949\">@"+ut.getNome()+" "+ut.getCognome()+"</font><br />"+ messaggi.get(i).getOraInvio()+"</p></font>\n" +
"		</div>\n");
                String mex = messaggi.get(i).getMessaggio();
                response.getWriter().write("<div class=\"msg_cotainer_send d-lg-none\"><p align=\"center\">");
                if(mex.length() > 20){
                    int c = 0;
                    for(int p = 0 ; p <= (int)mex.length()/20;p++ ){
                        if(p == (int)(mex.length()/20)){
                            response.getWriter().write(mex.substring(c, mex.length())+"<br />");
                            c = c+ 20+1;
                        }else{
                            response.getWriter().write(mex.substring(c, c+20)+"<br />");
                            c = c+ 20;
                        }
                    }
                }else{
                                        response.getWriter().write( messaggi.get(i).getMessaggio());

                
                }
                response.getWriter().write("</p><font size=\"1px\" color=\"white\"><p align=\"center\"> <font size=\"3px\" color=\"#ff4949\">@"+ut.getNome()+" "+ut.getCognome()+"</font><br />"+ messaggi.get(i).getOraInvio()+"</p></font>\n" +
"		</div>\n" +
"		<div class=\"img_cont_msg\">\n" +
"			<img height=\"50\" width=\"50\" src='"+session.getAttribute("uploadDir")+"\\"+ im.getIndirizzo() +"' class=\"rounded-circle user_img_msg\">\n" +
"		</div>\n" +
"	</div>");
                        
            } else {
                for(int j = 0; j< utenti.size();j++){
                        if(utenti.get(j).getId() == messaggi.get(i).getUtente_idUtente()){
                            utM = utenti.get(j);
                        }
                    }
                    try {
                        imM = immagineDao.getByPrimaryKey(utM.getAvatar());
                    } catch (DAOException ex) {
                        Logger.getLogger(messaggiServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                    response.getWriter().write("<div class=\"d-flex justify-content-start mb-4\">\n" +
                    "		<div class=\"img_cont_msg\">\n" +
                    "			<img height=\"50\" width=\"50\" src='"+session.getAttribute("uploadDir")+"\\"+ imM.getIndirizzo() +"' class=\"rounded-circle user_img_msg\">\n" +
                    "		</div>\n" +
                    "		<div class=\"msg_cotainer d-none d-lg-block\"><p align=\"center\">" + messaggi.get(i).getMessaggio()+ "\n" +
                    "			</p><font size=\"1px\" color=\"white\"><p align=\"center\"> <font size=\"3px\" color=\"#ff4949\">@"+utM.getNome()+" "+utM.getCognome()+"</font><br />"+messaggi.get(i).getOraInvio()+"</p></font>\n" +
                    "		</div>\n");
                    response.getWriter().write("		<div class=\"msg_cotainer d-lg-none\"><p align=\"center\">");
                     String mex = messaggi.get(i).getMessaggio();
                    if(mex.length() > 20){
                        int c = 0;
                        for(int p = 0 ; p <= (int)mex.length()/20;p++ ){
                            if(p == (int)(mex.length()/20)){
                                response.getWriter().write(mex.substring(c, mex.length())+"<br />");
                                c = c+ 20+1;
                            }else{
                                response.getWriter().write(mex.substring(c, c+20)+"<br />");
                                c = c+ 20;
                            }
                        }
                    }else{
                    response.getWriter().write( messaggi.get(i).getMessaggio());
                    }
                    response.getWriter().write("</p><font size=\"1px\" color=\"white\"><p align=\"center\"> <font size=\"3px\" color=\"#ff4949\">@"+utM.getNome()+" "+utM.getCognome()+"</font><br />"+ messaggi.get(i).getOraInvio() +"</p></font>\n" +
                    "		</div>\n"+
                    "               </div>");

            }
                
            
        }
        response.getWriter().write("</div>");
    }
}
               
                    

        
    


