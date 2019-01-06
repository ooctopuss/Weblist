/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos;

import db.entities.Utente;
import db.exceptions.DAOException;

/**
 *
 * @author octopussy
 */
public interface UtenteDAO extends DAO<Utente, Integer>{
    public Utente getUtente(String email)throws DAOException ;
    public void updateUtente(Utente utente);
    public void updateAmmUtente(int admin, String email);
    public void updatePsw(String password,String email);
    public void deleteUtente(String email);
    public void insertUtente(Utente utente);
    public void updateImm(int immagine, String email);
    public boolean checkUtenteIden(int identificativo);
    public void setChecked(String email);
    public Utente getUtenteIden(int identificativo);
    public Utente getUtentePos(String email)throws DAOException;
    public void updateUtentePos(String email, float latitude, float longitude);
}
