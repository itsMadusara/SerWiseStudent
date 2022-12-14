package com.user.CS01.SerWIse;

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

public class getBranchList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String query = "select * from serwise.branch";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/GeneralManager/Branch/ManageBranchHome.jsp");
//            requestDispatcher.forward(req,resp);
            int noOfRows = 0;
            while (resultSet.next()){
                req.setAttribute("branchID"+noOfRows,resultSet.getString("Branch_Id"));
                req.setAttribute("noOfSlots"+noOfRows,resultSet.getString("Number_of_Slots"));
                req.setAttribute("location"+noOfRows,resultSet.getString("Location"));
                noOfRows+=1;
            }
            req.setAttribute("noOfRows",noOfRows);
            requestDispatcher.forward(req,resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
