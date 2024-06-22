package model;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "UtenteDAO", value = "/UtenteDAO")
public class UtenteDAO extends HttpServlet {

    public static ArrayList<Utente> doRetriveUtente() {
        ArrayList<Utente> u = new ArrayList<Utente>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Utente");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Utente utente = new Utente();
                utente.setNome(rs.getString(2));
                utente.setCognome(rs.getString(3));
                utente.setSaldo(rs.getDouble(4));
                utente.setEmail(rs.getString(5));
                utente.setPassword(rs.getString(6));
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
            PreparedStatement ps = con.prepareStatement("SELECT * FROM utente WHERE email = ? AND pass = ?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                utente.setNome(rs.getString(2));
                utente.setCognome(rs.getString(3));
                utente.setSaldo(rs.getDouble(4));
                utente.setEmail(rs.getString(5));
                utente.setPassword(rs.getString(6));
                utente.setAmministratore(rs.getBoolean(7));
                return utente;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public static void doRegistration(Utente utente) {

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO utente (nome, cognome, email, pass, saldo, amministratore) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, utente.getNome());
            ps.setString(2, utente.getCognome());
            ps.setString(3, utente.getEmail());
            ps.setString(4, utente.getPassword());
            ps.setDouble(5, utente.getSaldo());
            ps.setBoolean(6, utente.isAmministratore());

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean isNewEmail(String email) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT email FROM utente WHERE email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return false;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return true;
    }

}
