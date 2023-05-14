package com.CS01.SerWise.Services.Job;

import com.CS01.SerWise.Controllers.appoinmentTable;
import com.CS01.SerWise.Controllers.jobInventoryItemTable;
import com.CS01.SerWise.Controllers.inventoryItemBranchTable;
import com.CS01.SerWise.Controllers.serviceInventoryTable;

import com.CS01.SerWise.Services.DatabaseConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import com.CS01.SerWise.Controllers.slotTable;
import com.CS01.SerWise.Controllers.jobTable;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class ServletCreateJob extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Connection con= null;

        try {


            Integer B_id = Integer.valueOf(request.getParameter("b_id"));
            Integer id = Integer.valueOf(request.getParameter("id"));
            String type = request.getParameter("type");
            Date dt = Date.valueOf(request.getParameter("date"));
            String tt = request.getParameter("time");
            Integer slot = Integer.parseInt(request.getParameter("slot"));
            int service_Id = 0;

            String service = request.getParameter("src");


            Integer N_of_I=0;
//            Integer N_of_I = Integer.parseInt(request.getParameter("No_Of_Item"));

            String inputString = request.getParameter("No_Of_Item");
            if (!inputString.isEmpty()) {
                N_of_I = Integer.parseInt(inputString);

            } else {

            }

            String Status = "ONGOING";
            int job_id = 0;


            con = DatabaseConnection.initializeDatabase();

            ArrayList<String[]> results0 = appoinmentTable.select("Vehicle_Id","Appoinment_Id="+id);
            PreparedStatement ps2=con.prepareStatement("insert into serwise.job(Branch_Id,Date,Time,Slot,Status,Vehicle_Id) values (?,?,?,?,?,?)");

            ps2.setInt(1,B_id);
            ps2.setDate(2,dt);
            ps2.setString(3, tt);
            ps2.setInt(4, slot);
            ps2.setString(5, Status);
            ps2.setString(6, results0.get(0)[0]);
            int i=ps2.executeUpdate();

            PreparedStatement ps5=con.prepareStatement("SELECT Job_ID FROM serwise.job WHERE Vehicle_Id=?");
            ps5.setString(1, results0.get(0)[0]); // Set the first parameter to the item_Id value
            ResultSet rs2 = ps5.executeQuery();
            while (rs2.next()) {
                job_id = rs2.getInt("Job_ID");
            }

            if (service.equals("Default")) {
//                System.out.println("Service is default");
            } else {
                String[]  service_parts= service.split("\\s+"); // Split the string by whitespace
                service_Id = Integer.parseInt(service_parts[0]);
//
                PreparedStatement ps6=con.prepareStatement("insert into serwise.job_has_service(Job_ID,Service_ID) values (?,?)");
//
                ps6.setInt(1,job_id);
                ps6.setInt(2,service_Id);
                int job_service_updated = ps6.executeUpdate();


                PreparedStatement ps9=con.prepareStatement("SELECT * FROM serwise.service_has_inventory_item WHERE Service_Id=?");
                ps9.setInt(1, service_Id); // Set the first parameter to the item_Id value
                ResultSet rs9 = ps9.executeQuery();

//                ArrayList<String[]> results3 = serviceInventoryTable.select("*","Service_Id="+service_Id);
                while (rs9.next()){
                    int inv_item = rs9.getInt("Inventory_Item_Id");
                    int qty = rs9.getInt("Quantity");

                    PreparedStatement ps7=con.prepareStatement("SELECT batchNo FROM serwise.inventory_item_has_branch WHERE Inventory_Item_Id=? AND Branch_Id=?  ORDER BY batchNo ASC");
                    ps7.setInt(1, inv_item); // Set the first parameter to the item_Id value
                    ps7.setInt(2, B_id);
                    ResultSet rs7 = ps7.executeQuery();
                    //##################################################
                    while (rs7.next()) {
                        int batchNo = rs7.getInt("batchNo");
                        PreparedStatement ps8 =con.prepareStatement("INSERT INTO job_has_inventory_items (Job_ID,Inventory_Item_Id,BatchNo,Quantity) VALUES (?,?,?,?)");
                        ps8.setInt(1, job_id); // Set the first parameter to the item_Id value
                        ps8.setInt(2, inv_item);
                        ps8.setInt(3, batchNo);
                        ps8.setInt(4, qty);
                        int rowsInserted = ps8.executeUpdate();

//                            jobInventoryItemTable.insert("Job_ID,Inventory_Item_Id,BatchNo,Quantity",results1.get(0)[0]+","+item_Id+","+batchNo+","+Qty);
                        break;
                    }
                }
            }

//            slotTable.update("status=1","Slot_Id="+slot);
            ArrayList<String[]> results1 = jobTable.select("Job_ID","Vehicle_Id="+results0.get(0)[0]);


            if(i>0){
                PreparedStatement ps1=con.prepareStatement("DELETE FROM serwise.appoinment WHERE Appoinment_Id=?");
                ps1.setString(1, String.valueOf(id));
                int j=ps1.executeUpdate();
                if(j>0)
                {

                    for(Integer k=1; k<=N_of_I; k++)
                    {
                        String item = request.getParameter("Item"+k);
                        String[] parts = item.split("\\s+"); // Split the string by whitespace
                        int item_Id = Integer.parseInt(parts[0]); // Parse the first substring as an integer
                        Integer Qty = Integer.valueOf(request.getParameter("IQ"+k));

                        PreparedStatement ps3=con.prepareStatement("SELECT batchNo FROM serwise.inventory_item_has_branch WHERE Inventory_Item_Id=? AND Branch_Id=?  ORDER BY batchNo ASC");
                        ps3.setInt(1, item_Id); // Set the first parameter to the item_Id value
                        ps3.setInt(2, B_id);
                        ResultSet rs1 = ps3.executeQuery();

                        while (rs1.next()) {
                            int batchNo = rs1.getInt("batchNo");
                            PreparedStatement ps4=con.prepareStatement("INSERT INTO job_has_inventory_items (Job_ID,Inventory_Item_Id,BatchNo,Quantity) VALUES (?,?,?,?)");
                            ps4.setInt(1, job_id); // Set the first parameter to the item_Id value
                            ps4.setInt(2, item_Id);
                            ps4.setInt(3, batchNo);
                            ps4.setInt(4, Qty);
                            int rowsInserted = ps4.executeUpdate();

//                            jobInventoryItemTable.insert("Job_ID,Inventory_Item_Id,BatchNo,Quantity",results1.get(0)[0]+","+item_Id+","+batchNo+","+Qty);
                            break;
                        }

//                        ArrayList<String[]> results2 = inventoryItemBranchTable.select("batchNo","Inventory_Item_Id="+item_Id+" AND Branch_Id="+B_id+" ORDER BY batchNo ASC");


//                        jobInventoryItemTable.insert("Job_ID,Inventory_Item_Id,BatchNo,Quantity",results1.get(0)[0]+","+item_Id+","+batchNo+","+Qty);

                    }


                    response.sendRedirect("/SerWise_war/ServiceAdvisor/Home.jsp");
                }
            }


        } catch (SQLException e) {
            //String message = "User already exixsts";
            //HttpSession session = request.getSession();
            //session.setAttribute("massage",message);
            //request.setAttribute("message", message); // This will be available as ${message}
            //request.getRequestDispatcher("/UnregisteredClient/Register/register.jsp").forward(request, response);
            //throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        out.close();

    }
}
