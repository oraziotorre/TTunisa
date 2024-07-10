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
        HttpSession session = request.getSession();
        Utente u = UtenteDAO.doLogin(request.getParameter("Email"), request.getParameter("Password"));

        boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));

        if (request.getParameter("action") == null) {
            if (u == null) {
                if (isAjax) {
                    response.setContentType("application/json");
                    PrintWriter out = response.getWriter();
                    JSONObject json = new JSONObject();
                    json.put("success", false);
                    out.print(json.toString());
                    out.flush();
                } else {
                    RequestDispatcher rs = request.getRequestDispatcher("/WEB-INF/results/Login.jsp");
                    rs.include(request, response);
                }
            } else {
                session.setAttribute("Utente", u);
                String redirectUrl = request.getContextPath();
                if (u.isAmministratore()) {
                    session.setAttribute("isAdmin", true);
                }

                if (isAjax) {
                    response.setContentType("application/json");
                    PrintWriter out = response.getWriter();
                    JSONObject json = new JSONObject();
                    json.put("success", true);
                    json.put("redirect", redirectUrl);
                    out.print(json.toString());
                    out.flush();
                } else {
                    response.sendRedirect(redirectUrl);
                }
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
