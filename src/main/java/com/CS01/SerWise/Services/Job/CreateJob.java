package com.CS01.SerWise.Services.Job;

import com.CS01.SerWise.Controllers.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;


public class CreateJob extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/ServiceAdvisor/Home.jsp");

        Integer B_id = Integer.valueOf(request.getParameter("b_id"));
        Integer id = Integer.valueOf(request.getParameter("id"));
        String type = request.getParameter("type");
        String dt = request.getParameter("date");
        Time tt = Time.valueOf(request.getParameter("time"));
        Integer slot = Integer.parseInt(request.getParameter("slot"));
        String service = request.getParameter("src");


        ArrayList<String[]> results0 = appoinmentTable.select("Vehicle_Id","Appoinment_Id="+id);
        jobTable.insert("Branch_Id,Date,Slot,Vehicle_Id",B_id+","+dt+","+slot+","+results0.get(0)[0]);

//            ArrayList<String[]> results0 = appoinmentTable.select();


            requestDispatcher.forward(request,response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
