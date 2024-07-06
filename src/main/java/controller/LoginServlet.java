package controller;

import model.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Utente u = UtenteDAO.doLogin(request.getParameter("Email"), request.getParameter("Password"));
        if (request.getParameter("action") == null) {
            if (u == null) {
                RequestDispatcher rs = request.getRequestDispatcher("/WEB-INF/results/Login.jsp");
                rs.include(request, response);
            } else if (!u.isAmministratore()) {
                session.setAttribute("Utente", u); // Salva l'oggetto Utente nella sessione
                request.getSession();
                response.sendRedirect(request.getContextPath());
            } else if (u.isAmministratore()) {
                session.setAttribute("Utente", u); // Salva l'oggetto Utente amministratore nella sessione
                session.setAttribute("admin", true);
                response.sendRedirect(request.getContextPath());
            }
        } else if (request.getParameter("action").equals("logout")) {
            session.invalidate();
            response.sendRedirect(request.getContextPath());
        }
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}