package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Utente;
import model.UtenteDAO;
import model.Utilities;

import java.io.IOException;

@WebServlet("/update-profilo")
public class UpdateProfilo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Utente u = new Utente();
        int id = Integer.parseInt(request.getParameter("id"));
        u.setID(id);
        u.setNome(request.getParameter("firstName"));
        u.setCognome(request.getParameter("lastName"));
        u.setEmail(request.getParameter("email"));
        u.setPassword(request.getParameter("password"));
        u.setAmministratore(Boolean.parseBoolean(request.getParameter("amministratore")));
        u.setSaldo(Double.valueOf(request.getParameter("saldo")));
        UtenteDAO.updateUser(u,id);

        HttpSession session = request.getSession();
        session.setAttribute("Utente", u);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/HomePage.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

