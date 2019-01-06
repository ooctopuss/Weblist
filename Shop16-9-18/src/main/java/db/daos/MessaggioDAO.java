/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos;

import db.entities.Messaggio;
import db.exceptions.DAOException;
import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author Safouane
 */
public interface MessaggioDAO extends DAO<Messaggio, Integer>{
    public Messaggio getMessaggioUtenteId(int idUtente)throws DAOException;
    public void updateMessaggio(Messaggio messaggio);
    public void deleteMessaggio(int id);
    public void insertMessaggio(Messaggio messaggio);
    public List<Messaggio> getAllMessaggioLista(int idLista)throws DAOException;
    public List<Messaggio> getMessaggioNuovo(int idLista, Timestamp ora) throws DAOException;
}
