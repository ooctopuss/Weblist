/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos.jdbc;

import db.daos.ListaSpesa_has_ProdottoDAO;
import db.entities.ListaSpesa_has_Prodotto;
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
public class JDBCListaSpesa_has_ProdottoDAO extends JDBCDAO<ListaSpesa_has_Prodotto, Integer> implements ListaSpesa_has_ProdottoDAO {

    public JDBCListaSpesa_has_ProdottoDAO(Connection con) {
        super(con);
    }

    @Override
    public Long getCount() throws DAOException {
        try (Statement stmt = CON.createStatement()) {
            ResultSet counter = stmt.executeQuery("SELECT COUNT(*) FROM listaspesa_has_prodotto");
            if (counter.next()) {
                return counter.getLong(1);
            }

        } catch (SQLException ex) {
            throw new DAOException("Impossible to count prodotto", ex);
        }

        return 0L;
    }

    @Override
    public ListaSpesa_has_Prodotto getByPrimaryKey(Integer primaryKey) throws DAOException {
        ListaSpesa_has_Prodotto listaP = null;
        if (primaryKey == null) {
            throw new DAOException("primaryKey is null");
        }
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("SELECT * from listaspesa_has_prodotto where ListaSpesa_idListaSpesa ="+primaryKey);
            rs.next();
            if(rs.getRow() == 1){
                listaP = new ListaSpesa_has_Prodotto(rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("Prodotto_idProdotto"),rs.getInt("checked"));

            }else{ listaP = null;}
            
            
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get prodotto for the passed primary key", ex);
        }
        return listaP;
    }

    @Override
    public List<ListaSpesa_has_Prodotto> getAll() throws DAOException {
        List<ListaSpesa_has_Prodotto> listeP = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("select * from listaspesa_has_prodotto");
            while(rs.next()){
                listeP.add(new ListaSpesa_has_Prodotto(rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("Prodotto_idProdotto"),rs.getInt("checked")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listeP;
    }

    @Override
    public ListaSpesa_has_Prodotto getListaP(int idProdotto)throws DAOException {
        ListaSpesa_has_Prodotto listaP = null;
        
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("SELECT * from listaspesa_has_prodotto where Prodotto_idProdotto ="+idProdotto);
            rs.next();
            if(rs.getRow() == 1){
                listaP = new ListaSpesa_has_Prodotto(rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("Prodotto_idProdotto"),rs.getInt("checked"));

            }else{ listaP = null;}
            
            
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get prodotto for the passed primary key", ex);
        }
        return listaP;
    }

    @Override
    public void updateListaP(ListaSpesa_has_Prodotto listaP) {
        try (Statement stm = CON.createStatement()){
            stm.execute("UPDATE `listaspesa_has_prodotto` SET `ListaSpesa_idListaSpesa`="+listaP.getIdListaSpesa()+",`Prodotto_idProdotto`="+listaP.getIdProdotto()+",`checked`="+listaP.getChecked()+" WHERE Prodotto_idProdotto = "+listaP.getIdProdotto()+" and ListaSpesa_idListaSpesa ="+listaP.getIdListaSpesa()+" ;");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deleteListaP(int idLista, int idProdotto) {
        try (Statement stm = CON.createStatement()){
           stm.execute("DELETE FROM listaspesa_has_prodotto WHERE Prodotto_idProdotto ="+idProdotto+" and ListaSpesa_idListaSpesa ="+idLista+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insertListaSpesa(ListaSpesa_has_Prodotto lista) {
         try (Statement stm = CON.createStatement()){
            stm.execute("INSERT INTO `listaspesa_has_prodotto`(`ListaSpesa_idListaSpesa`, `Prodotto_idProdotto`, `checked`) VALUES ("+lista.getIdListaSpesa()+","+lista.getIdProdotto()+","+lista.getChecked()+");");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public boolean checkListaP(int idListaS, int idProdotto) {
        boolean bool = false;
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select * from listaspesa_has_prodotto WHERE ListaSpesa_idListaSpesa ="+idListaS+" and Prodotto_idProdotto ="+idProdotto+";");

            rs.next();
            if(rs.getRow() == 1){
                bool = true;
            }else{ bool = false;}
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return bool;
    }
    
    @Override
    public ListaSpesa_has_Prodotto getLista(int idProdotto,int idLista)throws DAOException {
        ListaSpesa_has_Prodotto listaP = null;
        
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("SELECT * from listaspesa_has_prodotto where Prodotto_idProdotto ="+idProdotto+" and ListaSpesa_idListaSpesa ="+idLista);
            rs.next();
            if(rs.getRow() == 1){
                listaP = new ListaSpesa_has_Prodotto(rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("Prodotto_idProdotto"),rs.getInt("checked"));

            }else{ listaP = null;}
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get prodotto for the passed primary key", ex);
        }
        return listaP;
    }


    
}
