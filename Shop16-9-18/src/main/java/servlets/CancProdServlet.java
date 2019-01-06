/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.daos.ImmagineDAO;
import db.daos.LogoDAO;
import db.daos.ProdottoDAO;
import db.entities.Immagine;
import db.exceptions.DAOException;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.File;
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
public class CancProdServlet extends HttpServlet {
    private ProdottoDAO prodottoDao;
    private String uploadDir;
    private ImmagineDAO immDao;
    private LogoDAO logDao;

    
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            immDao = daoFactory.getDAO(ImmagineDAO.class);
            prodottoDao = daoFactory.getDAO(ProdottoDAO.class);
            logDao = daoFactory.getDAO(LogoDAO.class);
            
        } catch (DAOFactoryException ex) {
            throw new ServletException("Impossible to get dao factory for user storage system", ex);
        }
        uploadDir = getServletContext().getInitParameter("uploadP");
        if (uploadDir == null) {
            throw new ServletException("Please supply uploadDir parameter");
        }
        
        String contextPath = this.getClass().getResource("/").getPath();

        if (!contextPath.endsWith("\\")) {
            contextPath += "\\";
        }
        if (!uploadDir.startsWith("\\")) {
            uploadDir = "\\"+ uploadDir;
        }
        String contesto = contextPath.substring(1,contextPath.indexOf("/target"));
        uploadDir = contesto+"\\src\\main\\webapp"+uploadDir ;
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
        int id = Integer.parseInt(request.getParameter("idProdotto"));
        
        File file;
        List<Immagine> immagini = immDao.getAllImmaginiProdotto(id);
        
        for(int i = 0; i< immagini.size();i++){
            file = new File(uploadDir+"\\"+immagini.get(i).getIndirizzo());
            file.delete();
        }
        try {
            file = new File(uploadDir+"\\"+logDao.getByPrimaryKey(prodottoDao.getByPrimaryKey(id).getIdLogo()));
            file.delete();
        } catch (DAOException ex) {
            Logger.getLogger(CancProdServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        HttpSession session = request.getSession(false);
        session.setAttribute("prodotti",null);

        prodottoDao.deleteProdotto(id);
        response.sendRedirect("pages/Prodotto.jsp");
    }


}
