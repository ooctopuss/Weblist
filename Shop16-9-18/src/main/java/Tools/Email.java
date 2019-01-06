/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tools;

import db.entities.Utente;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Safouane
 */
public class Email {

    public Email() {
    }
    
    
    public void  inviaEmail(HttpServletRequest request, Utente utente, int tipo, String nomeLista) 
            throws ServletException, IOException{
        HttpSession sessionG=request.getSession();  
        Utente user = (Utente) sessionG.getAttribute("utente");
        //tipo usato per differenziare mail di avviso condivisione della lista spesa se = 0
        //1 = notifica prodotto in scadenza
        String message;
        if(tipo == 0){
            message ="L'utente "+user.getEmail()+" ha condiviso con te la sua lista della spesa '"+nomeLista+"'.";
        }else{
            message ="Hai un nuovo prodotto in scadenza nella lista spesa '"+nomeLista+"'.";
        }
        
        StringBuilder plainTextMessageBuilder = new StringBuilder();
        plainTextMessageBuilder.append(message).append("\n");
        StringBuilder htmlMessageBuilder = new StringBuilder();
        message = message.replace(" ", "&nbsp;");
        message = message.replace("\n", "<br>");
        htmlMessageBuilder.append(message).append("<br>");
        final String host = request.getServletContext().getInitParameter("smtp-hostname");
        final String port = request.getServletContext().getInitParameter("smtp-port");
        final String username = request.getServletContext().getInitParameter("smtp-username");
        final String passwor = request.getServletContext().getInitParameter("smtp-password");
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
        try{
                Multipart multipart = new MimeMultipart("alternative");
                   
                BodyPart messageBodyPart1 = new MimeBodyPart();
                messageBodyPart1.setText(plainTextMessageBuilder.toString());
                  
                BodyPart messageBodyPart2 = new MimeBodyPart();
                messageBodyPart2.setContent(htmlMessageBuilder.toString(), "text/html; charset=utf-8");
                   
                multipart.addBodyPart(messageBodyPart1);
                multipart.addBodyPart(messageBodyPart2);
                   
                Message msg = new MimeMessage(session);
                msg.setFrom(new InternetAddress(username, "WebList "));
                msg.setRecipients(Message.RecipientType.TO, new InternetAddress[]{new InternetAddress(utente.getEmail(), (utente.getNome() + " " + utente.getCognome()).trim())});
                if(tipo == 0){               
                    msg.setSubject("Avviso condivisione");
                }else{
                    msg.setSubject("Avviso scadenza prodotto");
                }
                
                msg.setSentDate(new Date());
                msg.setContent(multipart);
                 
                Transport.send(msg);
            }catch (MessagingException | UnsupportedEncodingException me) {
                Logger.getLogger(getClass().getName()).severe(me.toString());
           }                
    }
}