package com.CS01.SerWise.Services.Profile;

import com.CS01.SerWise.Controllers.registeredClientTable;
import com.CS01.SerWise.Controllers.userTable;
import com.CS01.SerWise.Services.Hash;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ServletChangePassword", value = "/ServletChangePassword")
public class ServletChangePassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session= request.getSession();
        Integer opt= (Integer)session.getAttribute("OTP");
        int optval= Integer.parseInt(request.getParameter("OTP"));
        String pswd= (String) session.getAttribute("newPassword");
        String id= (String) session.getAttribute("Email");
        String hp= Hash.hashPassword(pswd);

        if(opt == null){
            opt=0;
        }

        if (optval!=opt) {
            response.sendRedirect("Login/OTP.jsp?message=Invalid OTP!");
            return;
        } else{
            String values1 = "id='%s'";
            values1 = String.format(values1,id);
            String values2 = "password='%s'";
            values2 = String.format(values2,hp);
            try {
                userTable.update(values2,values1);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            response.sendRedirect("Login/login.jsp");
        }
    }
}
