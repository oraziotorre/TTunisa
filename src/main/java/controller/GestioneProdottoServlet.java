package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Prodotto;
import model.ProdottoDAO;

import java.io.IOException;
import java.security.ProtectionDomain;

@WebServlet("/admin/product-managment")
public class GestioneProdottoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("Nome");
        String descrizione = request.getParameter("Descrizione");
        String quantitaStr = request.getParameter("Quantita");
        String prezzoStr = request.getParameter("Prezzo");
        String scontoStr = request.getParameter("Sconto");
        String img = request.getParameter("Img");

        // Verifica se tutti i parametri necessari sono presenti e non sono vuoti
        if (nome == null || nome.isEmpty() ||
                descrizione == null || descrizione.isEmpty() ||
                quantitaStr == null || quantitaStr.isEmpty() ||
                prezzoStr == null || prezzoStr.isEmpty() ||
                scontoStr == null || scontoStr.isEmpty() ||
                img == null || img.isEmpty()) {

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/CreaModificaProdotto.jsp");
            dispatcher.forward(request, response);
        } else {

            // Conversione dei parametri
            int quantita = Integer.parseInt(quantitaStr);
            double prezzo = Double.parseDouble(prezzoStr);
            int sconto = Integer.parseInt(scontoStr);

            // Creazione dell'oggetto Prodotto e salvataggio nel database
            Prodotto p = new Prodotto();
            p.setNome(nome);
            p.setPrezzo(prezzo);
            p.setQuantita(quantita);
            p.setDescrizione(descrizione);
            p.setSconto(sconto);
            p.setImg(img);

            // Utilizzo del DAO per aggiungere il prodotto
            ProdottoDAO.addProdotto(p);

            // Redirect alla pagina dei prodotti dopo l'aggiunta
            response.sendRedirect(request.getContextPath() + "/admin?action=prodotti");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
