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

        String action = request.getParameter("action");
        
        if (action == null || action.isEmpty()) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/HomePage.jsp");
            dispatcher.forward(request, response);
        } else {
            if (action.equals("prodotti")) {
                //LISTA PRODOTTI
                if (request.getParameter("query") == null) {
                    ArrayList<Prodotto> listaProdotti = ProdottoDAO.doRetriveProdotto();
                    request.setAttribute("listaProdotti", listaProdotti);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/ListaProdotti.jsp");
                    dispatcher.forward(request, response);
                } else {
                    //LISTA PRODOTTI FILTRATA------------------QUI AJAX
                    String query = request.getParameter("query");
                    ArrayList<Prodotto> listaProdotti = ProdottoDAO.doRetrieveBySearch(query);
                    request.setAttribute("listaProdotti", listaProdotti);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/ListaProdotti.jsp");
                    dispatcher.forward(request, response);
                }
            } else if (action.equals("utenti")) {
                //LISTA UTENTI
                if (request.getParameter("ID") == null) {
                    ArrayList<Utente> listaUtenti = UtenteDAO.doRetriveUtente();
                    request.setAttribute("listaUtenti", listaUtenti);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/ListaUtenti.jsp");
                    dispatcher.forward(request, response);
                } else {
                    //AJAX
                    int ID = Integer.parseInt(request.getParameter("ID"));
                    boolean status = Boolean.parseBoolean(request.getParameter("status"));
                    UtenteDAO.setNewStatus(ID, status);
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
