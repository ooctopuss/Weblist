/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filters;

import db.daos.CategoriaListaDAO;
import db.daos.UtenteDAO;
import db.entities.CategoriaLista;
import db.entities.Utente;
import db.exceptions.DAOException;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import servlets.ProdottoServlet;

/**
 *
 * @author octopussy
 */
public class AuthenticationFilter implements Filter {
    
    private static final boolean debug = true;
    private UtenteDAO userDao;
    private CategoriaListaDAO catLDao;
    private List<CategoriaLista> catListe;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    
    public AuthenticationFilter() {
    }    
    
    
    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
       
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        
        Cookie[] cookies=req.getCookies();
        String userName = null;
        String password = null;
        String gdpr = null;
        
        if (cookies != null){
             for (Cookie cookie : cookies) {
               if(cookie.getName().equals("cookuser")) {
                 userName = cookie.getValue();
               }
               if(cookie.getName().equals("cookpass")){
                 password = cookie.getValue();
               }
               if(cookie.getName().equals("gdpr")){
                 gdpr = cookie.getValue();
               }
            }
        }
        if(gdpr != null)
               session.setAttribute("gdpr",1);
        
        DAOFactory daoFactory = (DAOFactory) request.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new RuntimeException(new ServletException("Impossible to get dao factory for user storage system"));
        }
            
        try {
            userDao = daoFactory.getDAO(UtenteDAO.class);
            catLDao =  daoFactory.getDAO(CategoriaListaDAO.class);

        } catch (DAOFactoryException ex) {
            throw new RuntimeException(new ServletException("Impossible to get dao factory for user storage system", ex));
        }
        try{
            catListe = catLDao.getAll();
        } catch (DAOException ex) {
            Logger.getLogger(ProdottoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        session.setAttribute("categorieL",catListe);
        if((userName != null) &&(password != null)){
            Utente ut = null;
            try {
                ut = userDao.getUtente(userName);
            } catch (DAOException ex) {
                Logger.getLogger(AuthenticationFilter.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
            session.setAttribute("utente",ut);
            session.setAttribute("notif",0);
            if(ut == null){
                res.sendRedirect(req.getContextPath()+ "/HomeU.jsp");
            }else{
                if(ut.getAdmin() == 1){
                    res.sendRedirect(req.getContextPath()+ "/pages/Home.jsp");
                }else{
                    res.sendRedirect(req.getContextPath() + "/pages/HomeU.jsp");
                }
            }
        }else{
                res.sendRedirect(req.getContextPath()+ "/HomeU.jsp");
        }
        
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {        
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {  
                
                log("AuthenticationFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthenticationFilter()");
        }
        StringBuffer sb = new StringBuffer("AuthenticationFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);        
        
        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);                
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");                
                pw.print(stackTrace);                
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }
    
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);        
    }
    
}
