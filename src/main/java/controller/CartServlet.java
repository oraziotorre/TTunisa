package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Carrello;
import model.Prodotto;
import model.ProdottoDAO;

import java.io.IOException;

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


            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/HomePage.jsp");
            dispatcher.forward(request, response);


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
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Carrello.jsp");
            dispatcher.forward(request, response);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}