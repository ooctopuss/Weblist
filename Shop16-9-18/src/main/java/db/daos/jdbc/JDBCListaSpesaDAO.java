/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos.jdbc;

import db.daos.ListaSpesaDAO;
import db.entities.ListaSpesa;
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
public class JDBCListaSpesaDAO extends JDBCDAO<ListaSpesa, Integer> implements ListaSpesaDAO{

    public JDBCListaSpesaDAO(Connection con) {
        super(con);
    }

    @Override
    public Long getCount() throws DAOException {
        try (Statement stmt = CON.createStatement()) {
            ResultSet counter = stmt.executeQuery("SELECT COUNT(*) FROM ListaSpesa");
            if (counter.next()) {
                return counter.getLong(1);
            }

        } catch (SQLException ex) {
            throw new DAOException("Impossible to count ListaSpesa", ex);
        }
        return 0L;
    }

    @Override
    public ListaSpesa getByPrimaryKey(Integer primaryKey) throws DAOException {
        if (primaryKey == null) {
            throw new DAOException("primaryKey is null");
        }
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select * from listaSpesa where idListaSpesa = "+primaryKey+";");
            rs.next();
            return  new ListaSpesa(rs.getInt("idListaSpesa"),rs.getString("Nome"),rs.getString("Descrizione"),rs.getInt("CategoriaLista_idCategoriaLista"),rs.getInt("Immagini_idImmagini"));
            
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get ListaSpesa for the passed primary key", ex);
        }
    }

    @Override
    public List<ListaSpesa> getAll() throws DAOException {
        List<ListaSpesa> liste = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("select * from listaSpesa;");
            while(rs.next()){
                liste.add(new ListaSpesa(rs.getInt("idListaSpesa"),rs.getString("Nome"),rs.getString("Descrizione"),rs.getInt("CategoriaLista_idCategoriaLista"),rs.getInt("Immagini_idImmagini")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCListaSpesaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return liste;
    }

    @Override
    public ListaSpesa getListaSpesa(int id) {
        ListaSpesa lista = null;
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select * from listaSpesa where idListaSpesa = "+id+";");
            rs.next();
            if(rs.getRow() == 1){
                lista = new ListaSpesa(rs.getInt("idListaSpesa"),rs.getString("Nome"),rs.getString("Descrizione"),rs.getInt("CategoriaLista_idCategoriaLista"),rs.getInt("Immagini_idImmagini"));
            }else{ lista = null;}
        } catch (SQLException ex) {
            Logger.getLogger(JDBCListaSpesaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    @Override
    public void updateListaSpesa(ListaSpesa lista) {
        try (Statement stm = CON.createStatement()){
            stm.execute("UPDATE `listaSpesa` SET `Nome`='"+lista.getNome()+"',`Descrizione`='"+lista.getDescrizione()+"',`CategoriaLista_idCategoriaLista`="+lista.getIdCategoriaLista()+", `Immagini_idImmagini` = "+lista.getIdImmagine()+" WHERE idListaSpesa = "+lista.getId()+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCListaSpesaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deleteListaSpesa(int id) {
        try (Statement stm = CON.createStatement()){
           stm.execute("DELETE FROM listaSpesa WHERE idListaSpesa ="+id+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCListaSpesaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insertListaSpesa(ListaSpesa lista) {
        try (Statement stm = CON.createStatement()){
            stm.execute("INSERT INTO `listaSpesa` (`Nome`, `Descrizione`, `CategoriaLista_idCategoriaLista`,`Immagini_idImmagini` ) VALUES ('"+lista.getNome()+"','"+lista.getDescrizione()+"',"+lista.getIdCategoriaLista()+","+lista.getIdImmagine()+");");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCListaSpesaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public ListaSpesa getListaImmagine(int idImmagine) throws DAOException{
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select * from listaSpesa where Immagini_idImmagini = "+idImmagine+";");
            rs.next();
            return  new ListaSpesa(rs.getInt("idListaSpesa"),rs.getString("Nome"),rs.getString("Descrizione"),rs.getInt("CategoriaLista_idCategoriaLista"),rs.getInt("Immagini_idImmagini"));
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get ListaSpesa for the passed primary key", ex);
        }
    }
    
}
