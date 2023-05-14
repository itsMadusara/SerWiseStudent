package com.CS01.SerWise.Services.Registration;

import com.CS01.SerWise.Services.CheckUser;
import com.CS01.SerWise.Services.Hash;
import com.CS01.SerWise.Controllers.registeredClientTable;
import com.CS01.SerWise.Controllers.userTable;
import com.CS01.SerWise.Services.Process.sendMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

public class ServletRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        String fname=request.getParameter("Fname");
        String lname=request.getParameter("Lname");
        String id=request.getParameter("Email");
        String contact=request.getParameter("Contact");
        String password=request.getParameter("pswd");
        String hp= Hash.hashPassword(password);

        try {
            if (id != null) {
                if (CheckUser.checkUserExists(id)) {
                    response.sendRedirect("UnregisteredClient/Register/register.jsp?message=User Already Exists!");
                    return;
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("Fname",fname);
                    session.setAttribute("Lname",lname);
                    session.setAttribute("Email",id);
                    session.setAttribute("Contact",contact);
                    session.setAttribute("pswd",hp);
                    response.sendRedirect("UnregisteredClient/Register/OTP.jsp");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
