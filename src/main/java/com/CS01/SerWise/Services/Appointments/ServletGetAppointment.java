package com.CS01.SerWise.Services.Appointments;

import com.CS01.SerWise.Controllers.branchManagerTable;
import com.CS01.SerWise.Controllers.branchTable;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletGetAppointment", value = "/ServletGetAppointment")
public class ServletGetAppointment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ArrayList<String[]> results = branchTable.select();
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/GeneralManager/Branch/ManageBranchHome.jsp");
            int noofrows = 0;
            for (String[] i : results){
                req.setAttribute("branchID"+noofrows,i[0]);
                req.setAttribute("noOfSlots"+noofrows,i[1]);
                req.setAttribute("location"+noofrows,i[2]);
                ArrayList<String[]> branchmanager = branchManagerTable.select("Employee_Id","Branch_Id="+i[0]);
                String[] temp = branchmanager.get(0);
                req.setAttribute("managerID"+noofrows,temp[0]);
                noofrows+=1;
            }
            req.setAttribute("noOfRows",noofrows);
            requestDispatcher.forward(req,resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
