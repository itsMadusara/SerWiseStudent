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

public class getEmployeeList extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String query = "select * from serwise.employee";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/GeneralManager/Employee/ManageEmployeeHome.jsp");
//            requestDispatcher.forward(req,resp);
            int noOfRows = 0;
            while (resultSet.next()){
                req.setAttribute("EmployeeID"+noOfRows,resultSet.getString("Employee_Id"));
                req.setAttribute("FirstName"+noOfRows,resultSet.getString("First_Name"));
                req.setAttribute("LastName"+noOfRows,resultSet.getString("Last_Name"));
                req.setAttribute("Address"+noOfRows,resultSet.getString("Address"));
                req.setAttribute("JoinedDate"+noOfRows,resultSet.getString("Joined_Date"));
                req.setAttribute("Contact"+noOfRows,resultSet.getString("Phone_Number"));
                req.setAttribute("BranchID"+noOfRows,resultSet.getString("Branch_Id"));
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
