package com.CS01.SerWise.Services.Profile;

import com.CS01.SerWise.Controllers.employeeTable;
import com.CS01.SerWise.Controllers.registeredClientTable;
import com.CS01.SerWise.Controllers.userTable;
import com.CS01.SerWise.Services.Hash;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class changePassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String otp = session.getAttribute("OTP").toString();
        String inputOtp = req.getParameter("otpInput");

        if (otp.equals(inputOtp)){
            try {
                String password=req.getParameter("newPassword");
                String hashPassword= Hash.hashPassword(password);

                Object role = session.getAttribute("auth");
                String email;
                if (role == null){
                    String clientId = (String) session.getAttribute("uid");
                    ArrayList<String[]> emailResult = registeredClientTable.select("Address","Registered_Client_Id="+clientId);
                    email = emailResult.get(0)[0];
                } else {
                    String employeeId = (String) session.getAttribute("employeeId");
                    ArrayList<String[]> emailResult = employeeTable.select("Email","Employee_Id="+employeeId);
                    email = emailResult.get(0)[0];
                }

                userTable.update("password='"+hashPassword+"'","id='"+email+"'");

                resp.sendRedirect("/SerWise_war/Profile");

            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        } else {
            resp.sendRedirect("/SerWise_war/Profile?opterror='Invalid OTP'");
        }

    }
}
