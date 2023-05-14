package com.CS01.SerWise.Services.Slot;

import com.CS01.SerWise.Controllers.inventoryItemBranchTable;
import com.CS01.SerWise.Controllers.inventoryItemTable;
import jakarta.servlet.RequestDispatcher;



import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class GetSingleBranchInventoryList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int branch_Id= Integer.parseInt(req.getParameter("b_Id"));
            ArrayList<String[]> results0 = inventoryItemBranchTable.select("*","Branch_Id="+branch_Id);



            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/ServiceAdvisor/Inventory/inventory.jsp");
//            requestDispatcher.forward(req,resp);
            int noOfRows = 0;

            for (String[] i: results0){
                ArrayList<String[]> results1 = inventoryItemTable.select("*","Inventory_Item_Id="+i[0]);
                req.setAttribute("ItemID"+noOfRows,i[0]);
                req.setAttribute("ItemName"+noOfRows,results1.get(0)[1]);
                req.setAttribute("Measure"+noOfRows,results1.get(0)[2]);
                req.setAttribute("Batch_No"+noOfRows,i[2]);
                req.setAttribute("Qtt"+noOfRows,i[3]);
                req.setAttribute("Price"+noOfRows,results1.get(0)[3]);
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
