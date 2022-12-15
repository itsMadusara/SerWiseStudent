package com.CS01.SerWise;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class ServletAddVehicle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();

        String type=request.getParameter("Type");
        String reg=request.getParameter("Reg");
        String brand=request.getParameter("Brand");
        String fuel=request.getParameter("FuelType");
        String model=request.getParameter("Model");
        String ec=request.getParameter("EC");

        HttpSession session=request.getSession();
        int userid=(Integer)session.getAttribute("uid");

        Connection con= null;

        try {
            con = DatabaseConnection.initializeDatabase();
            PreparedStatement ps1=con.prepareStatement("insert into serwise.vehicle(Model,Type,Registered_Client_Id,Reg_No,Brand,Fuel,EC) values(?,?,?,?,?,?,?)");

            ps1.setString(1,model);
            ps1.setString(2,type);
            ps1.setInt(3,userid);
            ps1.setString(4,reg);
            ps1.setString(5,brand);
            ps1.setString(6,fuel);
            ps1.setString(7,ec);
            int i=ps1.executeUpdate();
            if(i>0){
                response.sendRedirect("RegisteredClient/Vehicles/vehicles.jsp");
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        out.close();
    }
}
