/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.entities;

import java.io.Serializable;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.codec.binary.Base64;

/**
 *
 * @author octopussy
 */
public class Utente implements Serializable{
    private int id;
    private String nome;
    private String cognome;
    private int avatar;
    private String email;
    private String password;
    private int admin;
    private String indirizzoI;
    private int checked;
    private int identificativo;
    private float latitude;
    private float longitude;

    public Utente(int id, String nome, String cognome, int avatar, String email, String password, int admin, String indirizzoI, int checked, int identificativo, float latitude, float longitude) {
        this.id = id;
        this.nome = nome;
        this.cognome = cognome;
        this.avatar = avatar;
        this.email = email;
        this.password = password;
        this.admin = admin;
        this.indirizzoI = indirizzoI;
        this.checked = checked;
        this.identificativo = identificativo;
        this.latitude = latitude;
        this.longitude = longitude;
    }
    
    

    public String getIndirizzoI() {
        return indirizzoI;
    }

    public void setIndirizzoI(String indirizzoI) {
        this.indirizzoI = indirizzoI;
    }

    public Utente(int id, String nome, String cognome, int avatar, String indirizzoI, String email, String password, int admin, int checked, int identificativo) {
        this.id = id;
        this.nome = nome;
        this.cognome = cognome;
        this.avatar = avatar;
        this.email = email;
        this.password = password;
        this.admin = admin;
        this.indirizzoI = indirizzoI;
        this.checked = checked;
        this.identificativo = identificativo;
    }
    

    public Utente (){}
    public Utente(int id ,String nome, String cognome, int avatar, String email, String password,int admin) {
        this.id = id;
        this.nome = nome;
        this.cognome = cognome;
        this.avatar = avatar;
        this.email = email;
        this.password = password;
        this.admin = admin;
    }
    public Utente(int id ,String nome, String cognome, int avatar,String indirizzoI, String email, String password,int admin) {
        this.id = id;
        this.nome = nome;
        this.cognome = cognome;
        this.avatar = avatar;
        this.indirizzoI = indirizzoI;
        this.email = email;
        this.password = password;
        this.admin = admin;
    }
    public Utente(String nome, String cognome, String email, String password, int admin) {
        this.nome = nome;
        this.cognome = cognome;
        this.email = email;
        this.password = password;
        this.admin = admin;
        
    }
    public Utente(String email, String password, int admin) {
        this.email = email;
        this.password = password;
        this.admin = admin;
    }
    public int getId(){
        return id;
    }
    public void setId(int id){
        this.id = id;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public int getAvatar() {
        return avatar;
    }

    public void setAvatar(int avatar) {
        this.avatar = avatar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    @Override
    public String toString(){
         return ("Nome: "+nome+"\n"+"Cognome: "+cognome+"\n"+"email: "+email+"\n"+"password: "+password+"\n"+"admin: "+admin);
    }
    //Controlla se l'indirizzo mail inserito è corretto oppure no. True se indirizzo corretto
    public boolean mailSyntaxCheck(String email)
    {
        // Create the Pattern using the regex
        Pattern p = Pattern.compile(".+@.+\\.[a-z]+");
 
        // Match the given string with the pattern
        Matcher m = p.matcher(email);
 
        // check whether match is found
        boolean matchFound = m.matches();
 
        StringTokenizer st = new StringTokenizer(email, ".");
        String lastToken = null;
        while (st.hasMoreTokens()) {
            lastToken = st.nextToken();
        }
 
    // validate the country code
        if (matchFound && lastToken.length() >= 2
                && email.length() - 1 != lastToken.length()) {
 
            return true;
        } else {
            return false;
        }
 
    }
    
    public String getPasswordEncrypt(String password){
        Base64 base64 = new Base64();
        return new String(base64.encode(password.getBytes()));
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    public int getChecked() {
        return checked;
    }

    public void setChecked(int checked) {
        this.checked = checked;
    }

    public int getIdentificativo() {
        return identificativo;
    }

    public void setIdentificativo(int identificativo) {
        this.identificativo = identificativo;
    }

    public float getLatitude() {
        return latitude;
    }

    public void setLatitude(float latitude) {
        this.latitude = latitude;
    }

    public float getLongitude() {
        return longitude;
    }

    public void setLongitude(float longitude) {
        this.longitude = longitude;
    }
    
}
