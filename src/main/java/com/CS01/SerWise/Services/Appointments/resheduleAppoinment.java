package com.CS01.SerWise.Services.Appointments;

import com.CS01.SerWise.Controllers.appoinmentTable;
import com.CS01.SerWise.Controllers.registeredClientTable;
import com.CS01.SerWise.Services.Job.sendDoneMessage;
import com.CS01.SerWise.Services.Process.sendMessage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "ServletresheduleAppoinment", value = "/ServletresheduleAppoinment")
public class resheduleAppoinment extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //get branch id and employee id from the session
        HttpSession session=request.getSession();
        int branch_Id=Integer.parseInt(session.getAttribute("branchId").toString());


        String date="";
        String time="";
        //get current appoinment date,time and appoinemet id with their changed values from request
        String id=request.getParameter("id");
        String old_date=request.getParameter("old_date");
        String old_time=request.getParameter("old_time");
        String new_date=request.getParameter("new_date");
        String new_time=request.getParameter("new_time");
        PrintWriter out=response.getWriter();

        if(new_date=="" && new_time!=""){
            date=old_date;
            time=new_time;
        }
        //set updated values for date, and time
        date=new_date;
        time=new_time;
        String afterSet = "Date='%s',Time='%s'";
        String afterWhere = "Appoinment_Id='%s' and Branch_Id='%s'";
        afterSet = String.format(afterSet,date,time);
        afterWhere = String.format(afterWhere,id,branch_Id);
        try {
            //reshedule appoinment with user entered date and time
            appoinmentTable.update(afterSet,afterWhere);

            //get client id from appoinment table respective appoinment id
            String clientId=appoinmentTable.select("Registered_Client_Id","Appoinment_Id="+id).get(0)[0];

            String phoneNumber = registeredClientTable.select("Contact","Registered_Client_Id="+clientId).get(0)[0];
            phoneNumber = phoneNumber.substring(1);
            phoneNumber = "94"+phoneNumber;
            String doneMessageUrl = sendMessage.sendMessage("Your vehicle is done. You can collect it now. Thank you - SerWise !!",phoneNumber);
            sendDoneMessage.sendMessage(doneMessageUrl);

            //redirect to the branch manager view appoinment page
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/ServletlistAppoinment");
            requestDispatcher.forward(request,response);
        } catch (Exception e) {
            //if errors occur , redirect to the error page
            request.setAttribute("exception",e);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Error/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
