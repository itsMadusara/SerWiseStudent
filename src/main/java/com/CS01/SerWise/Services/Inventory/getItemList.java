package com.CS01.SerWise.Services.Inventory;

import com.CS01.SerWise.Controllers.inventoryItemTable;
import com.CS01.SerWise.Controllers.inventoryItemBranchTable;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;


public class getItemList extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode rootNode = objectMapper.readTree(req.getReader());
            String B_Id = rootNode.get("Branch_Id").asText();
            JSONObject item;
            item = new JSONObject();

//            String B_Id = "67";

            ArrayList<String[]> results0 = inventoryItemBranchTable.select("*","Branch_Id="+B_Id);




//            requestDispatcher.forward(req,resp);
            int noOfRows = 0;

            for (String[] i : results0) {
                ArrayList<String[]> results1 = inventoryItemTable.select("*","Inventory_item_Id="+i[0]);
                item.put("item" + noOfRows, results1.get(0)[0]+" "+ results1.get(0)[1]);
                noOfRows += 1;
            }

            item.put("noOfRows", noOfRows);
            PrintWriter ls = resp.getWriter();

            ls.println(item);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
