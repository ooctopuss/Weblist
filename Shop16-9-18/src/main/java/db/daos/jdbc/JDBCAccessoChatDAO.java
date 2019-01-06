/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos.jdbc;

import db.daos.AccessoChatDAO;
import db.entities.AccessoChat;
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
 * @author Safouane
 */
public class JDBCAccessoChatDAO extends JDBCDAO<AccessoChat, Integer> implements AccessoChatDAO{

    public JDBCAccessoChatDAO(Connection con) {
        super(con);
    }

    @Override
    public Long getCount() throws DAOException {
        try (Statement stmt = CON.createStatement()) {
            ResultSet counter = stmt.executeQuery("SELECT COUNT(*) FROM accessochat");
            if (counter.next()) {
                return counter.getLong(1);
            }

        } catch (SQLException ex) {
            throw new DAOException("Impossible to count accessochat", ex);
        }

        return 0L;
    }

    @Override
    public AccessoChat getByPrimaryKey(Integer primaryKey) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<AccessoChat> getAll() throws DAOException {
        List<AccessoChat> accessi = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("select * from accessochat");
            while(rs.next()){
                accessi.add(new AccessoChat(rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("Utente_idUtente"),rs.getTimestamp("ultimo")));
            } 
        } catch (SQLException ex) {
            Logger.getLogger(JDBCProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accessi;
    }

    @Override
    public AccessoChat getAccessoChat(int idLista, int idUtente) throws DAOException {
        AccessoChat accesso = null;
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("SELECT * from accessochat where ListaSpesa_idListaSpesa ="+idLista+" and Utente_idUtente = "+idUtente);
            rs.next();
            if(rs.getRow() == 1){
                 accesso = new AccessoChat(rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("Utente_idUtente"),rs.getTimestamp("ultimo"));

            }else{ accesso = null;}
        } catch (SQLException ex) {
            Logger.getLogger(JDBCProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return accesso;
    }

    @Override
    public void updateAccessoChat(AccessoChat accesso) {
        
        try (Statement stm = CON.createStatement()){
            stm.execute("UPDATE `accessochat` SET `ultimo`='"+accesso.getUltimo()+"' WHERE ListaSpesa_idListaSpesa = "+accesso.getIdListaSpesa()+" and Utente_idUtente = "+accesso.getIdUtente()+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deleteAccessoChat(int idLista, int idUtente) {
        try (Statement stm = CON.createStatement()){
           stm.execute("DELETE FROM accessochat WHERE ListaSpesa_idListaSpesa ="+idLista+" and Utente_idUtente = "+idUtente+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCProdottoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insertAccessoChat(AccessoChat accesso) {
        try (Statement stm = CON.createStatement()){
            stm.execute("INSERT INTO `accessochat`(`ListaSpesa_idListaSpesa`, `Utente_idUtente`) VALUES ("+accesso.getIdListaSpesa()+","+accesso.getIdUtente()+");");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insertAccessoChatU(AccessoChat accesso) {
        try (Statement stm = CON.createStatement()){
            stm.execute("INSERT INTO `accessochat`(`ListaSpesa_idListaSpesa`, `Utente_idUtente`, `ultimo`) VALUES ("+accesso.getIdListaSpesa()+","+accesso.getIdUtente()+","+accesso.getUltimo()+");");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
