/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos.jdbc;

import db.daos.LogoDAO;
import db.entities.Logo;
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
public class JDBCLogoDAO extends JDBCDAO<Logo, Integer> implements LogoDAO{

    public JDBCLogoDAO(Connection con) {
        super(con);
    }

    @Override
    public Long getCount() throws DAOException {
        try (Statement stmt = CON.createStatement()) {
            ResultSet counter = stmt.executeQuery("SELECT COUNT(*) FROM logo");
            if (counter.next()) {
                return counter.getLong(1);
            }

        } catch (SQLException ex) {
            throw new DAOException("Impossible to count immagine", ex);
        }

            return 0L;   
    }

    @Override
    public Logo getByPrimaryKey(Integer primaryKey) throws DAOException {
        if (primaryKey == null) {
            throw new DAOException("primaryKey is null");
        }
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select * from logo where idLogo = "+primaryKey+";");
            rs.next();
            return  new Logo(rs.getInt("idLogo"),rs.getString("Indirizzo"));
            
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get the immagine for the passed primary key", ex);
        }
    }

    @Override
    public List<Logo> getAll() throws DAOException {
        List<Logo> loghi = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("select * from logo;");
            while(rs.next()){
                loghi.add(new Logo(rs.getInt("idLogo"),rs.getString("Indirizzo")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCLogoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return loghi;
    }

    @Override
    public Logo getLogo(String indirizzo) {
        Logo logo = null;
        try(Statement stm = CON.createStatement()) {
            ResultSet rs = stm.executeQuery("select * from logo where indirizzo = '"+indirizzo+"';");
            rs.next();
            if(rs.getRow() == 1){
                logo = new Logo(rs.getInt("idLogo"),rs.getString("Indirizzo"));
             }else {logo = null;}
        } catch (SQLException ex) {
            Logger.getLogger(JDBCLogoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return logo;
    }

    @Override
    public void updateLogo(Logo logo) {
        try(Statement stm = CON.createStatement()) {
            stm.execute("UPDATE `logo` SET `Indirizzo`='"+logo.getIndirizzo()+"' WHERE 'idLogo' = "+logo.getId()+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCLogoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deleteLogo(String indirizzo) {
        try (Statement stm = CON.createStatement()){
           stm.execute("DELETE FROM `logo` WHERE Indirizzo ='"+indirizzo+"';");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCLogoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insertLogo(Logo logo) {
        try (Statement stm = CON.createStatement()){
            stm.execute("INSERT INTO `logo`(`Indirizzo`) VALUES ('"+logo.getIndirizzo()+"');");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCLogoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
