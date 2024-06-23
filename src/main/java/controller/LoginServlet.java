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
        String parametri;
        HttpSession session = request.getSession();
        Utente u = UtenteDAO.doLogin(request.getParameter("Email"), request.getParameter("Password"));
        if (request.getParameter("action") == null) {
            if (u == null) {
                parametri = "Email o password errati!";
                request.setAttribute("parametri", parametri);
                RequestDispatcher rs = request.getRequestDispatcher("/WEB-INF/results/Login.jsp");
                rs.include(request, response);
            } else if (request.getParameter("action").equals("registration")) {
                session.invalidate();
                RequestDispatcher dispatcher = request.getRequestDispatcher("Registration");
                dispatcher.forward(request, response);
            } else if (request.getParameter("action").equals("logout")) {
                session.invalidate();
                RequestDispatcher dispatcher = request.getRequestDispatcher("Login");
                dispatcher.forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}