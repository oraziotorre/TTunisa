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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the session and user login details
        HttpSession session = request.getSession();
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
        Utente user = UtenteDAO.doLogin(email, password);

        // Check if the request is an Ajax request
        boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));

        // Check if the action parameter is present and handle login or logout accordingly
        String action = request.getParameter("action");

        if (action == null) {
            // Handle login
            if (user == null) {
                // User authentication failed
                if (isAjax) {
                    // Send JSON response for Ajax request
                    response.setContentType("application/json");
                    PrintWriter out = response.getWriter();
                    JSONObject json = new JSONObject();
                    json.put("success", false);
                    out.print(json.toString());
                    out.flush();
                } else {
                    // Forward to login page for standard request
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Login.jsp");
                    dispatcher.include(request, response);
                }
            } else {
                // User authentication succeeded
                session.setAttribute("Utente", user);
                String redirectUrl = request.getContextPath();

                // Check if the user is an admin
                if (user.isAmministratore()) {
                    session.setAttribute("isAdmin", true);
                }

                if (isAjax) {
                    // Send JSON response for Ajax request
                    response.setContentType("application/json");
                    PrintWriter out = response.getWriter();
                    JSONObject json = new JSONObject();
                    json.put("success", true);
                    json.put("redirect", redirectUrl);
                    out.print(json.toString());
                    out.flush();
                } else {
                    // Redirect to home page for standard request
                    response.sendRedirect(redirectUrl);
                }
            }
        } else if ("logout".equals(action)) {
            // Handle logout
            session.invalidate();
            response.sendRedirect(request.getContextPath());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
