package com.CS01.SerWise.Services.Slot;


import com.CS01.SerWise.Controllers.slotTable;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class GetSlotList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int branch_Id= Integer.parseInt(req.getParameter("b_Id"));
            ArrayList<String[]> results0 = slotTable.select("*","Branch_Id="+branch_Id);


            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/ServiceAdvisor/Slot/slot.jsp");
//            requestDispatcher.forward(req,resp);
            int noOfRows = 0;

            for (String[] i: results0){
                req.setAttribute("SlotId"+noOfRows,i[0]);
                noOfRows+=1;
            }

            req.setAttribute("noOfRows",noOfRows);
            requestDispatcher.forward(req,resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
