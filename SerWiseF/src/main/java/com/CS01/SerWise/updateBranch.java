package com.CS01.SerWise;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class updateBranch extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String bid = req.getParameter("bid");
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String query = "select * from serwise.branch where Branch_Id=%s;".format(bid);
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/GeneralManager/Branch/UpdateBranch.jsp");
            while (resultSet.next()){
                req.setAttribute("branchID",resultSet.getString("Branch_Id"));
                req.setAttribute("noOfSlots",resultSet.getString("Number_of_Slots"));
                req.setAttribute("location",resultSet.getString("Location"));
            }
            requestDispatcher.forward(req,resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
