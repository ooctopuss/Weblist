/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos.jdbc;

import db.daos.UtenteDAO;
import db.entities.Utente;
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
public class JDBCUtenteDAO extends JDBCDAO<Utente, Integer> implements UtenteDAO{
    public JDBCUtenteDAO(Connection con) {
        super(con);
    }

    @Override
    public Long getCount() throws DAOException {
        try (Statement stmt = CON.createStatement()) {
            ResultSet counter = stmt.executeQuery("SELECT COUNT(*) FROM utente");
            if (counter.next()) {
                return counter.getLong(1);
            }

        } catch (SQLException ex) {
            throw new DAOException("Impossible to count users", ex);
        }

        return 0L;
    }

    @Override
    public Utente getByPrimaryKey(Integer primaryKey) throws DAOException {
        if (primaryKey == null) {
            throw new DAOException("primaryKey is null");
        }
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select idUtente, nome, Cognome,email, password,Immagini_idImmagini, immagine.Indirizzo as indirizzoI, admin,checked, identificativo from utente where idUtente = "+primaryKey+";");
            rs.next();
            return new Utente(rs.getInt("idUtente"),rs.getString("Nome"),rs.getString("Cognome"),rs.getInt("Immagini_idImmagini"),rs.getString("indirizzoI"),rs.getString("email"),rs.getString("password"),rs.getInt("admin"),rs.getInt("checked"),rs.getInt("identificativo"));

            
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get the user for the passed primary key", ex);
        }
    }

    @Override
    public List<Utente> getAll() throws DAOException {
        List<Utente> utenti = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("select idUtente, nome, Cognome,email, password,Immagini_idImmagini, immagine.Indirizzo as indirizzoI, admin,checked, identificativo from utente, immagine WHERE Immagini_idImmagini = immagine.idImmagini");
            while(rs.next()){
                utenti.add(new Utente(rs.getInt("idUtente"),rs.getString("Nome"),rs.getString("Cognome"),rs.getInt("Immagini_idImmagini"),rs.getString("indirizzoI"),rs.getString("email"),rs.getString("password"),rs.getInt("admin"),rs.getInt("checked"),rs.getInt("identificativo")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return utenti;
    }

    @Override
    public Utente getUtente(String email) throws DAOException {
        if (email == null) {
            throw new DAOException("Email is mandatory field", new NullPointerException("email is null"));
        }
        Utente utente = null;
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select idUtente, nome, Cognome,email, password,Immagini_idImmagini, immagine.Indirizzo as indirizzoI, admin, checked,identificativo from utente, immagine WHERE Immagini_idImmagini = immagine.idImmagini and email = '"+email+"'");

            rs.next();
            if(rs.getRow() == 1){
                utente = new Utente(rs.getInt("idUtente"),rs.getString("Nome"),rs.getString("Cognome"),rs.getInt("Immagini_idImmagini"),rs.getString("indirizzoI"),rs.getString("email"),rs.getString("password"),rs.getInt("admin"),rs.getInt("checked"),rs.getInt("identificativo"));
            }else{ utente = null;}
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return utente;
    }

    @Override
    public void updateUtente(Utente utente) {
        try (Statement stm = CON.createStatement()){
            stm.execute("UPDATE `utente` SET `Nome`='"+utente.getNome()+"',`Cognome`='"+utente.getCognome()+"',`email`='"+utente.getEmail()+"',`password`='"+utente.getPassword()+"',`Immagini_idImmagini`="+utente.getAvatar()+",`admin` ="+utente.getAdmin()+" WHERE email = '"+utente.getEmail()+"';");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deleteUtente(String email) {
        try (Statement stm = CON.createStatement()){
           stm.execute("DELETE FROM `utente` WHERE email ='"+email+"';");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insertUtente(Utente utente) {
        try (Statement stm = CON.createStatement()){
            stm.execute("INSERT INTO `utente`(`Nome`, `Cognome`, `email`, `password`,`Immagini_idImmagini`,`admin`,`identificativo` ) VALUES ('"+utente.getNome()+"','"+utente.getCognome()+"','"+utente.getEmail()+"','"+utente.getPassword()+"',"+1+","+utente.getAdmin()+","+utente.getIdentificativo()+");");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public void updateAmmUtente(int admin, String email){
        try (Statement stm = CON.createStatement()){
            
            stm.execute("UPDATE `utente` SET `admin` ="+admin+" WHERE email = '"+email+"';");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public void updatePsw(String password, String email){
        try (Statement stm = CON.createStatement()){
            
            stm.execute("UPDATE `utente` SET `password` ='"+password+"' WHERE email = '"+email+"';");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public void updateImm(int immagine, String email){
        try (Statement stm = CON.createStatement()){
            
            stm.execute("UPDATE `utente` SET `Immagini_idImmagini` ="+immagine+" WHERE email = '"+email+"';");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public boolean checkUtenteIden(int identificativo) {
        boolean bool = false;
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select identificativo from utente WHERE identificativo ="+identificativo+";");

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
    public void setChecked(String email) {
       try (Statement stm = CON.createStatement()){
            stm.execute("UPDATE `utente` SET `checked` ="+1+" WHERE email = '"+email+"';");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Utente getUtenteIden(int identificativo) {
        Utente utente = null;
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select idUtente, nome, Cognome,email, password,Immagini_idImmagini, immagine.Indirizzo as indirizzoI, admin, checked,identificativo from utente, immagine WHERE Immagini_idImmagini = immagine.idImmagini and identificativo = "+identificativo+"");

            rs.next();
            if(rs.getRow() == 1){
                utente = new Utente(rs.getInt("idUtente"),rs.getString("Nome"),rs.getString("Cognome"),rs.getInt("Immagini_idImmagini"),rs.getString("indirizzoI"),rs.getString("email"),rs.getString("password"),rs.getInt("admin"),rs.getInt("checked"),rs.getInt("identificativo"));
            }else{ utente = null;}
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return utente;   
    }

    @Override
    public Utente getUtentePos(String email) throws DAOException {
        if (email == null) {
            throw new DAOException("Email is mandatory field", new NullPointerException("email is null"));
        }
        Utente utente = null;
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select idUtente, nome, Cognome,email, password,Immagini_idImmagini, immagine.Indirizzo as indirizzoI, admin, checked,identificativo, latitude, longitude from utente, immagine WHERE Immagini_idImmagini = immagine.idImmagini and email = '"+email+"'");

            rs.next();
            if(rs.getRow() == 1){
                utente = new Utente(rs.getInt("idUtente"),rs.getString("Nome"),rs.getString("Cognome"),rs.getInt("Immagini_idImmagini"),rs.getString("email"),rs.getString("password"),rs.getInt("admin"),rs.getString("indirizzoI"),rs.getInt("checked"),rs.getInt("identificativo"),rs.getFloat("latitude"),rs.getFloat("longitude"));
            }else{ utente = null;}
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return utente;
    }

    @Override
    public void updateUtentePos(String email, float latitude, float longitude) {
        try (Statement stm = CON.createStatement()){
            stm.execute("UPDATE `utente` SET `latitude`="+latitude+" , `longitude` ="+longitude+" WHERE email = '"+email+"';");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
