package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Prodotto;
import model.Utente;
import model.UtenteDAO;
import model.ProdottoDAO;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/admin")
public class ListaAdminServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("action") == null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/HomePage.jsp");
            dispatcher.forward(request, response);
        } else {
            if (request.getParameter("action").equals("prodotti")) {
                ArrayList<Prodotto> listaProdotti = ProdottoDAO.doRetriveProdotto();
                request.setAttribute("listaProdotti", listaProdotti);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/ListaProdotti.jsp");
                dispatcher.forward(request, response);

            } else if (request.getParameter("action").equals("utenti")) {
                ArrayList<Utente> listaUtenti = UtenteDAO.doRetriveUtente();
                request.setAttribute("listaUtenti", listaUtenti);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/ListaUtenti.jsp");
                dispatcher.forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
