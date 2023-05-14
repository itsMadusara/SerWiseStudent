package com.CS01.SerWise.Services.Appointments;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import com.CS01.SerWise.Controllers.appoinmentTable;

import java.io.IOException;
import java.sql.SQLException;

public class DltAppointment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String v_id= req.getParameter("v_no");
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/ServiceAdvisor/Home.jsp");

        try {
            appoinmentTable.delete(v_id);
            requestDispatcher.forward(req,resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
