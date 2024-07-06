package model;

import jakarta.servlet.annotation.WebServlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ProdottoDAO", value = "/ProdottoDAO")
public class ProdottoDAO {

    public static ArrayList<Prodotto> doRetriveProdotto() {
        ArrayList<Prodotto> p = new ArrayList<Prodotto>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM prodotto");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Prodotto prodotto = new Prodotto();
                prodotto.setNome(rs.getString(2));
                prodotto.setDescrizione(rs.getString(3));
                prodotto.setPrezzo(rs.getDouble(4));
                prodotto.setQuantita(rs.getInt(5));
                prodotto.setSconto(rs.getInt(6));
                prodotto.setImg(rs.getString(7));
                p.add(prodotto);
            }
            return p;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public static ArrayList<Prodotto> findByCategory(String tipo) {

        ArrayList<Prodotto> p = new ArrayList<Prodotto>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT p.prodotto_ID, p.nome, p.descrizione, p.prezzo, p.quantita, p.sconto, p.img" +
                    "FROM cat_prod cp " +
                    "JOIN prodotto p ON cp.prodotto_ID = p.prodotto_ID " +
                    "WHERE cp.cat_Tipo = ?");
            ps.setString(1, tipo);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Prodotto prodotto = new Prodotto();
                prodotto.setNome(rs.getString(2));
                prodotto.setDescrizione(rs.getString(3));
                prodotto.setPrezzo(rs.getDouble(4));
                prodotto.setQuantita(rs.getInt(5));
                prodotto.setSconto(rs.getInt(6));
                prodotto.setImg(rs.getString(7));
                p.add(prodotto);
            }
            return p;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static ArrayList<Prodotto> findBySearch(String search) {

        ArrayList<Prodotto> p = new ArrayList<Prodotto>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM prodotto WHERE UPPER(nome) LIKE ? OR UPPER(descizione) LIKE ?");
            ps.setString(1, search);
            ps.setString(2, search);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Prodotto prodotto = new Prodotto();
                prodotto.setNome(rs.getString(2));
                prodotto.setDescrizione(rs.getString(3));
                prodotto.setPrezzo(rs.getDouble(4));
                prodotto.setQuantita(rs.getInt(5));
                prodotto.setSconto(rs.getInt(6));
                prodotto.setImg(rs.getString(7));
                p.add(prodotto);
            }
            return p;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    public static void addProdotto(Prodotto prodotto) {

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO prodotto (nome, descrizione, prezzo, quantita, sconto, img) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, prodotto.getNome());
            ps.setString(2, prodotto.getDescrizione());
            ps.setDouble(3, prodotto.getPrezzo());
            ps.setInt(4, prodotto.getQuantita());
            ps.setInt(5, prodotto.getSconto());
            ps.setString(6, prodotto.getImg());

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static void modifyProdotto(Prodotto prodotto) {

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO prodotto (nome, descrizione, prezzo, quantita, sconto, img) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, prodotto.getNome());
            ps.setString(2, prodotto.getDescrizione());
            ps.setDouble(3, prodotto.getPrezzo());
            ps.setInt(4, prodotto.getQuantita());
            ps.setInt(5, prodotto.getSconto());
            ps.setString(6, prodotto.getImg());

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


}
