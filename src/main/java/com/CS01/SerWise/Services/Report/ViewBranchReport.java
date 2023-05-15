package com.CS01.SerWise.Services.Report;

import com.CS01.SerWise.Controllers.branchTable;
import com.CS01.SerWise.Controllers.jobTable;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class ViewBranchReport extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String branchId = session.getAttribute("branchId").toString();
        String month = req.getParameter("month");

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/BranchManager/Report/branchReport.jsp");

        try {
            ArrayList<String[]> billedAppointments = jobTable.select("count(Job_ID)","Status='Billed' and Branch_Id='"+branchId+"' and Date like '"+month+"%'");
            for (String[] i: billedAppointments){
                req.setAttribute("doneAppointments",i[0]);
                System.out.println(i[0]);
            }

            ArrayList<String[]> ongoingAppointments = jobTable.select("count(Job_ID)","Status in ('Done','Ongoing') and Branch_Id='"+branchId+"' and Date like '"+month+"%'");
            for (String[] i : ongoingAppointments){
                req.setAttribute("ongoingAppointments",i[0]);
                System.out.println(i[0]);
            }

            ArrayList<String[]> totalIncome = jobTable.select("sum(Total)","Status in ('Billed') and Branch_Id='"+branchId+"' and Date like '"+month+"%'");
            for (String[] i : totalIncome){
                if(i[0] == null){
                    i[0] = "0";
                }
                req.setAttribute("totalIncome",i[0]);
                System.out.println(i[0]);
            }

            ArrayList<String[]> branchLocation = branchTable.select("Location","Branch_Id="+branchId);
            req.setAttribute("branchId",branchLocation.get(0)[0]);
            req.setAttribute("month",month);




            requestDispatcher.forward(req,resp);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
