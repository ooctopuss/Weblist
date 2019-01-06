/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.daos.ImmagineDAO;
import db.daos.ProdottoDAO;
import db.entities.Immagine;
import db.entities.Prodotto;
import db.exceptions.DAOException;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.IOException;
import java.io.PrintWriter;
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
public class SlideshowServlet extends HttpServlet {

    private ProdottoDAO prodottoDao;
    private ImmagineDAO immagineDao;
    
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            prodottoDao = daoFactory.getDAO(ProdottoDAO.class);
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
        int idProd =Integer.parseInt(request.getParameter("idProd"));
        HttpSession session = request.getSession(false);
        
        try {
            Prodotto prod= prodottoDao.getByPrimaryKey(idProd);
        } catch (DAOException ex) {
            Logger.getLogger(SlideshowServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.setContentType("text/html");
        List<Immagine> immagini = immagineDao.getAllImmaginiProdotto(idProd);
        String up = (String)session.getAttribute("uploadDir");
        if(immagini.size() == 1){
            response.getWriter().write("<div class=\"carousel-inner\" id=\"in\">\n" +
"                                    <div class=\"carousel-item active\">\n" +
"                                        <img class=\"d-block w-50\" src='"+up+"\\"+immagini.get(0).getIndirizzo()+"' id=\"pI\"alt=\"First slide\">\n" +
"                                    </div>\n" +
"                                </div>");
            
            response.getWriter().write("<a class=\"carousel-control-prev\" href=\"#carouselExampleControls\" role=\"button\" data-slide=\"prev\">\n" +
"                                    <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>\n" +
"                                    <span class=\"sr-only\"><fmt:message key=\"button.previous\" /></span>\n" +
"                                </a>\n" +
"                                <a class=\"carousel-control-next\" href=\"#carouselExampleControls\" role=\"button\" data-slide=\"next\">\n" +
"                                    <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>\n" +
"                                    <span class=\"sr-only\"><fmt:message key=\"button.next\" /></span>\n" +
"                                </a>");
        }else{
                        response.getWriter().write("<div class=\"carousel-inner\" id=\"in\">\n" +
"                                    <div class=\"carousel-item active\">\n" +
"                                        <img class=\"d-block w-50\" src='"+up+"\\"+immagini.get(0).getIndirizzo()+"' id=\"pI\"alt=\"First slide\">\n" +
"                                    </div>\n");
                        
                        for(int i = 1 ; i < immagini.size();i++){
                             
response.getWriter().write("                                    <div class=\"carousel-item \">\n" +
"                                        <img class=\"d-block w-50\" src='"+up+"\\"+immagini.get(i).getIndirizzo()+"' id=\"pI\"alt=\"First slide\">\n" +
"                                    </div>\n");
                        }
        
                         response.getWriter().write("<a class=\"carousel-control-prev\" href=\"#carouselExampleControls\" role=\"button\" data-slide=\"prev\">\n" +
"                                    <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>\n" +
"                                    <span class=\"sr-only\"><fmt:message key=\"button.previous\" /></span>\n" +
"                                </a>\n" +
"                                <a class=\"carousel-control-next\" href=\"#carouselExampleControls\" role=\"button\" data-slide=\"next\">\n" +
"                                    <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>\n" +
"                                    <span class=\"sr-only\"><fmt:message key=\"button.next\" /></span>\n" +
"                                </a>");
        
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
