/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos.jdbc;

import db.daos.CategoriaListaDAO;
import db.entities.CategoriaLista;
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
public class JDBCCategoriaListaDAO extends JDBCDAO<CategoriaLista, Integer> implements CategoriaListaDAO{

    public JDBCCategoriaListaDAO(Connection con) {
        super(con);
    }

    @Override
    public Long getCount() throws DAOException {
        try (Statement stmt = CON.createStatement()) {
            ResultSet counter = stmt.executeQuery("SELECT COUNT(*) FROM categoriaLista");
            if (counter.next()) {
                return counter.getLong(1);
            }

        } catch (SQLException ex) {
            throw new DAOException("Impossible to count categoria lista", ex);
        }

        return 0L;
    }

    @Override
    public CategoriaLista getByPrimaryKey(Integer primaryKey) throws DAOException {
        if (primaryKey == null) {
            throw new DAOException("primaryKey is null");
        }
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("SELECT idCategoriaLista, Nome, Descrizione, idTypes  from categorialista WHERE categorialista.idCategoriaLista = "+primaryKey+";");
            rs.next();
            return  new CategoriaLista(rs.getInt("idCategoriaLista"),rs.getString("Nome"),rs.getString("Descrizione"),rs.getInt("idTypes"));
            
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get the categoriaLista for the passed primary key", ex);
        }
    }

    @Override
    public List<CategoriaLista> getAll() throws DAOException {
        List<CategoriaLista> liste = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("SELECT idCategoriaLista, Nome, Descrizione, idTypes from categorialista ;");

            while(rs.next()){
                liste.add(new CategoriaLista(rs.getInt("idCategoriaLista"),rs.getString("Nome"),rs.getString("Descrizione"),rs.getInt("idTypes")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCCategoriaListaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return liste;
    }

    @Override
    public CategoriaLista getCategoriaLista(String nome) throws DAOException{
        if (nome == null) {
            throw new DAOException("nome is mandatory field", new NullPointerException("nome is null"));
        }
        CategoriaLista categoria = null;
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("SELECT idCategoriaLista, Nome, Descrizione , idTypes from categorialista WHERE categorialista.Nome = '"+nome+"';");

            rs.next();
            if(rs.getRow() == 1){
                categoria = new CategoriaLista(rs.getInt("idCategoriaLista"),rs.getString("Nome"),rs.getString("Descrizione"),rs.getInt("idTypes"));
            }else{ categoria = null;}
        } catch (SQLException ex) {
            Logger.getLogger(JDBCCategoriaListaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return categoria;
    }

    @Override
    public void updateCategoriaLista(CategoriaLista categoria) {
        try (Statement stm = CON.createStatement()){
            stm.execute("UPDATE `categoriaLista` SET `Nome`='"+categoria.getNome()+"',`Descrizione`='"+categoria.getDescrizione()+"', `idTypes`="+categoria.getIdTypes()+" WHERE idCategoriaLista = "+categoria.getId()+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCCategoriaListaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deleteCategoriaLista(int id) {
        try (Statement stm = CON.createStatement()){
           stm.execute("DELETE FROM categoriaLista WHERE idCategoriaLista ="+id+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCCategoriaListaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insertCategoriaLista(CategoriaLista categoria) {
        try (Statement stm = CON.createStatement()){
            stm.execute("INSERT INTO `categoriaLista`(`Nome`, `Descrizione`,`idTypes` ) VALUES ('"+categoria.getNome()+"','"+categoria.getDescrizione()+"',"+categoria.getIdTypes()+");");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCCategoriaListaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public CategoriaLista getCatIdTypes(int idTypes) throws DAOException {
        
        CategoriaLista categoria = null;
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("SELECT idCategoriaLista, Nome, Descrizione , idTypes from categorialista WHERE categorialista.idTypes = "+idTypes+";");

            rs.next();
            if(rs.getRow() == 1){
                categoria = new CategoriaLista(rs.getInt("idCategoriaLista"),rs.getString("Nome"),rs.getString("Descrizione"),rs.getInt("idTypes"));
            }else{ categoria = null;}
        } catch (SQLException ex) {
            Logger.getLogger(JDBCCategoriaListaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return categoria;
    }
    
}
