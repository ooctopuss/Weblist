/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Tools.Email;
import db.daos.ListaSpesaDAO;
import db.daos.ProdottoDAO;
import db.daos.ScadenzaDAO;
import db.daos.Utente_has_ListaSpesaDAO;
import Tools.Notifiche;
import db.entities.Scadenza;
import db.entities.Utente;
import db.entities.Utente_has_ListaSpesa;
import db.exceptions.DAOException;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.IOException;
import java.time.LocalTime;
import java.util.ArrayList;
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
public class ScadenzaProdServlet extends HttpServlet {
    
    private ScadenzaDAO scadDao;
    private Utente_has_ListaSpesaDAO utLDao;
    private ProdottoDAO prodottiDao;
    private ListaSpesaDAO listaDao;
    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = (DAOFactory) super.getServletContext().getAttribute("daoFactory");
        if (daoFactory == null) {
            throw new ServletException("Impossible to get dao factory for user storage system");
        }
        try {
            utLDao = daoFactory.getDAO(Utente_has_ListaSpesaDAO.class);
            prodottiDao = daoFactory.getDAO(ProdottoDAO.class);
            listaDao = daoFactory.getDAO(ListaSpesaDAO.class);
            scadDao = daoFactory.getDAO(ScadenzaDAO.class);
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
        HttpSession session=request.getSession();  
        Utente user = (Utente) session.getAttribute("utente");
       
        List<Notifiche> notifiche = new ArrayList<>();
        
      
        if(user == null){
        }else{
            
            List <Utente_has_ListaSpesa> utL = null;
            try {
                utL = utLDao.getAllListUtente(user.getId());
            } catch (DAOException ex) {
                Logger.getLogger(ScadenzaProdServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(!utL.isEmpty()){
                int idLista = 0;
                List <Scadenza> scadenze = new ArrayList<>();
                for(int i = 0; i < utL.size(); i++){
                    idLista = utL.get(i).getIdListaSpesa();
                    try {
                        scadenze = scadDao.getAllScadList(idLista);
                    } catch (DAOException ex) {
                        Logger.getLogger(ScadenzaProdServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    if(!scadenze.isEmpty()){
                        for(int j = 0 ; j< scadenze.size(); j++){
                            int contatore = scadenze.get(j).getContatore();
                            
                            if(scadenze.get(j).getVisto()== 1){
                                if(contatore >= 3){
                                    int media  = scadenze.get(j).getMedia();
                                    LocalTime ultimo = scadenze.get(j).getUltimo().toLocalTime();
                                    LocalTime ora = LocalTime.now();
                                    LocalTime pr = ultimo.plusSeconds(media).minusSeconds(ora.toSecondOfDay());
                                    
                                    
                                    LocalTime som= ultimo.plusSeconds(media);
                                    boolean tr = pr.isAfter(LocalTime.parse("00:00:00")) && pr.isBefore(LocalTime.parse("00:00:59"));
                                    boolean t2 = pr.isAfter(LocalTime.parse("00:01:00")) && pr.isBefore(LocalTime.parse("00:01:59"));
                                    
                                    if(ora.isAfter(som)){
                                        String nomeP = null;
                                        String nomeL =null;
                                        int idP = scadenze.get(j).getIdProdotto();
                                        int idL = scadenze.get(j).getIdListaSpesa();
                                        try {
                                            nomeP = prodottiDao.getByPrimaryKey(idP).getNome();
                                            nomeL = listaDao.getByPrimaryKey(idL).getNome();
                                        } catch (DAOException ex) {
                                            Logger.getLogger(ScadenzaProdServlet.class.getName()).log(Level.SEVERE, null, ex);
                                        }
                                        notifiche.add(new Notifiche(idP,idLista,nomeP,nomeL,0));
                                    }
                                    if(tr == true){
                                        String nomeP = null;
                                        String nomeL =null;
                                        int idP = scadenze.get(j).getIdProdotto();
                                        int idL = scadenze.get(j).getIdListaSpesa();
                                        try {
                                            nomeP = prodottiDao.getByPrimaryKey(idP).getNome();
                                            nomeL = listaDao.getByPrimaryKey(idL).getNome();
                                        } catch (DAOException ex) {
                                            Logger.getLogger(ScadenzaProdServlet.class.getName()).log(Level.SEVERE, null, ex);
                                        }
                                        notifiche.add(new Notifiche(idP,idLista,nomeP,nomeL,1));
                                        
                                        
                                    }
                                    if(t2 == true){
                                        String nomeP = null;
                                        String nomeL =null;
                                        int idP = scadenze.get(j).getIdProdotto();
                                        int idL = scadenze.get(j).getIdListaSpesa();
                                        try {
                                            nomeP = prodottiDao.getByPrimaryKey(idP).getNome();
                                            nomeL = listaDao.getByPrimaryKey(idL).getNome();
                                        } catch (DAOException ex) {
                                            Logger.getLogger(ScadenzaProdServlet.class.getName()).log(Level.SEVERE, null, ex);
                                        }
                                        if(scadenze.get(j).getContEmail()== 0){
                                            Email emInv = new Email();
                                            emInv.inviaEmail(request, user, 1,nomeL);
                                            scadenze.get(j).setContEmail(1);
                                            scadDao.updateContEmail(scadenze.get(j));
                                        }
                                        notifiche.add(new Notifiche(idP,idLista,nomeP,nomeL,2));
                                    }
                                    
                                    
                                }
                            }
                        }
                    }
                }
            
            }
        }
        session.setAttribute("notifiche",notifiche);
        
        response.setContentType("text/html");
        
        if(!notifiche.isEmpty()){
            session.setAttribute("notif",1);
            response.getWriter().write("<li class=\"nav-item dropdown text-center\" >\n" +
"                                <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n" +
"                                    <img src=\"../TemplateAvatar/bell3.png\" width=\"25\" height=\"25\" />\n" +
"                                </a>\n" +
"                                <div class=\"dropdown-menu dropdown-menu-right\" aria-labelledby=\"navbarDropdownMenuLink\" name=\"nF\" id=\"nF\">");
            for(int y = 0; y < notifiche.size(); y++){
                
                
                switch(notifiche.get(y).getFin()){
                    case 0:
                        response.getWriter().write("<a class=\"nav-link text-center\" href=\"../VistoNServlet?idLista="+notifiche.get(y).getIdLista()+"&idProdotto="+notifiche.get(y).getIdProdotto()+"\">Il prodotto "+notifiche.get(y).getNomeProdotto()+" della lista spesa "+notifiche.get(y).getNomeLista()+" è finito.</a>\n<div class=\"dropdown-divider\"></div>");

                        break;
                    case 1:
                            response.getWriter().write("<a class=\"nav-link text-center\" href=\"../VistoNServlet?idLista="+notifiche.get(y).getIdLista()+"&idProdotto="+notifiche.get(y).getIdProdotto()+"\">Il prodotto "+notifiche.get(y).getNomeProdotto()+" della lista spesa "+notifiche.get(y).getNomeLista()+" è da ricomprare al più presto.</a>\n<div class=\"dropdown-divider\"></div>");
                        break;
                    case 2:
                            response.getWriter().write("<a class=\"nav-link text-center\" href=\"../VistoNServlet?idLista="+notifiche.get(y).getIdLista()+"&idProdotto="+notifiche.get(y).getIdProdotto()+"\">Il prodotto "+notifiche.get(y).getNomeProdotto()+" della lista spesa "+notifiche.get(y).getNomeLista()+" è vicino all'esaurimento.</a>\n<div class=\"dropdown-divider\"></div>");
                        break;
                        
                }
            }
            response.getWriter().write("</div>\n" +
"                            </li>");
        }else{
            response.getWriter().write("<li class=\"nav-item dropdown text-center\">\n" +
"                                <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n" +
"                                    <img src=\"../TemplateAvatar/bell1.png\" width=\"25\" height=\"25\" />\n" +
"                                </a>\n" +
"                                <div class=\"dropdown-menu dropdown-menu-right\" aria-labelledby=\"navbarDropdownMenuLink\" name=\"nF\" id=\"nF\">\n" +
"                                    <a class=\"nav-link text-center\" href=\"\">NESSUNA NOTIFICA</a>\n" +
"                                    <div class=\"dropdown-divider\"></div>\n" +
"                                </div>\n" +
"                            </li>");
            session.setAttribute("notif",0);
            
        }
    }

 

}
