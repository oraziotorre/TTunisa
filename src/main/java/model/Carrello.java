package model;

import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;

public class Carrello {


    private final List<Prodotto> prodottiCarrello = new ArrayList<>();
    private double prezzoTotale;

    public List<Prodotto> getProdotti() {
        return prodottiCarrello;
    }

    public void updatePrezzoTotale() {
        this.prezzoTotale = 0;
        for (Prodotto prodotto : prodottiCarrello) {
            if (prodotto.getSconto() == 0)
                this.prezzoTotale += prodotto.getPrezzo() * prodotto.getQuantita();
            else {
                double prezzoScontato = prodotto.getPrezzo() - (prodotto.getPrezzo() / 100 * prodotto.getSconto());
                this.prezzoTotale += prezzoScontato * prodotto.getQuantita();
            }
        }

    }

    public double getPrezzoTotale() {
        return prezzoTotale;
    }

    public void setPrezzoTotale(double prezzoTotale) {
        this.prezzoTotale = prezzoTotale;
    }

    public void addProdotto(Prodotto prodottoNuovo) {
        for (Prodotto prodotto : prodottiCarrello) {
            if (prodotto.getID() == prodottoNuovo.getID()) {
                prodotto.setQuantita(prodotto.getQuantita() + prodottoNuovo.getQuantita());
                updatePrezzoTotale();
                return;
            }
        }
        prodottiCarrello.add(prodottoNuovo);
        updatePrezzoTotale();
    }

    public void removeProdotto(int ID) {
        prodottiCarrello.removeIf(prodotto -> prodotto.getID() == ID);
        updatePrezzoTotale();
    }

    public void setNumOrdered(int ID, int n) {
        for (Prodotto prodotto : prodottiCarrello) {
            if (prodotto.getID() == ID) {
                prodotto.setQuantita(n);
                updatePrezzoTotale();
                return;
            }
        }
    }

    public int getSizeCarrello() {
        int count = 0;

        for (Prodotto p : prodottiCarrello) {
            count += p.getQuantita();
        }
        return count;
    }


    public boolean checkout(Utente utenteLoggato) {
        for (Prodotto prodotto : this.prodottiCarrello) {
            int quantitaDisponibile = ProdottoDAO.getQuantitaDisponibile(prodotto);
            if (prodotto.getQuantita() < quantitaDisponibile) {
                int nuovaQuantita = quantitaDisponibile - prodotto.getQuantita();
                ProdottoDAO.updateQuantitaDisponibile(prodotto, nuovaQuantita);
            } else {
                return false;
                //GESTIRE CASO ERRORE
            }
        }
        Ordine ordine = new Ordine();
        String scontrino = OrdineDAO.prodottiToScontrino(this.getProdotti());
        ordine.setScontrino(scontrino);
        ordine.setUtente_ID(utenteLoggato.getID());

        double prezzoTotCarrello = this.getPrezzoTotale();
        double prezzoTot = prezzoTotCarrello + (prezzoTotCarrello * 0.22);   //aggiungo l'IVA al prezzo totale del carrello
        utenteLoggato.setSaldo(utenteLoggato.getSaldo() - prezzoTot);
        UtenteDAO.updateSaldo(utenteLoggato, utenteLoggato.getSaldo());
        ordine.setPrezzo_tot(prezzoTot);
        ordine.setData(new GregorianCalendar());

        this.updateStatisticheProdotti();
        OrdineDAO.addOrdine(ordine);
        return true;
    }

    public void updateStatisticheProdotti() {

        for (Prodotto p : prodottiCarrello) {
            ProdottoDAO.updateAcquisti(p.getID());
        }

    }


}
