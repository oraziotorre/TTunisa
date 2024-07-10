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
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/registrazione")
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("Nome");
        String cognome = request.getParameter("Cognome");
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");

        // Verifica se la richiesta è un'operazione AJAX
        boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));

        // Verifica se i parametri richiesti sono nulli o vuoti
        if (nome == null || nome.isEmpty() ||
                cognome == null || cognome.isEmpty() ||
                email == null || email.isEmpty() ||
                password == null || password.isEmpty()) {

            if (isAjax) {
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                JSONObject json = new JSONObject();
                json.put("success", false);
                json.put("message", "Tutti i campi sono obbligatori");
                out.print(json.toString());
                out.flush();
            } else {
                request.setAttribute("error", "Tutti i campi sono obbligatori");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Registration.jsp");
                dispatcher.forward(request, response);
            }
            return;
        }

        // Crea un nuovo oggetto Utente
        Utente u = new Utente();
        u.setNome(nome);
        u.setCognome(cognome);
        u.setSaldo(1000.00); // Imposta un saldo iniziale
        u.setEmail(email);
        u.setPassword(password);
        u.setAmministratore(false); // Suppongo che l'utente non sia un amministratore

        // Verifica se l'email è già presente nel database
        if (!UtenteDAO.isNewEmail(u.getEmail())) {
            if (isAjax) {
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                JSONObject json = new JSONObject();
                json.put("success", false);
                json.put("message", "Email già presente");
                out.print(json.toString());
                out.flush();
            } else {
                request.setAttribute("error", "Email già presente");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Registration.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            UtenteDAO.doRegistration(u);
            if (isAjax) {
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                JSONObject json = new JSONObject();
                json.put("success", true);
                json.put("redirect", request.getContextPath() + "/login");
                out.print(json.toString());
                out.flush();
            } else {
                response.sendRedirect(request.getContextPath() + "/login");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
