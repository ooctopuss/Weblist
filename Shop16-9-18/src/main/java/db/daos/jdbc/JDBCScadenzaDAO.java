/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos.jdbc;

import db.daos.ScadenzaDAO;
import db.entities.Scadenza;
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
public class JDBCScadenzaDAO extends JDBCDAO<Scadenza, Integer> implements ScadenzaDAO{

    public JDBCScadenzaDAO(Connection con) {
        super(con);
    }

    @Override
    public Long getCount() throws DAOException {
        try (Statement stmt = CON.createStatement()) {
            ResultSet counter = stmt.executeQuery("SELECT COUNT(*) FROM scadenza");
            if (counter.next()) {
                return counter.getLong(1);
            }

        } catch (SQLException ex) {
            throw new DAOException("Impossible to count users", ex);
        }

        return 0L;
    }

    @Override
    public Scadenza getByPrimaryKey(Integer primaryKey) throws DAOException {
        if (primaryKey == null) {
            throw new DAOException("primaryKey is null");
        }
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select * from scadenza where ListaSpesa_idListaSpesa = "+primaryKey+";");
            rs.next();
            return new Scadenza(rs.getInt("Prodotto_idProdotto"),rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("media"),rs.getInt("contatore"),rs.getTime("primo"),rs.getTime("ultimo"),rs.getInt("visto"));

            
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get the user for the passed primary key", ex);
        }
    }

    @Override
    public List<Scadenza> getAll() throws DAOException {
        List<Scadenza> scadenze = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("select * from scadenza");
            while(rs.next()){
                scadenze.add( new Scadenza(rs.getInt("Prodotto_idProdotto"),rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("media"),rs.getInt("contatore"),rs.getTime("primo"),rs.getTime("ultimo"),rs.getInt("visto")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return scadenze;
    }

    @Override
    public Scadenza getScadenza(int idProdotto, int idListaSpesa) throws DAOException {
        
        Scadenza scadenza = null;
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select * from scadenza WHERE Prodotto_idProdotto ="+idProdotto+" and ListaSpesa_idListaSpesa = "+idListaSpesa+" ;");

            rs.next();
            if(rs.getRow() == 1){
                scadenza =  new Scadenza(rs.getInt("Prodotto_idProdotto"),rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("media"),rs.getInt("contatore"),rs.getTime("primo"),rs.getTime("ultimo"),rs.getInt("visto"));

            }else{ scadenza = null;}
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return scadenza;
    }

    @Override
    public void updateScadenza(Scadenza scadenza) {
        try (Statement stm = CON.createStatement()){
            stm.execute("UPDATE `scadenza` SET `media`="+scadenza.getMedia()+",`contatore`="+scadenza.getContatore()+",`primo`='"+scadenza.getPrimo()+"',`ultimo`='"+scadenza.getUltimo()+"',`visto`="+scadenza.getVisto()+" WHERE Prodotto_idProdotto = "+scadenza.getIdProdotto()+" and ListaSpesa_idListaSpesa = "+scadenza.getIdListaSpesa()+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deleteScadenza(Scadenza scadenza) {
        try (Statement stm = CON.createStatement()){
           stm.execute("DELETE FROM scadenza WHERE Prodotto_idProdotto ="+scadenza.getIdProdotto()+" and ListaSpesa_idListaSpesa = "+scadenza.getIdListaSpesa()+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public void insertScadenza(Scadenza scadenza) {
        try (Statement stm = CON.createStatement()){
            stm.execute("INSERT INTO `scadenza`(`Prodotto_idProdotto`, `ListaSpesa_idListaSpesa`, `media`, `contatore`, `primo`, `ultimo`,`visto`) VALUES ("+scadenza.getIdProdotto()+","+scadenza.getIdListaSpesa()+","+scadenza.getMedia()+","+scadenza.getContatore()+",'"+scadenza.getPrimo()+"' , '"+scadenza.getUltimo()+"',"+scadenza.getVisto()+")");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Scadenza> getAllScadList(int idListaSpesa) throws DAOException {
        List<Scadenza> scadenze = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select * from scadenza where ListaSpesa_idListaSpesa = "+idListaSpesa+";");
            
            while(rs.next()){
                scadenze.add(new Scadenza(rs.getInt("Prodotto_idProdotto"),rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("media"),rs.getInt("contatore"),rs.getTime("primo"),rs.getTime("ultimo"),rs.getInt("visto"),rs.getInt("contEmail")));
            }
            
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get the user for the passed primary key", ex);
        }
        return scadenze;
    }

    @Override
    public int getContEmail(int idProdotto, int idListaSpesa) throws DAOException {
        int cont = -1;
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select contEmail from scadenza where ListaSpesa_idListaSpesa = "+idListaSpesa+" and Prodotto_idProdotto ="+idProdotto+";");
            
            while(rs.next()){
                cont = rs.getInt("contEmail");
            }
            
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get the user for the passed primary key", ex);
        }
        return cont;
    }

    @Override
    public void updateContEmail(Scadenza scadenza) {
        try (Statement stm = CON.createStatement()){
            stm.execute("UPDATE `scadenza` SET `contEmail`="+scadenza.getContEmail()+" WHERE Prodotto_idProdotto = "+scadenza.getIdProdotto()+" and ListaSpesa_idListaSpesa = "+scadenza.getIdListaSpesa()+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
