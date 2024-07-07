package model;

import jakarta.servlet.annotation.WebServlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;

@WebServlet(name = "OrdineDAO", value = "/OrdineDAO")
public class OrdineDAO {

    
    public static ArrayList<Ordine> doRetriveOrdine(int ID_utente) {
        ArrayList<Ordine> o = new ArrayList<Ordine>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM ordine WHERE utente_ID = ?");
            ps.setInt(1,ID_utente);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Ordine ordine = new Ordine();
                ordine.setOrdine_ID(rs.getInt(1));
                ordine.setPrezzo_tot(rs.getDouble(2));
                Date sqlDate = rs.getDate(3);
                GregorianCalendar calendar = new GregorianCalendar();
                calendar.setTime(sqlDate);
                ordine.setData(calendar);
                ordine.setScontrino(rs.getString(4));
                ordine.setUtente_ID(rs.getInt(5));
                o.add(ordine);
            }
            return o;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    
    
}
