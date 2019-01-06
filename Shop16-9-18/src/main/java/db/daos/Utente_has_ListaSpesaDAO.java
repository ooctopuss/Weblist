/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos;

import db.entities.Utente_has_ListaSpesa;
import db.exceptions.DAOException;
import java.util.List;

/**
 *
 * @author octopussy
 */
public interface Utente_has_ListaSpesaDAO extends DAO <Utente_has_ListaSpesa, Integer>{
    public Utente_has_ListaSpesa getUtente_has_ListaSpesa(int idUtente, int idLista)throws DAOException ;
    public void updateProprietario(int idUtente, int idListaSpesa, int proprietario);
    public void updateModCat(int idUtente, int idListaSpesa, int modCat);
    public void updateAggProd(int idUtente, int idListaSpesa, int aggProd);
    public void updateElProd(int idUtente, int idListaSpesa, int elProd);
    public void updateElLista(int idUtente, int idListaSpesa, int elLista);
    public void deleteUtente_has_ListaSpesa(int idUtente, int idListaSpesa);
    public void insertUtente_has_ListaSpesa(Utente_has_ListaSpesa utL);
    public void update(Utente_has_ListaSpesa lista);
    
    public List<Utente_has_ListaSpesa> getAllListUtente(int idUtente)throws DAOException;

    

    
}
