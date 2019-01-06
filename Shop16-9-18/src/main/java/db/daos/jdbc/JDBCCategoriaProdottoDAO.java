/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos.jdbc;

import db.daos.CategoriaProdottoDAO;
import db.entities.CategoriaProdotto;
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
public class JDBCCategoriaProdottoDAO extends JDBCDAO<CategoriaProdotto, Integer> implements CategoriaProdottoDAO{

    public JDBCCategoriaProdottoDAO(Connection con) {
        super(con);
    }

    @Override
    public Long getCount() throws DAOException {
        try (Statement stmt = CON.createStatement()) {
            ResultSet counter = stmt.executeQuery("SELECT COUNT(*) FROM categoriaProdotto");
            if (counter.next()) {
                return counter.getLong(1);
            }

        } catch (SQLException ex) {
            throw new DAOException("Impossible to count categoria lista", ex);
        }

        return 0L;
    }

    @Override
    public CategoriaProdotto getByPrimaryKey(Integer primaryKey) throws DAOException {
        
        if (primaryKey == null) {
            throw new DAOException("primaryKey is null");
        }
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select idCategoriaProdotto, nome, Descrizione, Logo_idLogo, logo.Indirizzo as indirizzoL from logo, categoriaprodotto WHERE Logo_idLogo = logo.idLogo and categoriaprodotto.idCategoriaProdotto = "+primaryKey+";");
            rs.next();
            return  new CategoriaProdotto(rs.getInt("idCategoriaProdotto"),rs.getString("Nome"),rs.getString("Descrizione"),rs.getInt("Logo_idLogo"),rs.getString("indirizzoL"));
            
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get the categoriaProdotto for the passed primary key", ex);
        }
    }

    @Override
    public List<CategoriaProdotto> getAll() throws DAOException {
        List<CategoriaProdotto> liste = new ArrayList<>();
         
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("select idCategoriaProdotto, nome, Descrizione, Logo_idLogo, logo.Indirizzo as indirizzoL from logo, categoriaprodotto WHERE Logo_idLogo = logo.idLogo ");
           
            while(rs.next()){
                
                liste.add(new CategoriaProdotto(rs.getInt("idCategoriaProdotto"),rs.getString("Nome"),rs.getString("Descrizione"),rs.getInt("Logo_idLogo"),rs.getString("indirizzoL")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCCategoriaProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return liste;
    }

    @Override
    public CategoriaProdotto getCategoriaProdotto(String nome) throws DAOException{
        if (nome == null) {
            throw new DAOException("nome is mandatory field", new NullPointerException("nome is null"));
        }
        CategoriaProdotto categoria = null;
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select idCategoriaProdotto, nome, Descrizione, Logo_idLogo, logo.Indirizzo as indirizzoL from logo, categoriaprodotto WHERE Logo_idLogo = logo.idLogo and nome = '"+nome+"';");
            rs.next();
            if(rs.getRow() == 1){
                categoria = new CategoriaProdotto(rs.getInt("idCategoriaProdotto"),rs.getString("Nome"),rs.getString("Descrizione"),rs.getInt("Logo_idLogo"));
            }else{ categoria = null;}
        } catch (SQLException ex) {
            Logger.getLogger(JDBCCategoriaProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return categoria;
    }

    @Override
    public void updateCategoriaProdotto(CategoriaProdotto categoria) {
        try (Statement stm = CON.createStatement()){
            stm.execute("UPDATE `categoriaProdotto` SET `Nome`='"+categoria.getNome()+"',`Descrizione`='"+categoria.getDescrizione()+"',`Logo_idLogo`='"+categoria.getIdLogo()+"' WHERE idCategoriaProdotto = '"+categoria.getId()+"';");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCCategoriaProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deleteCategoriaProdotto(int id) {
        try (Statement stm = CON.createStatement()){
           stm.execute("DELETE FROM `categoriaProdotto` WHERE idCategoriaProdotto ="+id+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCCategoriaProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insertCategoriaProdotto(CategoriaProdotto categoria) {
        try (Statement stm = CON.createStatement()){
            stm.execute("INSERT INTO `categoriaProdotto`(`Nome`, `Descrizione`,`Logo_idLogo` ) VALUES ('"+categoria.getNome()+"','"+categoria.getDescrizione()+"',"+categoria.getIdLogo()+");");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCCategoriaProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}

