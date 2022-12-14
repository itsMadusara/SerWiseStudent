package com.user.CS01.SerWIse;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class updateEmployee extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String eid = req.getParameter("eid");
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String query = "select * from serwise.employee where Employee_Id='%s'".formatted(eid);
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/GeneralManager/Employee/UpdateEmployee.jsp");
            while (resultSet.next()){
                req.setAttribute("EmployeeID",resultSet.getString("Employee_Id"));
                req.setAttribute("FirstName",resultSet.getString("First_Name"));
                req.setAttribute("LastName",resultSet.getString("Last_Name"));
                req.setAttribute("Address",resultSet.getString("Address"));
                req.setAttribute("JoinedDate",resultSet.getString("Joined_Date"));
                req.setAttribute("Contact",resultSet.getString("Phone_Number"));
                req.setAttribute("BranchID",resultSet.getString("Branch_Id"));
            }
            requestDispatcher.forward(req,resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
