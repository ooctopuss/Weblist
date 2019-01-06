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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author octopussy
 */
public class LoginServlet extends HttpServlet {
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
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
         String contextPath = getServletContext().getContextPath();
        if (!contextPath.endsWith("/")) {
            contextPath += "/";
        }
        String email = Escape.escapeMetaCharacters(request.getParameter("email"));
        String password = Escape.escapeMetaCharacters(request.getParameter("password"));
            
        try {
            Utente user = utenteDao.getUtente(email);
            if(user != null){
                String ep = ""+user.getPasswordEncrypt(password);
                String pasEnc = user.getPassword();
                if(user.getChecked() == 1){
                    if(pasEnc.compareTo(ep) == 0){
                        HttpSession session=request.getSession();  
                        session.setAttribute("utente",user);  

                        if (request.getParameter("remember") != null) {
                            System.out.println("email"+email);
                            Cookie cUserName = new Cookie("cookuser", email);
                            Cookie cPassword = new Cookie("cookpass", pasEnc);
                            cUserName.setMaxAge(60 * 60 * 24 * 15);//15 days
                            cPassword.setMaxAge(60 * 60 * 24 * 15);
                            response.addCookie(cUserName);
                            response.addCookie(cPassword);
                            if(user.getAdmin() == 1){
                                response.sendRedirect(response.encodeRedirectURL(contextPath + "pages/Home.jsp"));
                            }else{
                                response.sendRedirect(response.encodeRedirectURL(contextPath + "pages/HomeU.jsp"));
                            }
                        }else{
                            if(user.getAdmin() == 1){
                                response.sendRedirect(response.encodeRedirectURL(contextPath + "pages/Home.jsp"));
                            }else{
                                response.sendRedirect(response.encodeRedirectURL(contextPath + "pages/HomeU.jsp"));
                            }
                        }
                    }else{
                        request.setAttribute("emailPasswordErrata",true);
                         request.getRequestDispatcher("HomeU.jsp").include(request, response); 

                    }
                }else{
                 request.setAttribute("utenteNonChecked",true);
                 request.getRequestDispatcher("HomeU.jsp").include(request, response); 
                
                }
            }else{
                request.setAttribute("emailPasswordErrata",true);
                 request.getRequestDispatcher("HomeU.jsp").include(request, response); 
               
            }
        } catch (DAOException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
