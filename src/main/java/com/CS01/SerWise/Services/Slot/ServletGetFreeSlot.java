package com.CS01.SerWise.Services.Slot;

import com.CS01.SerWise.Controllers.slotTable;
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

public class ServletGetFreeSlot extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode rootNode = objectMapper.readTree(request.getReader());
            String B_Id = rootNode.get("Branch_Id").asText();

            JSONObject freeslot;
            ArrayList<String[]> results = slotTable.select("Slot_Id", "Branch_Id="+B_Id);

            int noofrows = 0;
            freeslot = new JSONObject();
            for (String[] i : results) {
                freeslot.put("slot" + noofrows, i[0]);
                noofrows += 1;
            }
            freeslot.put("noOfRows", noofrows);
            PrintWriter ls = response.getWriter();

            ls.println(freeslot);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
