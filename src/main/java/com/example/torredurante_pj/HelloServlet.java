package com.example.torredurante_pj;

import java.lang.*;
import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "dopo", value = "/dopo")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "<img src=\"https://static0.gamerantimages.com/wordpress/wp-content/uploads/2024/04/logan-wmn135-ishowspeed-1.jpg\" alt=\"Ishowspeed\" >";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        String prova = request.getParameter("prova");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1> "+prova+"</h1>");
        out.println(message);
        out.println("</body></html>");
    }

    public void destroy() {
    }
}