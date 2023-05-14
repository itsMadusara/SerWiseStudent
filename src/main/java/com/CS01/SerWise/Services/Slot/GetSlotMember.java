package com.CS01.SerWise.Services.Slot;

import com.CS01.SerWise.Controllers.mechanicTable;
import com.CS01.SerWise.Controllers.employeeTable;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.JsonNode;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

public class GetSlotMember extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode rootNode = objectMapper.readTree(request.getReader());
            String B_Id = rootNode.get("Branch_Id").asText();

//            String B_Id = "67";


            JSONObject slot_Mbr;
            ArrayList<String[]> results = mechanicTable.select();

            int noofrows = 0;
            slot_Mbr = new JSONObject();
            for (String[] i : results) {
                ArrayList<String[]> results1 = employeeTable.select("First_Name,Last_Name", "Branch_Id="+B_Id+" AND Employee_Id="+i[0]);

                if (results1.isEmpty()) {
                    continue; // Skip the current iteration
                }
                slot_Mbr.put("name" + noofrows, results1.get(0)[0]+" "+results1.get(0)[1]);
                slot_Mbr.put("slotMbr_Id" + noofrows, i[0]);
                noofrows += 1;
            }
            slot_Mbr.put("noOfRows", noofrows);
            PrintWriter ls = response.getWriter();

            ls.println(slot_Mbr);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
