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
@WebServlet("/registrazione-check")
public class Registrazione_CheckServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
        String nome = request.getParameter("Nome");
        String cognome = request.getParameter("Cognome");

        JSONObject jsonResponse = new JSONObject();

        if (nome == null || nome.isEmpty() ||
                cognome == null || cognome.isEmpty() ||
                email == null || email.isEmpty() ||
                password == null || password.isEmpty()) {

            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Formato sbagliato");
        }

         else{
            Utente u = new Utente();
            u.setNome(nome);
            u.setCognome(cognome);
            u.setSaldo(1000.00); // Imposta un saldo iniziale
            u.setEmail(email);
            u.setPassword(password);
            u.setAmministratore(false);

            if (!UtenteDAO.isNewEmail(u.getEmail())) {
                jsonResponse.put("status","error");
                jsonResponse.put("message","Account già esistente");
            } else {
                UtenteDAO.doRegistration(u);
                jsonResponse.put("status","success");
                response.sendRedirect(request.getContextPath() + "/login");
            }
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}