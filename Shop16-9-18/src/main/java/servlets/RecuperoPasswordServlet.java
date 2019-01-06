/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Tools.Escape;
import db.daos.UtenteDAO;
import db.entities.Utente;
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
import org.apache.commons.lang.RandomStringUtils;

/**
 *
 * @author octopussy
 */
public class RecuperoPasswordServlet extends HttpServlet {
    private UtenteDAO utenteDao;
   
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            utenteDao = daoFactory.getDAO(UtenteDAO.class);
            
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
        Utente ut = null;
        try {
             ut = utenteDao.getUtente(email);
        } catch (DAOException ex) {
            Logger.getLogger(RecuperoPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(ut != null){
            String psw = generateRandomPsw();
            String psw1= ut.getPasswordEncrypt(psw);
           
            ut.setPassword(psw1);
            utenteDao.updatePsw(psw1, email);
            
            String message = "Per il recupero della password ecco una password temporanea. Ricordati di cambiarla una volta che ti sei loggato.\n Email:"+ut.getEmail()+"\n"+"Password: "+psw+"\n";
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
                msg.setFrom(new InternetAddress(username, "WebList - Recupero password"));
                msg.setRecipients(Message.RecipientType.TO, new InternetAddress[]{new InternetAddress(ut.getEmail(), (ut.getNome() + " " + ut.getCognome()).trim())});
                msg.setSubject("WebList - Recupero password");
                msg.setSentDate(new Date());
                msg.setContent(multipart);

                Transport.send(msg);

                

                if (!response.isCommitted()) {
                    
                    response.sendRedirect("HomeU.jsp");
                }
            } catch (MessagingException | UnsupportedEncodingException me) {
                Logger.getLogger(getClass().getName()).severe(me.toString());
                if (!response.isCommitted()) {
                    response.sendRedirect("HomeU.jsp");
                }
            }
        }else{
            request.setAttribute("emailErrata", true);
            response.sendRedirect("HomeU.jsp");
        }
    }
    public static String generateRandomPsw() {
        String filename = "";
       
        String rndchars = RandomStringUtils.randomAlphanumeric(25);
        filename = rndchars;
        return filename;
    }

    

}
