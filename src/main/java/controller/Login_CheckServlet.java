package controller;

import model.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/login-check")
public class Login_CheckServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
        Utente u = UtenteDAO.doLogin(email, password);
        JSONObject jsonResponse = new JSONObject();

        if (u == null) {
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Email o password errati!");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("Utente", u);

            if (u.isAmministratore()) {
                session.setAttribute("isAdmin", true);
            }

            jsonResponse.put("status", "success");
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
