/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filters;

import db.daos.CategoriaListaDAO;
import db.daos.CategoriaProdottoDAO;
import db.daos.ImmagineDAO;
import db.daos.ListaSpesaDAO;
import db.daos.ListaSpesa_has_ProdottoDAO;
import db.daos.LogoDAO;
import db.daos.ProdottoDAO;
import db.daos.TypesDAO;
import db.daos.UtenteDAO;
import db.daos.Utente_has_ListaSpesaDAO;
import db.entities.CategoriaLista;
import db.entities.CategoriaProdotto;
import db.entities.Immagine;
import db.entities.ListaSpesa;
import db.entities.ListaSpesa_has_Prodotto;
import db.entities.Prodotto;
import db.entities.Types;
import db.entities.Utente;
import db.entities.Utente_has_ListaSpesa;
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
 * @author Safouane
 */
public class PagesFilter implements Filter {
    
    private static final boolean debug = true;
    private String uploadDir;
    private LogoDAO logoDao;
    private CategoriaProdottoDAO categDao;
    private ProdottoDAO prodottoDao;
    private List<Prodotto> prodotti;
    private UtenteDAO userDao;
    private ImmagineDAO immaginiDao;
    private List<CategoriaProdotto> categorieP;
    private CategoriaListaDAO catLDao;
    private List<CategoriaLista> catListe;
    private List<CategoriaProdotto> catProd;
    private List<Utente> utenti;
    private Utente user;
    private List<Immagine> immagini;
    private List<ListaSpesa_has_Prodotto> listeP;
    private ListaSpesa_has_ProdottoDAO listaPDao;
    private List<Utente_has_ListaSpesa> utentiL;
    private Utente_has_ListaSpesaDAO utenteLDao;
    private List<ListaSpesa> listeS;
    private ListaSpesaDAO listaSDao;
    private List<Immagine> immaginiCL;
    private List<Prodotto> prodottiR;
    private Long nImm;
    private List<Types> tipo;
    private TypesDAO typDao;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    
    public PagesFilter() {
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
        HttpSession session = req.getSession(false);
        
        
        Cookie[] cookies=req.getCookies();
        String lista = null;
        String gdpr = null;
        
        if (cookies != null){
            for (Cookie cookie : cookies) {
                if(cookie.getName().equals("ListaSpesa")) {
                    lista = cookie.getValue();
                }
                if(cookie.getName().equals("gdpr")){
                    gdpr = cookie.getValue();
                }
            }
        }
        
        if((session == null || session.getAttribute("utente") == null )&& lista == null){
            DAOFactory daoFactory = (DAOFactory) request.getServletContext().getAttribute("daoFactory");
            if (daoFactory == null) {
                throw new RuntimeException(new ServletException("Impossible to get dao factory for user storage system"));
            }
            try {
                catLDao =  daoFactory.getDAO(CategoriaListaDAO.class);
            } catch (DAOFactoryException ex) {
                throw new RuntimeException(new ServletException("Impossible to get dao factory for user storage system", ex));
            }
            try {
                catListe = catLDao.getAll();
            } catch (DAOException ex) {
                Logger.getLogger(ProdottoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            session.setAttribute("categorieL",catListe);
            res.sendRedirect("../HomeU.jsp?t="+1); 

        }else{
            
                user = (Utente) session.getAttribute("utente");
           
            DAOFactory daoFactory = (DAOFactory) request.getServletContext().getAttribute("daoFactory");
            if (daoFactory == null) {
                throw new RuntimeException(new ServletException("Impossible to get dao factory for user storage system"));
            }
            
                try {
                    userDao = daoFactory.getDAO(UtenteDAO.class);
                    logoDao =  daoFactory.getDAO(LogoDAO.class);
                    immaginiDao = daoFactory.getDAO(ImmagineDAO.class);
                    prodottoDao = daoFactory.getDAO(ProdottoDAO.class);
                    categDao = daoFactory.getDAO(CategoriaProdottoDAO.class);
                    catLDao =  daoFactory.getDAO(CategoriaListaDAO.class);
                    listaPDao = daoFactory.getDAO(ListaSpesa_has_ProdottoDAO.class);
                    utenteLDao = daoFactory.getDAO(Utente_has_ListaSpesaDAO.class);
                    listaSDao = daoFactory.getDAO(ListaSpesaDAO.class);
                    typDao = daoFactory.getDAO(TypesDAO.class);
                } catch (DAOFactoryException ex) {
                    throw new RuntimeException(new ServletException("Impossible to get dao factory for user storage system", ex));
                }
         
            uploadDir = request.getServletContext().getInitParameter("uploadDir");
            if (uploadDir == null) {
                throw new ServletException("Please supply uploadDir parameter");
            }
            if (!uploadDir.endsWith("\\")) {
                uploadDir += "\\";
            }

            try {
                prodotti = prodottoDao.getAll();
                prodottiR = prodottoDao.getProdottoLista();
                categorieP = categDao.getAll();
                catListe = catLDao.getAll();
                catProd = categDao.getAll();
                utenti = userDao.getAll();
                if(user != null){
                    user = userDao.getUtente(user.getEmail());
                }
                immagini = immaginiDao.getAllProdotto();
                nImm = immaginiDao.lastId();
                immaginiCL = immaginiDao.getAllCategoriaLista();
                listeP = listaPDao.getAll();
                utentiL = utenteLDao.getAll();
                listeS = listaSDao.getAll();
                tipo = typDao.getAll();

            } catch (DAOException ex) {
                Logger.getLogger(ProdottoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(session.getAttribute("utenteDao") == null)
                session.setAttribute("utenteDao",userDao); 
            if(session.getAttribute("prodottoDao") == null)
                session.setAttribute("prodottoDao", prodottoDao);
            if(session.getAttribute("categoriaProdDao") == null)
                session.setAttribute("categoriaProdDao", categDao);
            if(session.getAttribute("immaginiDao") == null)
                session.setAttribute("immaginiDao",immaginiDao);
            if(session.getAttribute("logoDao") == null)
                session.setAttribute("logoDao",logoDao);
            if(session.getAttribute("categoriaListaDao") == null)
                session.setAttribute("categoriaListaDao",catLDao);
            if(session.getAttribute("listaPDao") == null)
                session.setAttribute("listaPDao",listaPDao);
            if(session.getAttribute("utenteLDao") == null)
                session.setAttribute("utenteLDao",utenteLDao);
            if(session.getAttribute("listaSDao") == null)
                session.setAttribute("listaSDao",listaSDao);
                session.setAttribute("prodotti",prodotti);
                session.setAttribute("uploadDir", uploadDir);
                session.setAttribute("categorieP",categorieP);
                session.setAttribute("categorieL",catListe);
                session.setAttribute("categorieP",catProd);
                session.setAttribute("utenti",utenti);
                session.setAttribute("immagini",immagini);
                session.setAttribute("listeP",listeP);
                session.setAttribute("utentiL",utentiL);
                session.setAttribute("listeS",listeS);
                session.setAttribute("immaginiCL",immaginiCL);
                session.setAttribute("prodottiR",prodottiR);
                session.setAttribute("utente",user);
                session.setAttribute("tipo",tipo);
                
            if(lista != null)
               session.setAttribute("utenteAnon",Integer.parseInt(lista));
            if(gdpr != null)
               session.setAttribute("gdpr",1);
            session.setAttribute("nImm",nImm);
            chain.doFilter(request, response);
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
                log("PagesFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("PagesFilter()");
        }
        StringBuffer sb = new StringBuffer("PagesFilter(");
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
