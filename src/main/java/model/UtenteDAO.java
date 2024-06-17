package model;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "UtenteDAO", value = "/UtenteDAO")
public class UtenteDAO extends HttpServlet {

    public static ArrayList<Utente> doRetriveUtente() {
        ArrayList<Utente> u =new ArrayList<Utente>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Utente");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Utente utente = new Utente();
                utente.setEmail(rs.getString(5));
                utente.setPassword(rs.getString(6));
                utente.setNome(rs.getString(2));
                utente.setCognome(rs.getString(3));
                utente.setAmministratore(rs.getBoolean(7));
                u.add(utente);
            }
            return u;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static Utente doLogin(String email, String password) {
        Utente utente = new Utente();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Utente WHERE email = ? AND password = SHA1(?)");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                utente.setEmail(rs.getString(1));
                utente.setPassword(rs.getString(2));
                utente.setNome(rs.getString(3));
                utente.setCognome(rs.getString(4));
                utente.setAmministratore(rs.getBoolean(13));
                return utente;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
