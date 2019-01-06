/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos.jdbc;

import db.daos.MessaggioDAO;
import db.entities.Messaggio;
import db.exceptions.DAOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Safouane
 */
public class JDBCMessaggioDAO extends JDBCDAO<Messaggio, Integer> implements MessaggioDAO{

    public JDBCMessaggioDAO(Connection con) {
        super(con);
    }

    @Override
    public Long getCount() throws DAOException {
        try (Statement stmt = CON.createStatement()) {
            ResultSet counter = stmt.executeQuery("SELECT COUNT(*) FROM messaggio");
            if (counter.next()) {
                return counter.getLong(1);
            }

        } catch (SQLException ex) {
            throw new DAOException("Impossible to count immagine", ex);
        }

            return 0L;   
    }

    @Override
    public Messaggio getByPrimaryKey(Integer primaryKey) throws DAOException {
        if (primaryKey == null) {
            throw new DAOException("primaryKey is null");
        }
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select * from messaggio where idMessaggio = "+primaryKey+";");
            rs.next();
            return  new Messaggio(rs.getInt("idMessaggio"),rs.getString("messaggio"),rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("Utente_idUtente"),rs.getTimestamp("oraInvio"));
            
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get the immagine for the passed primary key", ex);
        }
    }

    @Override
    public List<Messaggio> getAll() throws DAOException {
        List<Messaggio> messaggi = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("select * from messaggio ORDER BY oraInvio;");
            while(rs.next()){
                messaggi.add(new Messaggio(rs.getInt("idMessaggio"),rs.getString("messaggio"),rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("Utente_idUtente"),rs.getTimestamp("oraInvio")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCLogoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return messaggi;
    }

    @Override
    public Messaggio getMessaggioUtenteId(int idUtente) throws DAOException {
        Messaggio messaggio = null;
        try(Statement stm = CON.createStatement()) {
            ResultSet rs = stm.executeQuery("select * from messaggio where Utente_idUtente = "+idUtente+";");
            rs.next();
            if(rs.getRow() == 1){
                messaggio = new Messaggio(rs.getInt("idMessaggio"),rs.getString("messaggio"),rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("Utente_idUtente"));
             }else {messaggio = null;}
        } catch (SQLException ex) {
            Logger.getLogger(JDBCLogoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return messaggio;
    }

    @Override
    public void updateMessaggio(Messaggio messaggio) {
        try(Statement stm = CON.createStatement()) {
            stm.execute("UPDATE `messaggio` SET `messaggio`='"+messaggio.getMessaggio()+"' WHERE 'idMessaggio' = "+messaggio.getIdMessaggio()+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCLogoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deleteMessaggio(int id) {
        try (Statement stm = CON.createStatement()){
           stm.execute("DELETE FROM `messaggio` WHERE idMessaggio ="+id+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCLogoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insertMessaggio(Messaggio messaggio) {
        try (Statement stm = CON.createStatement()){
            stm.execute("INSERT INTO `messaggio`(`messaggio`,`ListaSpesa_idListaSpesa`,`Utente_idUtente`) VALUES ('"+messaggio.getMessaggio()+"',"+messaggio.getListaSpesa_idListaSpesa()+","+messaggio.getUtente_idUtente()+");");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCLogoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Messaggio> getAllMessaggioLista(int idLista) throws DAOException {
        List<Messaggio> messaggi = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("select * from messaggio where ListaSpesa_idListaSpesa = "+idLista+" ORDER BY oraInvio;");
            while(rs.next()){
                messaggi.add(new Messaggio(rs.getInt("idMessaggio"),rs.getString("messaggio"),rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("Utente_idUtente"),rs.getTimestamp("oraInvio")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCLogoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return messaggi;
    }

    @Override
    public List<Messaggio> getMessaggioNuovo(int idLista, Timestamp ora) throws DAOException {
        List<Messaggio> messaggi = new ArrayList<>();
       
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("select * from messaggio where ListaSpesa_idListaSpesa = "+idLista+" and oraInvio > '"+ora+"' ORDER BY oraInvio;");
            while(rs.next()){
                messaggi.add(new Messaggio(rs.getInt("idMessaggio"),rs.getString("messaggio"),rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("Utente_idUtente"),rs.getTimestamp("oraInvio")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCLogoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return messaggi;
    }
    
}
