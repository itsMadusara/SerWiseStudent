package com.CS01.SerWise;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;


public class ServletLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String id = request.getParameter("id");
        String password = request.getParameter("pswd");

        Connection con = null;
        ResultSet rs = null;

        try {
            if (!(CheckUser.checkUserExists(id))) {
                response.sendRedirect("UnregisteredClient/Register/login.jsp?message=User doesn't Exists!");
            }
            con = DatabaseConnection.initializeDatabase();
            PreparedStatement ps1 = con.prepareStatement("select * from serwise.user where id=?");
            ps1.setString(1, id);
            rs = ps1.executeQuery();

            while (rs.next()) {
                    String salt = rs.getString("salt");
                    byte[] desalt = Base64.getDecoder().decode(salt);
                    if (passwordHash.equals(password, rs.getString("password"), desalt)) {

                        int role = rs.getInt("role");
                        switch (role) {
                            case 1:
                                Connection con2 = null;
                                ResultSet rs2 = null;

                                con2 = DatabaseConnection.initializeDatabase();
                                PreparedStatement ps2 = con2.prepareStatement("select Registered_Client_Id from serwise.registered_client where Address=?");
                                ps2.setString(1, id);
                                rs2 = ps2.executeQuery();

                                while (rs2.next()) {
                                    int val = ((Number) rs2.getObject(1)).intValue();
                                    HttpSession session = request.getSession();
                                    session.setAttribute("uid", val);
                                }
                                response.sendRedirect("RegisteredClient/Home/home.jsp");
                                break;
                            case 2:
                                response.sendRedirect("GeneralManager/Home/home.jsp");
                                break;
                            case 3:
                                response.sendRedirect("ServiceAdvisor/Home.jsp");
                                break;
                            case 4:
                                response.sendRedirect("BranchManager/Home/home.html");
                                break;
                        }
                        ;

                    } else {
                        response.sendRedirect("Login/login.jsp?message=Password Invalid!");
                        return;
                    }
            }
            ;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        out.close();
    }
    }
