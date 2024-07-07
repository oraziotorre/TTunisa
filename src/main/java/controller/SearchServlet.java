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
import java.util.ArrayList;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if(request.getParameter("category")!=null){
            //RICERCA PER CATEGORIA
            String category = request.getParameter("category");
            ArrayList<Prodotto> prodotti = ProdottoDAO.doRetrieveByCategory(category);
            request.setAttribute("query", category);
            request.setAttribute("listaProdotti", prodotti);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Ricerca_Prodotti.jsp");
            dispatcher.forward(request, response);

        }else {
            if (request.getParameter("query") != null) {
                //RICERCA PER QUERY
                String query = request.getParameter("query");
                if (query.equals("offerte")) {

                    //RESTITUISCE I PRODOTTI SCONTATI
                    ArrayList<Prodotto> prodotti = ProdottoDAO.doRetriveProdottoScontato();
                    request.setAttribute("query", "Offerte");
                    request.setAttribute("listaProdotti", prodotti);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Ricerca_Prodotti.jsp");
                    dispatcher.forward(request, response);
                } else {
                    //QUERY STANDARD
                    ArrayList<Prodotto> prodotti = ProdottoDAO.doRetrieveBySearch(query);
                    request.setAttribute("query", query);
                    request.setAttribute("listaProdotti", prodotti);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Ricerca_Prodotti.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                //RESTITUISCE TUTTI I PRODOTTI
                ArrayList<Prodotto> prodotti = ProdottoDAO.doRetriveProdotto();
                request.setAttribute("query", "Tutti i prodotti");
                request.setAttribute("listaProdotti", prodotti);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Ricerca_Prodotti.jsp");
                dispatcher.forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
