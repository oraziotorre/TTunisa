package model;

import java.util.ArrayList;
import java.util.List;

public class Carrello {


    private final List<Prodotto> prodottiCarrello = new ArrayList<>();

    public List<Prodotto> getProdotti() {
        return prodottiCarrello;
    }

    public void addProdotto(Prodotto prodottoNuovo) {
        for (Prodotto prodotto : prodottiCarrello) {
            if (prodotto.getID() == prodottoNuovo.getID()) {
                prodotto.setQuantita(prodotto.getQuantita() + prodottoNuovo.getQuantita());
                return;
            }
        }
        prodottiCarrello.add(prodottoNuovo);
    }

    public void removeProdotto(int ID) {
        for (Prodotto prodotto : prodottiCarrello) {
            if (prodotto.getID() == ID) {
                setNumOrdered(ID, 0);
                return;
            }
        }

    }

    public void setNumOrdered(int ID, int n) {
        for (Prodotto prodotto : prodottiCarrello) {
            if (prodotto.getID() == ID) {
                prodotto.setQuantita(n);
                return;
            }
        }
    }


}
