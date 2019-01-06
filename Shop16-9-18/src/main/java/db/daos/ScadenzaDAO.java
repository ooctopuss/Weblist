/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos;


import db.entities.Scadenza;
import db.exceptions.DAOException;
import java.util.List;

/**
 *
 * @author octopussy
 */
public interface ScadenzaDAO extends DAO<Scadenza, Integer>{
    public Scadenza getScadenza(int idProdotto, int idListaSpesa)throws DAOException;
    public void updateScadenza(Scadenza scadenza);
    public void deleteScadenza(Scadenza scadenza);
    public void insertScadenza(Scadenza scadenza);
    public List<Scadenza> getAllScadList(int idListaSpesa)throws DAOException;
    public int getContEmail (int idProdotto, int idListaSpesa) throws DAOException;
    public void updateContEmail(Scadenza scadenza);
}
