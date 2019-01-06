/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Tools.Escape;
import db.daos.AccessoChatDAO;
import db.daos.UtenteDAO;
import db.daos.Utente_has_ListaSpesaDAO;
import db.entities.AccessoChat;
import db.entities.Utente;
import db.entities.Utente_has_ListaSpesa;
import db.exceptions.DAOException;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.mail.Authenticator;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.Session;
import javax.mail.PasswordAuthentication;
import javax.mail.Multipart;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
/**
 *
 * @author octopussy
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {
    private UtenteDAO utenteDao;
    private Utente_has_ListaSpesaDAO utLDao;
    private AccessoChatDAO accDao;

    
    
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            utenteDao = daoFactory.getDAO(UtenteDAO.class);
            utLDao = daoFactory.getDAO(Utente_has_ListaSpesaDAO.class);
            accDao = daoFactory.getDAO(AccessoChatDAO.class);

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
        request.getRequestDispatcher("login.jsp").include(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        try {
            String nome= Escape.escapeMetaCharacters(request.getParameter("nome"));
            String cognome = Escape.escapeMetaCharacters(request.getParameter("cognome"));
            String email = Escape.escapeMetaCharacters(request.getParameter("email"));
            String password = Escape.escapeMetaCharacters(request.getParameter("password1"));
            HttpSession sessions=request.getSession();  
                        
            int idLista = -2;
            if(sessions.getAttribute("utenteAnon") != null){
                idLista =(int) sessions.getAttribute("utenteAnon");
            }
            
            Utente utente = new Utente(nome,cognome,email,password,0);
            boolean check = utente.mailSyntaxCheck(email);
            Utente us = utenteDao.getUtente(email);
            int random;
            do{
                random = (int )(Math.random() * 500000000 + 1000000);
            }while(utenteDao.checkUtenteIden(random) == true);
            utente.setIdentificativo(random);
            
            if((check == true) && (us == null)){
                utente.setPassword(utente.getPasswordEncrypt(password));
                utenteDao.insertUtente(utente);
                if(idLista != -2){
                    if(request.getParameter("importa") != null){
                        utLDao.insertUtente_has_ListaSpesa(new Utente_has_ListaSpesa(utenteDao.getUtente(email).getId(),idLista,1,1,1,1,1));
                        accDao.insertAccessoChat(new AccessoChat(idLista,utenteDao.getUtente(email).getId()));

                        Cookie cLista = new Cookie("ListaSpesa", null);
                        cLista.setMaxAge(0);
                        response.addCookie(cLista);
                        sessions.setAttribute("utenteAnon",null);
                    }
                }
               
               String message ="Per completare la registrazione premere il seguente link http://localhost:8080/Shop16-9-18/ConfermaEmailServlet?oriacieodawdw="+random+"";
               StringBuilder plainTextMessageBuilder = new StringBuilder();
               plainTextMessageBuilder.append(message).append("\n");
               StringBuilder htmlMessageBuilder = new StringBuilder();
               message = message.replace(" ", "&nbsp;");
               message = message.replace("\n", "<br>");
               htmlMessageBuilder.append(message).append("<br>");
               final String host = getServletContext().getInitParameter("smtp-hostname");
               final String port = getServletContext().getInitParameter("smtp-port");
               final String username = getServletContext().getInitParameter("smtp-username");
               final String passwor = getServletContext().getInitParameter("smtp-password");
               Properties props = System.getProperties();
               props.setProperty("mail.smtp.host", host);
               props.setProperty("mail.smtp.port", port);
               props.setProperty("mail.smtp.socketFactory.port", port);
               props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
               props.setProperty("mail.smtp.auth", "true");
               props.setProperty("mail.smtp.starttls.enable", "true");
               props.setProperty("mail.debug", "true");
               Session session = Session.getInstance(props, new Authenticator() {
                   @Override
                   protected PasswordAuthentication getPasswordAuthentication() {
                       return new PasswordAuthentication(username, passwor);
                   }
                   
               });
               try {
                   Multipart multipart = new MimeMultipart("alternative");
                   
                   BodyPart messageBodyPart1 = new MimeBodyPart();
                   messageBodyPart1.setText(plainTextMessageBuilder.toString());
                   
                   BodyPart messageBodyPart2 = new MimeBodyPart();
                   messageBodyPart2.setContent(htmlMessageBuilder.toString(), "text/html; charset=utf-8");
                   
                   multipart.addBodyPart(messageBodyPart1);
                   multipart.addBodyPart(messageBodyPart2);
                   
                   Message msg = new MimeMessage(session);
                   msg.setFrom(new InternetAddress(username, "WebList conferma email"));
                   msg.setRecipients(Message.RecipientType.TO, new InternetAddress[]{new InternetAddress(utente.getEmail(), (utente.getNome() + " " + utente.getCognome()).trim())});
                   msg.setSubject("Registrazione");
                   msg.setSentDate(new Date());
                   msg.setContent(multipart);
                   
                   Transport.send(msg);
                   
                   request.setAttribute("emailSent", true);
                   
                   if (!response.isCommitted()) {
                        response.sendRedirect("mailInviata.jsp");
                   }
                } catch (MessagingException | UnsupportedEncodingException me) {
                   Logger.getLogger(getClass().getName()).severe(me.toString());
                   
                   request.setAttribute("emailSent", false);
                   request.setAttribute("emailError", me.getMessage());
                   if (!response.isCommitted()) {
                      response.sendRedirect("HomeU.jsp");
                   }
               }   
            }else{
                if(check == false){
                    request.setAttribute("erroreSintassi",true);
                    request.getRequestDispatcher("HomeU.jsp").include(request, response); 
                   
                }else{
                    request.setAttribute("emailPresente",true);
                    request.getRequestDispatcher("HomeU.jsp").include(request, response); 
                }
            }  
        } catch (DAOException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

 

}
