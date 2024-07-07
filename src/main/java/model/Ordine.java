package model;

import netscape.javascript.JSObject;

import java.util.GregorianCalendar;

public class Ordine {

    private int ordine_ID, utente_ID;
    private String cap, indirizzo;
    private double prezzo_tot;
    private GregorianCalendar data;
    JSObject scontrino;

    public int getOrdine_ID() {
        return ordine_ID;
    }

    public void setOrdine_ID(int ordine_ID) {
        this.ordine_ID = ordine_ID;
    }

    public int getUtente_ID() {
        return utente_ID;
    }

    public void setUtente_ID(int utente_ID) {
        this.utente_ID = utente_ID;
    }

    public String getCap() {
        return cap;
    }

    public void setCap(String cap) {
        this.cap = cap;
    }

    public String getIndirizzo() {
        return indirizzo;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
    }

    public double getPrezzo_tot() {
        return prezzo_tot;
    }

    public void setPrezzo_tot(double prezzo_tot) {
        this.prezzo_tot = prezzo_tot;
    }

    public GregorianCalendar getData() {
        return data;
    }

    public void setData(GregorianCalendar data) {
        this.data = data;
    }

    public JSObject getScontrino() {
        return scontrino;
    }

    public void setScontrino(JSObject scontrino) {
        this.scontrino = scontrino;
    }
}
