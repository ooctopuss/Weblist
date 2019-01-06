/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos.jdbc;

import db.daos.TypesDAO;
import db.entities.Types;
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
public class JDBCTypesDAO extends JDBCDAO<Types, Integer> implements TypesDAO {

    public JDBCTypesDAO(Connection con) {
        super(con);
    }

    @Override
    public Long getCount() throws DAOException {
        try (Statement stmt = CON.createStatement()) {
            ResultSet counter = stmt.executeQuery("SELECT COUNT(*) FROM types");
            if (counter.next()) {
                return counter.getLong(1);
            }

        } catch (SQLException ex) {
            throw new DAOException("Impossible to count types", ex);
        }

        return 0L;
    }

    @Override
    public Types getByPrimaryKey(Integer primaryKey) throws DAOException {
        if (primaryKey == null) {
            throw new DAOException("primaryKey is null");
        }
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("SELECT idTypes, nomeIng,nomeIt  from types WHERE idTypes = "+primaryKey+";");
            rs.next();
            return  new Types(rs.getInt("idTypes"),rs.getString("nomeIng"),rs.getString("nomeIt"));
            
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get the categoriaLista for the passed primary key", ex);
        }
    }

    @Override
    public List<Types> getAll() throws DAOException {
        List<Types> liste = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("SELECT * from types ;");

            while(rs.next()){
                liste.add(new Types(rs.getInt("idTypes"),rs.getString("nomeIng"),rs.getString("nomeIt")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCCategoriaListaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return liste;
    }
    
}
