package model;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import java.nio.charset.StandardCharsets;
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
                utente.setID(rs.getInt(1));
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
        if (email == null || password == null)
            return null;
        Utente utente = new Utente();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM utente WHERE email = ? AND pass = ?");
            ps.setString(1, email);
            ps.setString(2, toHash(password));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                utente.setID(rs.getInt(1));
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
            ps.setString(4, toHash(utente.getPassword()));
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

    public static void updateSaldo(Utente utente, double saldoNuovo) {

        try (Connection con = ConPool.getConnection();
             PreparedStatement ps = con.prepareStatement("UPDATE utente SET saldo = ? WHERE utente_ID = ?")) {

            ps.setDouble(1, saldoNuovo);
            ps.setInt(2, utente.getID());

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated != 1) {
                throw new SQLException("Non è stato possibile aggiornare il saldo dell'utente.");
            }

        } catch (SQLException e) {
            throw new RuntimeException("Errore durante l'aggiornamento del saldo dell'utente.", e);
        }
    }

    public static void setNewStatus(int ID, boolean statusNuovo) {

        try (Connection con = ConPool.getConnection();
             PreparedStatement ps = con.prepareStatement("UPDATE utente SET amministratore = ? WHERE utente_ID = ?")) {

            ps.setBoolean(1, statusNuovo);
            ps.setInt(2, ID);

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated != 1) {
                throw new SQLException("Non è stato possibile aggiornare il saldo dell'utente.");
            }

        } catch (SQLException e) {
            throw new RuntimeException("Errore durante l'aggiornamento del saldo dell'utente.", e);
        }
    }

    private static String toHash(String password) {
        String hashString = null;
        try {
            java.security.MessageDigest digest = java.security.MessageDigest.getInstance("SHA-512");
            byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            hashString = "";
            for (int i = 0; i < hash.length; i++) {
                hashString += Integer.toHexString((hash[i] & 0xFF) | 0x100).substring(1, 3);
            }
        } catch (java.security.NoSuchAlgorithmException e) {
            System.out.println(e);
        }
        return hashString;
    }


}
