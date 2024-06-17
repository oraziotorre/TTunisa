package controller;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Utente;
import model.UtenteDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import model.ConPool;
import model.HeadersBean;

@WebServlet(name = "TestMVC", urlPatterns = {"/testMVC", "/test"})
public class ServletRequestHeaders extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        ////////////////////////////////////////////////////
        ArrayList<Utente> riepilogoUtente= UtenteDAO.doRetriveUtente();
        request.setAttribute("riepilogoUtente",riepilogoUtente);
        RequestDispatcher ds=request.getRequestDispatcher("/WEB-INF/results/VisualizzaUtenti.jsp");
        ds.forward(request,response);

        /*// 1. Estrai tutti i nomi degli header dalla richiesta
        List<String> headerNames = Collections.list(request.getHeaderNames());

        // 2. Estrai i valori degli header dalla richiesta
        List<String> headerValues = new ArrayList<>();
        for (String headerName : headerNames) {
            headerValues.add(request.getHeader(headerName));
        }



        // 3. Crea l'istanza di HeadersBean e impostane le liste
        HeadersBean headersBean = new HeadersBean();
        headersBean.setHeaderNames(headerNames);

        // 4. Inserisci il bean HeadersBean nella request come attributo
        request.setAttribute("headers", headersBean);

        // 5. Invia il controllo alla JSP /WEB-INF/results/showHeaders.jsp tramite dispatcher
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/showHeaders.jsp");
        dispatcher.forward(request, response);*/
    }



}