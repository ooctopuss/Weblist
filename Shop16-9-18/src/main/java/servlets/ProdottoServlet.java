/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.daos.CategoriaProdottoDAO;
import db.daos.ImmagineDAO;
import db.daos.LogoDAO;
import db.daos.ProdottoDAO;
import db.entities.CategoriaProdotto;
import db.entities.Logo;
import db.entities.Prodotto;
import db.exceptions.DAOException;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.IOException;
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
 * @author octopussy
 */
public class ProdottoServlet extends HttpServlet {
    private String uploadDir;
    private LogoDAO logoDao;
    private CategoriaProdottoDAO categDao;
    private ProdottoDAO prodottoDao;
    private List<Prodotto> prodotti;
    private List<Logo> loghi;

    private List<CategoriaProdotto> categorieP;
    private ImmagineDAO immaginiDao;

    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            logoDao =  daoFactory.getDAO(LogoDAO.class);
            immaginiDao = daoFactory.getDAO(ImmagineDAO.class);
            prodottoDao = daoFactory.getDAO(ProdottoDAO.class);
            categDao = daoFactory.getDAO(CategoriaProdottoDAO.class);
        } catch (DAOFactoryException ex) {
            throw new ServletException("Impossible to get dao factory for user storage system", ex);
        }
        uploadDir = getServletContext().getInitParameter("uploadP");
        if (uploadDir == null) {
            throw new ServletException("Please supply uploadDir parameter");
        }
        if (!uploadDir.endsWith("\\")) {
            uploadDir += "\\";
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
        try {
            prodotti = prodottoDao.getAll();
            categorieP = categDao.getAll();
            loghi = logoDao.getAll();
            
        } catch (DAOException ex) {
            Logger.getLogger(ProdottoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpSession session=request.getSession();  
            session.setAttribute("prodottoDao", prodottoDao);
            session.setAttribute("prodottiP",prodotti);
            session.setAttribute("categorieCP", categorieP);
            session.setAttribute("categoriaDao", categDao);
            session.setAttribute("logoDaoP",logoDao);
            session.setAttribute("loghi",loghi);
        
            session.setAttribute("immaginiDaoP", immaginiDao);
       
            session.setAttribute("uploadDir", uploadDir);
        
        request.getRequestDispatcher("pages/Prodotto.jsp").include(request, response);
    
    }
    

   
}
