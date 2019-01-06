/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos.jdbc;

import db.daos.Utente_has_ListaSpesaDAO;
import db.entities.Utente_has_ListaSpesa;
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
public class JDBCUtente_has_ListaSpesaDAO extends JDBCDAO<Utente_has_ListaSpesa, Integer> implements Utente_has_ListaSpesaDAO{

    public JDBCUtente_has_ListaSpesaDAO(Connection con) {
        super(con);
    }

    @Override
    public Long getCount() throws DAOException {
        try (Statement stmt = CON.createStatement()) {
            ResultSet counter = stmt.executeQuery("SELECT COUNT(*) FROM utente_has_listaspesa");
            if (counter.next()) {
                return counter.getLong(1);
            }

        } catch (SQLException ex) {
            throw new DAOException("Impossible to count users", ex);
        }

        return 0L;
    }

    @Override
    public Utente_has_ListaSpesa getByPrimaryKey(Integer primaryKey) throws DAOException {
        if (primaryKey == null) {
            throw new DAOException("primaryKey is null");
        }
        Utente_has_ListaSpesa ut = null;
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select * from utente_has_listaspesa where Utente_idUtente = "+primaryKey+";");
           
            rs.next();
            if(rs.getRow() >= 1){
               ut =  new Utente_has_ListaSpesa(rs.getInt("Utente_idUtente"),rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("proprietario"),rs.getInt("modCat"),rs.getInt("aggProd"),rs.getInt("elProd"),rs.getInt("elLista"));
            }else{
                ut = null;
            }
            
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get the user for the passed primary key", ex);
        }
        return ut;
    }

    @Override
    public List<Utente_has_ListaSpesa> getAll() throws DAOException {
        List<Utente_has_ListaSpesa> utentiL = new ArrayList<>();
        try (Statement stm = CON.createStatement()){
            
            ResultSet rs = stm.executeQuery("select * from utente_has_listaspesa");
            while(rs.next()){
                utentiL.add(new Utente_has_ListaSpesa(rs.getInt("Utente_idUtente"),rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("proprietario"),rs.getInt("modCat"),rs.getInt("aggProd"),rs.getInt("elProd"),rs.getInt("elLista")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return utentiL;
    }

    @Override
    public Utente_has_ListaSpesa getUtente_has_ListaSpesa(int idUtente, int idLista) throws DAOException {
        Utente_has_ListaSpesa utL = null;
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select * from utente_has_listaspesa where Utente_idUtente = "+idUtente+" and ListaSpesa_idListaSpesa ="+idLista+";");
            
            rs.next();
            if(rs.getRow() == 1){
                utL =  new Utente_has_ListaSpesa(rs.getInt("Utente_idUtente"),rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("proprietario"),rs.getInt("modCat"),rs.getInt("aggProd"),rs.getInt("elProd"),rs.getInt("elLista"));
            }else{
                utL = null;
            }
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get the user for the passed primary key", ex);
        }
        return utL;
    }

    @Override
    public void updateProprietario(int idUtente, int idListaSpesa, int proprietario) {
        try (Statement stm = CON.createStatement()){
            stm.execute("UPDATE `utente_has_listaspesa` SET `proprietario`="+proprietario+" WHERE Utente_idUtente = "+idUtente+" and ListaSpesa_idListaSpesa ="+idListaSpesa+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void updateModCat(int idUtente, int idListaSpesa, int modCat) {
        try (Statement stm = CON.createStatement()){
            stm.execute("UPDATE `utente_has_listaspesa` SET `modCat`="+modCat+" WHERE Utente_idUtente = "+idUtente+" and ListaSpesa_idListaSpesa ="+idListaSpesa+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void updateAggProd(int idUtente, int idListaSpesa, int aggProd) {
        try (Statement stm = CON.createStatement()){
            stm.execute("UPDATE `utente_has_listaspesa` SET `aggProd`="+aggProd+" WHERE Utente_idUtente = "+idUtente+" and ListaSpesa_idListaSpesa ="+idListaSpesa+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void updateElProd(int idUtente, int idListaSpesa, int elProd) {
        try (Statement stm = CON.createStatement()){
            stm.execute("UPDATE `utente_has_listaspesa` SET `elProd`="+elProd+" WHERE Utente_idUtente = "+idUtente+" and ListaSpesa_idListaSpesa ="+idListaSpesa+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void updateElLista(int idUtente, int idListaSpesa, int elLista) {
        try (Statement stm = CON.createStatement()){
            stm.execute("UPDATE `utente_has_listaspesa` SET `elLista`="+elLista+" WHERE Utente_idUtente = "+idUtente+" and ListaSpesa_idListaSpesa ="+idListaSpesa+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deleteUtente_has_ListaSpesa(int idUtente, int idListaSpesa) {
        try (Statement stm = CON.createStatement()){
           stm.execute("DELETE FROM `utente_has_listaspesa` WHERE Utente_idUtente ="+idUtente+" and ListaSpesa_idListaSpesa ="+idListaSpesa+";");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insertUtente_has_ListaSpesa(Utente_has_ListaSpesa utL) {
        try (Statement stm = CON.createStatement()){
            stm.execute("INSERT INTO `utente_has_listaspesa`(`Utente_idUtente`,`ListaSpesa_idListaSpesa`,`proprietario`,`modCat`,`aggProd`,`elProd`,`elLista`) VALUES ("+utL.getIdUtente()+","+utL.getIdListaSpesa()+","+utL.getProprietario()+","+utL.getModCat()+","+utL.getAggProd()+","+utL.getElProd()+","+utL.getElLista()+");");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCLogoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Utente_has_ListaSpesa lista) {
        try (Statement stm = CON.createStatement()){
            stm.execute(" UPDATE `utente_has_listaspesa` SET `Utente_idUtente`="+lista.getIdUtente()+",`ListaSpesa_idListaSpesa`="+lista.getIdListaSpesa()+",`proprietario`="+lista.getProprietario()+",`modCat`="+lista.getModCat()+",`aggProd`="+lista.getAggProd()+",`elProd`="+lista.getElProd()+",`elLista`="+lista.getElLista()+" WHERE Utente_idUtente = "+lista.getIdUtente()+" and ListaSpesa_idListaSpesa = "+lista.getIdListaSpesa()+" ;");
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Utente_has_ListaSpesa> getAllListUtente(int idUtente) throws DAOException{
        List<Utente_has_ListaSpesa> utenti =  new ArrayList<>();
        
        try (Statement stm = CON.createStatement()){
            ResultSet rs = stm.executeQuery("select * from utente_has_listaspesa where Utente_idUtente = "+idUtente+";");
            
            while(rs.next()){
                utenti.add(new Utente_has_ListaSpesa(rs.getInt("Utente_idUtente"),rs.getInt("ListaSpesa_idListaSpesa"),rs.getInt("proprietario"),rs.getInt("modCat"),rs.getInt("aggProd"),rs.getInt("elProd"),rs.getInt("elLista")));
            }
        } catch (SQLException ex) {
            throw new DAOException("Impossible to get the user for the passed primary key", ex);
        }
        return utenti;
    }
    
}
