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

import java.io.IOException;

@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Utente u = new Utente();
        u.setNome(request.getParameter("Nome"));
        u.setCognome(request.getParameter("Cognome"));
        u.setSaldo(1000.0);
        u.setEmail(request.getParameter("Email"));
        u.setPassword(request.getParameter("Password"));
        u.setAmministratore(false);
        if (request.getParameter("Nome") == null ||
                request.getParameter("Cognome") == null ||
                request.getParameter("Email") == null ||
                request.getParameter("Password") == null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Registration.jsp");
            dispatcher.forward(request, response);
        }
        if (!UtenteDAO.isNewEmail(u.getEmail())) {
            request.setAttribute("controllo", "Email già presente");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Registration.jsp");
            dispatcher.forward(request, response);
        } else {
            UtenteDAO.doRegistration(u);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Login.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }


}
