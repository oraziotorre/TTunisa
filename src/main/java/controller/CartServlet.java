package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.*;

import java.io.IOException;
import java.util.GregorianCalendar;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        Carrello cart = (Carrello) request.getSession().getAttribute("carrello");

        if (action == null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Carrello.jsp");
            dispatcher.forward(request, response);
        }
        if (action.equals("checkout")) {

            HttpSession session = request.getSession();
            Utente utenteLoggato = (Utente) session.getAttribute("Utente");
            if (cart.checkout(utenteLoggato)) {
                session.setAttribute("carrello", new Carrello());
                response.sendRedirect("order_history");
            } else {
                ////ERRORE QUANTITA NON DISPONIBILE
                response.sendRedirect("cart");
            }
        }

        if (action.equals("additem")) {
            //Dall'ID del prodotto prendo il prodotto e lo aggiungo al carrello
            int ID = Integer.parseInt(request.getParameter("ID"));
            Prodotto prodotto = ProdottoDAO.findProduct(ID);
            prodotto.setQuantita(Integer.parseInt(request.getParameter("quantita")));
            cart.addProdotto(prodotto);
            response.sendRedirect(request.getContextPath() + "/cart");
        }

        if (action.equals("removeitem")) {
            int ID = Integer.parseInt(request.getParameter("ID"));
            cart.removeProdotto(ID);
            response.sendRedirect(request.getContextPath() + "/cart");
        }

        if (action.equals("updateitem")) {

            //GESTISCE LA RICHIESTA AJAX DA CARRELLO.jsp
            int ID = Integer.parseInt(request.getParameter("ID"));
            int quantita = Integer.parseInt(request.getParameter("quantita"));
            cart.setNumOrdered(ID, quantita);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}