/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos.jdbc;

import db.daos.ImmagineDAO;
import db.entities.Immagine;
import db.exceptions.DAOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author octopussy
 */
public class JDBCImmagineDAO extends JDBCDAO<Immagine, Integer> implements ImmagineDAO{
    public JDBCImmagineDAO(Connection con) {
        super(con);
    }

    @Override
    public Long getCount() throws DAOException {
        try (Statement stmt = CON.createStatement()) {
            ResultSet counter = stmt.executeQuery("SELECT COUNT(*) FROM immagine");
            if (counter.next()) {
                return counter.getLong(1);
            }

        } catch (SQLException ex) {
            throw new DAOException("Impossible to count immagine", ex);
        }

            return 0L;   
    }

    @Override
    public Immagine getByPrimaryKey(Integer primaryKey) throws DAOException {
        if (primaryKey == null) {
            throw new DAOException("primaryKey is null");
        }
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select * from immagine where idImmagini = "+primaryKey+";");
            rs.next();
            return  new Immagine(rs.getInt("idImmagini"),rs.getString("Indirizzo"));
            
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get the immagine for the passed primary key", ex);
        }
    }

    @Override
    public List<Immagine> getAll() throws DAOException {
        List<Immagine> immagini = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("select * from 'immagine';");
            while(rs.next()){
                immagini.add(new Immagine(rs.getInt("idImmagini"),rs.getString("Indirizzo")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCImmagineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return immagini;
    }

    @Override
    public Immagine getImmagine(String indirizzo) {
        Immagine immagine = null;
        try(Statement stm = CON.createStatement()) {
            ResultSet rs = stm.executeQuery("select * from immagine where Indirizzo = '"+indirizzo+"';");
           
            rs.next();
            if(rs.getRow() == 1){
                immagine = new Immagine(rs.getInt("idImmagini"),rs.getString("Indirizzo"));
            }else {immagine = null;}
        } catch (SQLException ex) {
            Logger.getLogger(JDBCImmagineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return immagine;
    }

    @Override
    public void updateImmagine(Immagine immagine) {
        try(Statement stm = CON.createStatement()) {
            stm.execute("UPDATE `immagine` SET `Indirizzo`='"+immagine.getIndirizzo()+"' WHERE 'idImmagini' = "+immagine.getIdImmagine()+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCImmagineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deleteImmagine(String indirizzo) {
        try (Statement stm = CON.createStatement()){
           stm.execute("DELETE FROM `immagine` WHERE Indirizzo ='"+indirizzo+"';");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCImmagineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insertImmagine(Immagine immagine) {
        try (Statement stm = CON.createStatement()){
            stm.execute("INSERT INTO `immagine`(`Indirizzo`) VALUES ('"+immagine.getIndirizzo()+"');");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCImmagineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public void insertImmagineProdotto(Immagine immagine){
        try (Statement stm = CON.createStatement()){
            stm.execute("INSERT INTO `immagine`(`Indirizzo`,`Prodotto_idProdotto`) VALUES ('"+immagine.getIndirizzo()+"',"+immagine.getIdProdotto()+");");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCImmagineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public List<Immagine> getAllImmaginiProdotto(int idProdotto){
        List<Immagine> immagine = new ArrayList<>();
        try(Statement stm = CON.createStatement()) {
            ResultSet rs = stm.executeQuery("select * from immagine where Prodotto_idProdotto = "+idProdotto+";");
           
            while(rs.next()){
                immagine.add(new Immagine(rs.getInt("idImmagini"),rs.getString("Indirizzo")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCImmagineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return immagine;
    }
    @Override
    public List<Immagine> getAllProdotto() throws DAOException {
        List<Immagine> immagini = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("select * from immagine;");
            while(rs.next()){
                immagini.add(new Immagine(rs.getInt("idImmagini"),rs.getString("Indirizzo"),rs.getInt("Prodotto_idProdotto")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCImmagineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return immagini;
    }

    @Override
    public void insertImmagineCategoriaLista(Immagine immagine) {
        try (Statement stm = CON.createStatement()){
            stm.execute("INSERT INTO `immagine`(`Indirizzo`,`CategoriaLista_idCategoriaLista`) VALUES ('"+immagine.getIndirizzo()+"',"+immagine.getIdCategoriaLista()+");");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCImmagineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Immagine> getAllImmaginiCategoriaLista(int idCategoriaLista) {
        List<Immagine> immagini = new ArrayList<>();
        try(Statement stm = CON.createStatement()) {
            ResultSet rs = stm.executeQuery("select * from immagine where CategoriaLista_idCategoriaLista = "+idCategoriaLista+";");
           
            
            while(rs.next()){
                immagini.add(new Immagine(rs.getInt("idImmagini"),rs.getString("Indirizzo"),rs.getInt("CategoriaLista_idCategoriaLista"),"ciao"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(JDBCImmagineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return immagini;
    }

    @Override
    public List<Immagine> getAllCategoriaLista() throws DAOException {
        List<Immagine> immagini = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("select * from immagine where CategoriaLista_idCategoriaLista != 'null';");
            while(rs.next()){
                immagini.add(new Immagine(rs.getInt("idImmagini"),rs.getString("Indirizzo"),rs.getInt("CategoriaLista_idCategoriaLista"),"ciao"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCImmagineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return immagini;
    }

    @Override
    public Long lastId() throws DAOException {
        try (Statement stmt = CON.createStatement()) {
            ResultSet counter = stmt.executeQuery("SELECT max(idImmagini) FROM immagine");
            if (counter.next()) {
                return counter.getLong(1);
            }

        } catch (SQLException ex) {
            throw new DAOException("Impossible to count immagine", ex);
        }

        return 0L;   
    }
    
}
