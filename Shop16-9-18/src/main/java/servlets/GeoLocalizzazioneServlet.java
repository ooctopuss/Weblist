/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.daos.CategoriaListaDAO;
import db.daos.ListaSpesaDAO;
import db.daos.TypesDAO;
import db.daos.Utente_has_ListaSpesaDAO;
import db.entities.Utente;
import db.entities.Utente_has_ListaSpesa;
import db.exceptions.DAOException;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.IOException;
import java.util.List;
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
public class GeoLocalizzazioneServlet extends HttpServlet {
    private ListaSpesaDAO listaDao;
    private TypesDAO tipoDao;
    private Utente_has_ListaSpesaDAO utLDao;
    private CategoriaListaDAO catDao;
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            listaDao = daoFactory.getDAO(ListaSpesaDAO.class);
            tipoDao = daoFactory.getDAO(TypesDAO.class);
            utLDao = daoFactory.getDAO(Utente_has_ListaSpesaDAO.class);
            catDao = daoFactory.getDAO(CategoriaListaDAO.class);
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
        
        HttpSession session = request.getSession();
        Utente ut = (Utente) session.getAttribute("utente");
        
        if(ut != null){
            Float latitude = Float.valueOf(request.getParameter("latitude"));
            Float longitude = Float.valueOf(request.getParameter("longitude"));
            
            List <Utente_has_ListaSpesa> utL = null;
            try {
                utL = utLDao.getAllListUtente(ut.getId());
            } catch (DAOException ex) {
                Logger.getLogger(ScadenzaProdServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            int idCat;
            int idTypes = -1;
            String nomeCat = null;
            String nomeLista = null;
            String nomeCategoria = null;
            int idLista;
            response.setContentType("text/html");
            response.getWriter().write("<li class=\"nav-item dropdown text-center\">\n" +
"                        <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n" +
"                            <img src=\"../TemplateAvatar/localizzazioneNo.png\" width=\"25\" height=\"25\" />\n" +
"                        </a>\n" +
"                        <div class=\"dropdown-menu dropdown-menu-right\" aria-labelledby=\"navbarDropdownMenuLink\" >");
            if(!utL.isEmpty()){
                for(int i = 0; i < utL.size(); i++){
                    idLista = utL.get(i).getIdListaSpesa();
                    idCat = listaDao.getListaSpesa(idLista).getIdCategoriaLista();
                      
                    try {
                        nomeCategoria = catDao.getByPrimaryKey(idCat).getNome();
                        idTypes = catDao.getByPrimaryKey(idCat).getIdTypes();
                        nomeCat = tipoDao.getByPrimaryKey(idTypes).getNomeIng();
                        nomeLista = listaDao.getByPrimaryKey(idLista).getNome();
                    } catch (DAOException ex) {
                        Logger.getLogger(GeoLocalizzazioneServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                        
                    String mapUrl = "https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d22154.981200143142!2d" + longitude + "!3d" + latitude + "!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1s" + nomeCat + "!5e0!3m2!1sit!2sit!4v1542911270560";
                    
                    response.getWriter().write("<a class=\"nav-link text-center\" href=\"Mappa.jsp?idLista="+idLista+"&mappa="+mapUrl+"\">Hai un "+nomeCategoria+" nelle vicinanze appartenente alla lista "+nomeLista+".</a> <div class=\"dropdown-divider\"></div>\n");
       
                }
            }else{
                response.getWriter().write("<a class=\"nav-link text-center\" href=\"\">NESSUNA LISTA PRESENTE</a>\n"); 
            
            }
            response.getWriter().write(" </div> </li>");
        }else{
            Float latitude = Float.valueOf(request.getParameter("latitude"));
            Float longitude = Float.valueOf(request.getParameter("longitude"));
            
            
            int idLista = -2;
            Cookie[] cookies = request.getCookies();

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("ListaSpesa")) {
                        idLista = Integer.parseInt(cookie.getValue());
                    }
                }
            }
            int idCat;
            int idTypes = -1;
            String nomeCat = null;
            String nomeLista = null;
            String nomeCategoria = null;
            
            response.setContentType("text/html");
            response.getWriter().write("<li class=\"nav-item dropdown text-center\">\n" +
"                        <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n" +
"                            <img src=\"../TemplateAvatar/localizzazioneNo.png\" width=\"25\" height=\"25\" />\n" +
"                        </a>\n" +
"                        <div class=\"dropdown-menu dropdown-menu-right\" aria-labelledby=\"navbarDropdownMenuLink\" >");
            if(idLista != -2 ){
                idCat = listaDao.getListaSpesa(idLista).getIdCategoriaLista();
                      
                try {
                    nomeCategoria = catDao.getByPrimaryKey(idCat).getNome();
                    idTypes = catDao.getByPrimaryKey(idCat).getIdTypes();
                    nomeCat = tipoDao.getByPrimaryKey(idTypes).getNomeIng();
                    nomeLista = listaDao.getByPrimaryKey(idLista).getNome();
                } catch (DAOException ex) {
                    Logger.getLogger(GeoLocalizzazioneServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                        
                String mapUrl = "https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d22154.981200143142!2d" + longitude + "!3d" + latitude + "!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1s" + nomeCat + "!5e0!3m2!1sit!2sit!4v1542911270560";
                    
                response.getWriter().write("<a class=\"nav-link text-center\" href=\"Mappa.jsp?idLista="+idLista+"&mappa="+mapUrl+"\">Hai un "+nomeCategoria+" nelle vicinanze appartenente alla lista "+nomeLista+".</a> <div class=\"dropdown-divider\"></div>\n");
            }else{
                response.getWriter().write("<a class=\"nav-link text-center\" href=\"\">NESSUNA LISTA PRESENTE</a>\n"); 
            }
            response.getWriter().write(" </div> </li>");
            
        
        }
    }
}
