package com.CS01.SerWise.Services.Job;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;


public class addJob extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        String type = req.getParameter("type");
        Date dt = Date.valueOf(req.getParameter("date"));
        Time tt = Time.valueOf(req.getParameter("time"));
        Integer slot = Integer.parseInt(req.getParameter("slot"));
    }
}
