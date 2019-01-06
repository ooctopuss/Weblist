/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos.jdbc;

import db.daos.ProdottoDAO;
import db.entities.Prodotto;
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
public class JDBCProdottoDAO extends JDBCDAO<Prodotto, Integer> implements ProdottoDAO {

    public JDBCProdottoDAO(Connection con) {
        super(con);
    }

    @Override
    public Long getCount() throws DAOException {
        try (Statement stmt = CON.createStatement()) {
            ResultSet counter = stmt.executeQuery("SELECT COUNT(*) FROM prodotto");
            if (counter.next()) {
                return counter.getLong(1);
            }

        } catch (SQLException ex) {
            throw new DAOException("Impossible to count prodotto", ex);
        }

        return 0L;
    }

    @Override
    public Prodotto getByPrimaryKey(Integer primaryKey) throws DAOException {
        Prodotto prodotto = null;
        if (primaryKey == null) {
            throw new DAOException("primaryKey is null");
        }
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("SELECT * from (select prodotto.idProdotto, prodotto.Nome, Note, prodotto.CategoriaProdotto_idCategoriaProdotto, categoriaprodotto.Nome as nomeCat, prodotto.Logo_idLogo, logo.Indirizzo as indirizzoL FROM `prodotto`, logo, categoriaprodotto WHERE prodotto.CategoriaProdotto_idCategoriaProdotto = categoriaprodotto.idCategoriaProdotto and prodotto.Logo_idLogo = logo.idLogo )as t2 where idProdotto = "+primaryKey+";");

            rs.next();
            if(rs.getRow() == 1){
                 prodotto = new Prodotto(rs.getInt("idProdotto"),rs.getString("Nome"),rs.getString("Note"),rs.getInt("CategoriaProdotto_idCategoriaProdotto"),rs.getString("nomeCat"),rs.getInt("Logo_idLogo"),rs.getString("indirizzoL"));

            }else{ prodotto = null;}
            
            
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get prodotto for the passed primary key", ex);
        }
        return prodotto;
    }

    @Override
    public List<Prodotto> getAll() throws DAOException {
        List<Prodotto> prodotti = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("select prodotto.idProdotto, prodotto.Nome, Note, prodotto.CategoriaProdotto_idCategoriaProdotto, categoriaprodotto.Nome as nomeCat, prodotto.Logo_idLogo, logo.Indirizzo as indirizzoL FROM `prodotto`, logo, categoriaprodotto WHERE prodotto.CategoriaProdotto_idCategoriaProdotto = categoriaprodotto.idCategoriaProdotto and prodotto.Logo_idLogo = logo.idLogo ");
            while(rs.next()){
                prodotti.add(new Prodotto(rs.getInt("idProdotto"),rs.getString("Nome"),rs.getString("Note"),rs.getInt("CategoriaProdotto_idCategoriaProdotto"),rs.getString("nomeCat"),rs.getInt("Logo_idLogo"),rs.getString("indirizzoL")));
            } 
        } catch (SQLException ex) {
            Logger.getLogger(JDBCProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return prodotti;
    }

    @Override
    public Prodotto getProdottoPerCategoria(int idCategoria) throws DAOException {
        Prodotto prodotto = null;
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("SELECT * from (select prodotto.idProdotto, prodotto.Nome, Note, prodotto.CategoriaProdotto_idCategoriaProdotto, categoriaprodotto.Nome as nomeCat, prodotto.Logo_idLogo, logo.Indirizzo as indirizzoL FROM `prodotto`, logo, categoriaprodotto WHERE prodotto.CategoriaProdotto_idCategoriaProdotto = categoriaprodotto.idCategoriaProdotto and prodotto.Logo_idLogo = logo.idLogo )as t2 where CategoriaProdotto_idCategoriaProdotto = "+idCategoria+";");
            rs.next();
            if(rs.getRow() == 1){
                 prodotto = new Prodotto(rs.getInt("idProdotto"),rs.getString("Nome"),rs.getString("Note"),rs.getInt("CategoriaProdotto_idCategoriaProdotto"),rs.getString("nomeCat"),rs.getInt("Logo_idLogo"),rs.getString("indirizzoL"));

            }else{ prodotto = null;}
        } catch (SQLException ex) {
            Logger.getLogger(JDBCProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return prodotto;
    }

    @Override
    public void updateProdotto(Prodotto prodotto) {
        try (Statement stm = CON.createStatement()){
            stm.execute("UPDATE `prodotto` SET `Nome`='"+prodotto.getNome()+"',`Note`='"+prodotto.getNote()+"',`CategoriaProdotto_idCategoriaProdotto`="+prodotto.getIdCategoriaProdotto()+",`Logo_idLogo`="+prodotto.getIdLogo()+" WHERE idProdotto = "+prodotto.getId()+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deleteProdotto(int id) {
        try (Statement stm = CON.createStatement()){
           stm.execute("DELETE FROM prodotto WHERE idProdotto ="+id+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insertProdotto(Prodotto prodotto) {
        try (Statement stm = CON.createStatement()){
            stm.execute("INSERT INTO `prodotto`(`Nome`, `Note`, `CategoriaProdotto_idCategoriaProdotto`, `Logo_idLogo`) VALUES ('"+prodotto.getNome()+"','"+prodotto.getNote()+"',"+prodotto.getIdCategoriaProdotto()+","+prodotto.getIdLogo()+");");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Prodotto getId(int idLogo) {
        Prodotto prodotto = null;
        
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("SELECT * from prodotto where Logo_idLogo = "+idLogo+";");

            rs.next();
            if(rs.getRow() == 1){
                 prodotto = new Prodotto(rs.getInt("idProdotto"),rs.getString("Nome"),rs.getString("Note"),rs.getInt("CategoriaProdotto_idCategoriaProdotto"),rs.getInt("Logo_idLogo"));
            }else{ prodotto = null;}
        } catch (SQLException ex) {
           Logger.getLogger(JDBCProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return prodotto;
    }

    @Override
    public void insertProdottoLista(Prodotto prodotto) {
        try (Statement stm = CON.createStatement()){
            stm.execute("INSERT INTO `prodotto`(`Nome`, `Note`, `CategoriaProdotto_idCategoriaProdotto`, `Logo_idLogo`,`idLista`) VALUES ('"+prodotto.getNome()+"','"+prodotto.getNote()+"',"+prodotto.getIdCategoriaProdotto()+","+prodotto.getIdLogo()+","+prodotto.getIdLista()+");");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deleteProdottoLista(int idLista) {
        try (Statement stm = CON.createStatement()){
           stm.execute("DELETE FROM prodotto WHERE  idLista="+idLista+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Prodotto> getProdottoLista() {
        List<Prodotto> prodotti = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("select prodotto.idProdotto, prodotto.Nome, Note, prodotto.CategoriaProdotto_idCategoriaProdotto, categoriaprodotto.Nome as nomeCat, prodotto.Logo_idLogo, logo.Indirizzo as indirizzoL , idLista FROM prodotto, logo, categoriaprodotto WHERE prodotto.CategoriaProdotto_idCategoriaProdotto = categoriaprodotto.idCategoriaProdotto and prodotto.Logo_idLogo = logo.idLogo and prodotto.idLista = '-1'");
            while(rs.next()){
                prodotti.add(new Prodotto(rs.getInt("idProdotto"),rs.getString("Nome"),rs.getString("Note"),rs.getInt("CategoriaProdotto_idCategoriaProdotto"),rs.getString("nomeCat"),rs.getInt("Logo_idLogo"),rs.getString("indirizzoL"),rs.getInt("idLista")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return prodotti;
    }
    
    
}
