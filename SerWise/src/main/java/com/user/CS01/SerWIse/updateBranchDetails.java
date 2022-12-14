package com.user.CS01.SerWIse;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class updateBranchDetails extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String branchID = req.getParameter("branchID");
        String location = req.getParameter("location");
        String address = req.getParameter("address");
        String noOfSlotes = req.getParameter("noOfSlots");

        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String query = "update serwise.branch set Number_of_Slots='%s' , Location='%s' where Branch_Id='%s';".formatted(noOfSlotes,location,branchID);
            Statement statement = con.createStatement();
            statement.executeUpdate(query);
            resp.sendRedirect("/branchlist");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
