package com.CS01.SerWise;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class addInventory extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String itemID = req.getParameter("itemID");
        String itemName = req.getParameter("itemName");
        String measurement = req.getParameter("measurement");
        String price = req.getParameter("price");

        String stmnt = "insert into serwise.inventory_item (Inventory_Item_Id, Name, Measurement, Price) values (%s, '%s', '%s', '%s');".format(itemID, itemName, measurement, price);
        Connection con = null;
        try {
            con = DatabaseConnection.initializeDatabase();
            Statement statement = con.createStatement();
            statement.executeUpdate(stmnt);
            resp.sendRedirect("/SerWise_war/GeneralManager/Inventory/InventoryHome.jsp");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
