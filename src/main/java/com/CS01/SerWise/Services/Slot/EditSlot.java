package com.CS01.SerWise.Services.Slot;
import java.io.PrintWriter;
import java.util.Enumeration;

import com.CS01.SerWise.Controllers.slotLeaderTable;
import com.CS01.SerWise.Controllers.slotTable;
import com.CS01.SerWise.Controllers.slotMemberTable;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.RequestDispatcher;



import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class EditSlot extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            JSONObject confirm;
            confirm = new JSONObject();

            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode rootNode = objectMapper.readTree(req.getReader());
            String B_Id = rootNode.get("Branch_Id").asText();
            Integer N_of_mbr = Integer.valueOf(rootNode.get("N_of_mbr").asText());
            String Slot_Id = rootNode.get("Slot_Id").asText();
            Integer Slot_Ldr = Integer.valueOf(rootNode.get("Slot_Ldr").asText());

//            String B_Id = "67";
//            Integer N_of_mbr = 5;
//            String Slot_Id = "1002";
//            Integer Slot_Ldr = 101;

            ArrayList<String[]> results0 = slotMemberTable.select("*","Slot_Id="+Slot_Id);
            ArrayList<String[]> results1 = slotTable.select("Slot_Leader_Id","Slot_Id="+Slot_Id);
            slotLeaderTable.update("Employee_Id="+Slot_Ldr,"Slot_Leader_Id="+results1.get(0)[0]);

            for (String[] i : results0) {
                slotMemberTable.delete(i[0]);
            }


            ArrayList<String[]> results = slotLeaderTable.select("Employee_Id", "Branch_Id="+B_Id);

            for (Integer i = 1; i <= N_of_mbr; i++) {
                Integer mbr = Integer.parseInt(rootNode.get("M"+i).asText());
                slotMemberTable.insert("Slot_Member_Id,Slot_Id",mbr+","+Slot_Id);
            }






//            int numberOfAttributes = 0;
//            while (attributeNames.hasMoreElements()) {
//                numberOfAttributes++;
//                attributeNames.nextElement();
//            }





//            requestDispatcher.forward(req,resp);
            confirm.put("ok","ok");
            PrintWriter ls = resp.getWriter();

            ls.println(confirm);


        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
