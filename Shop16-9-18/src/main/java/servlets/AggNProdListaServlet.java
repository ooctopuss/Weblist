/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Tools.Escape;
import db.daos.ImmagineDAO;
import db.daos.ListaSpesa_has_ProdottoDAO;
import db.daos.LogoDAO;
import db.daos.ProdottoDAO;
import db.entities.Immagine;
import db.entities.ListaSpesa_has_Prodotto;
import db.entities.Logo;
import db.entities.Prodotto;
import db.exceptions.DAOFactoryException;
import db.factories.DAOFactory;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author octopussy
 */
@MultipartConfig
public class AggNProdListaServlet extends HttpServlet {
    private String uploadDir;
    private LogoDAO logoDao;
    private ProdottoDAO prodottoDao;
    private ImmagineDAO immaginiDao;
    private ListaSpesa_has_ProdottoDAO listaP;

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
            listaP = daoFactory.getDAO(ListaSpesa_has_ProdottoDAO.class);
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
        String nome = Escape.escapeMetaCharacters(request.getParameter("nome"));
        String note =  Escape.escapeMetaCharacters(request.getParameter("note"));
        int idCategP = Integer.parseInt( request.getParameter("categoriaProd"));
        int idLista = Integer.parseInt(request.getParameter("idLista"));
        
        int idLogo = caricaLogo(request,logoDao);
        HttpSession session = request.getSession(false);
        session.setAttribute("prodotti",null);
        prodottoDao.insertProdottoLista(new Prodotto(nome,note,idCategP,idLogo,idLista));
        caricaMultImm(request,immaginiDao,prodottoDao.getId(idLogo).getId());
        int idProdotto;
        Prodotto p = prodottoDao.getId(idLogo);
        idProdotto = p.getId();
        listaP.insertListaSpesa(new ListaSpesa_has_Prodotto(idLista,idProdotto,0));
        response.sendRedirect(request.getContextPath() + "/pages/Lista.jsp?adascaowdwd="+idLista);
    }
    
    public void caricaMultImm(HttpServletRequest request,ImmagineDAO immagineDao, int idProdotto) throws IOException, ServletException{
        File uploadDirFile = new File(uploadDir);
        List<Part> multiFileParts = request.getParts().stream().filter(part -> "multiplefile".equals(part.getName())).collect(Collectors.toList());
        if ((multiFileParts != null) && !multiFileParts.isEmpty()) {
            for (Part multiFilePart : multiFileParts) {
                String filename1 = Paths.get(multiFilePart.getSubmittedFileName()).getFileName().toString();
                String formato = filename1.substring(filename1.indexOf("."));
            
                do{
                    filename1 = Immagine.generateUniqueFileName();
                    filename1 = filename1+formato;
                }while(immagineDao.getImmagine(filename1) != null);
                File file = new File(uploadDirFile, filename1);
                try (InputStream fileContent = multiFilePart.getInputStream()) {
                    Files.copy(fileContent, file.toPath());
                }
                immagineDao.insertImmagineProdotto(new Immagine(filename1,idProdotto));
            }   
        }else{
            immagineDao.insertImmagineProdotto(new Immagine(immagineDao.getAllImmaginiProdotto(idProdotto).get(0).getIndirizzo(),idProdotto));

        }
    }
    
    public int caricaLogo(HttpServletRequest request,LogoDAO logoDao) throws IOException, ServletException{
        File uploadDirFile = new File(uploadDir);
        
        Part filePart1 = request.getPart("logo");
        if ((filePart1 != null) && (filePart1.getSize() > 0)) {
            String filename1 = Paths.get(filePart1.getSubmittedFileName()).getFileName().toString();//MSIE  fix.
            String formato = filename1.substring(filename1.indexOf("."));
            
            do{
                filename1 = Immagine.generateUniqueFileName();
                filename1 = filename1+formato;
            }while(logoDao.getLogo(filename1) != null);
            File file1 = new File(uploadDirFile, filename1);
             
            try (InputStream fileContent = filePart1.getInputStream()) {
                Files.copy(fileContent, file1.toPath());
                
            }
            
            logoDao.insertLogo(new Logo(filename1));
            int i = logoDao.getLogo(filename1).getId();
            
            return i;
        }
        return -1;
    }


}
