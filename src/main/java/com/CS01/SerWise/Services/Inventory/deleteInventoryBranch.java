package com.CS01.SerWise.Services.Inventory;

import com.CS01.SerWise.Controllers.inventoryItemBranchTable;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

public class deleteInventoryBranch extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String BranchId = req.getParameter("branchId");
        String ItemId = req.getParameter("itemId");
        String where = "Inventory_Item_Id=%s and Branch_Id=%s";
        where = String.format(where, ItemId, BranchId);
        try {
            inventoryItemBranchTable.delete(where);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
