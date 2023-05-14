package com.CS01.SerWise.Services.Appointments;

import com.CS01.SerWise.Controllers.appoinmentTable;
import com.CS01.SerWise.Controllers.vehicleTable;

import jakarta.servlet.RequestDispatcher;



import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class GetSingleBranchAppointmentList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int branch_Id= Integer.parseInt(req.getParameter("b_Id"));
            ArrayList<String[]> results0 = appoinmentTable.select("*","Branch_Id="+branch_Id);


            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/ServiceAdvisor/Appointment/appointment.jsp");
//            requestDispatcher.forward(req,resp);
            int noOfRows = 0;

            for (String[] i: results0){
                ArrayList<String[]> results1 = vehicleTable.select("*","Vehicle_Id="+i[6]);
                req.setAttribute("AppType"+noOfRows,i[3]);
                req.setAttribute("AppDate"+noOfRows,i[1]);
                req.setAttribute("AppTime"+noOfRows,i[2]);
                req.setAttribute("V_No"+noOfRows,results1.get(0)[4]);
                req.setAttribute("AppId"+noOfRows,i[0]);
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
