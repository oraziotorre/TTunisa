package controller;

import model.Utente;
import model.UtenteDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        if (action == null) {
            String email = request.getParameter("Email");
            String password = request.getParameter("Password");
            Utente u = UtenteDAO.doLogin(email, password);

            if (u == null) {
                request.setAttribute("errore", true);
                RequestDispatcher rs = request.getRequestDispatcher("/WEB-INF/results/Login.jsp");
                rs.forward(request, response);
            } else {
                session.setAttribute("Utente", u);
                if (u.isAmministratore()) {
                    session.setAttribute("isAdmin", true);
                }
                response.sendRedirect(request.getContextPath());
            }
        } else if (action.equals("logout")) {
            session.invalidate();
            response.sendRedirect(request.getContextPath());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}

