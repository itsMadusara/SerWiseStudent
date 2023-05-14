package com.CS01.SerWise.Services.Services.ServicesTable;

import com.CS01.SerWise.Controllers.serviceTable;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletgetServiceListSA", value = "/ServletgetServiceListSA")
public class ServletgetServiceListSA extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            JSONObject service;
            service = new JSONObject();

            ArrayList<String[]> results = serviceTable.select();

            int noOfRows =0;

            for (String[] i:results){
                service.put("name"+noOfRows,i[0]+" "+i[1]);
                noOfRows+=1;
            }


            service.put("noOfRows", noOfRows);
            PrintWriter ls = response.getWriter();

            ls.println(service);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
