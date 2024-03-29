package com.CS01.SerWise.Services.Inventory;

import com.CS01.SerWise.Controllers.inventoryItemBranchTable;
import com.CS01.SerWise.Controllers.inventoryItemTable;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

public class updateInventoryDetails extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String itemID = req.getParameter("itemID");
        String itemName = req.getParameter("itemName");
        String measurement = req.getParameter("measurement");
        String price = req.getParameter("price");
        int noOfBranch = Integer.parseInt(req.getParameter("noOfBranches"));

        String inventoryItemBranchAttributes = "Inventory_Item_Id,Branch_Id";

        for (int k=1;k<=noOfBranch;k++){
            String branchid = req.getParameter("branchid"+k);
            String inventoryItemBranchValues = "%s,%s";
            inventoryItemBranchValues = String.format(inventoryItemBranchValues, itemID, branchid);
            try {
                inventoryItemBranchTable.insert(inventoryItemBranchAttributes,inventoryItemBranchValues);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }

        String afterSet = "Name='%s', Measurement='%s', Price='%s'";
        String afterWhere = "Inventory_Item_Id='%s'";

        afterSet = String.format(afterSet, itemName, measurement, price);
        afterWhere = String.format(afterWhere, itemID);

        try {
            inventoryItemTable.update(afterSet, afterWhere);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        resp.sendRedirect("/SerWise_war/inventorylist");
    }
}
