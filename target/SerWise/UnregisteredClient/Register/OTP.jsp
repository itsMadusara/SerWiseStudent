<%--
  Created by IntelliJ IDEA.
  User: Thamira Weerakoon
  Date: 11/22/2022
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.CS01.SerWise.Services.Hash"%>
<!DOCTYPE html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../CSS/content.css">
    <link rel="stylesheet" href="../../CSS/navigation.css">
    <link rel="stylesheet" href="../../CSS/footer.css">
    <link rel="stylesheet" href="../../CSS/backgrount.css">
    <title>Register</title>
</head>
<body>
<header class="navigation">
    <img src="../../Assets/SerWise.png" class="navimg">
    <table>
        <tr>
            <td><a href="../../Home/home.jsp">Home</a></td>
            <td><a href="../Services/selectBranch.jsp">Services</a></td>
            <td><a href="register.jsp">Register</a></td>
            <td><a href="../../Login/login.jsp"><button class="button">Login</button></a></td>
        </tr>
    </table>
</header>


<div class="two-content-div glass">
    <div class="two-content-div-one">
        <span class="title">SerWise</span><br>
        <span class="subtitle">OTP Verification</span>
    </div>
    <div class="two-content-div-form">
        <form id="reform" action="../../ServletOTP" method="post">
            <input type="number" id="OTPval" name="OTP" placeholder="ENTER OTP" required> <br>
            <div style="color:red" id="err"></div>
            <%
                String msg = request.getParameter("message");
                if(msg!=null){
                    out.println("<span style=\"color: #EE534F\">"+msg+"</span><br>");
                }
            %>
            <button type="button" class="button" id="OPTDivbtn">Get OTP</button> &MediumSpace;
            <button type="submit" id="submitButton" class="button">Register</button>
        </form>
    </div>
</div>


<footer class="footer"></footer>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bcryptjs/2.4.3/bcrypt.min.js"></script>
<script src="OTP.jsp"></script>
<script src="/SerWise_war/footer.js"></script>
</body>
</html>