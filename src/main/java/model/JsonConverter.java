package model;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.List;

public class JsonConverter {

    private static final Gson gson = new Gson();

    public static List<Prodotto> scontrinoToProdotti(String json) {
        Type productListType = new TypeToken<List<Prodotto>>() {
        }.getType();
        return gson.fromJson(json, productListType);
    }


    public static String prodottiToScontrino(List<Prodotto> prodotti) {
        return gson.toJson(prodotti);
    }


}
