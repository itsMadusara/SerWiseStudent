<%--
  Created by IntelliJ IDEA.
  User: Thamira Weerakoon
  Date: 12/11/2022
  Time: 8:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../CSS/content.css">
    <link rel="stylesheet" href="../CSS/navigation.css">
    <link rel="stylesheet" href="../CSS/footer.css">
    <link rel="stylesheet" href="../CSS/backgrount.css">
    <title>Document</title>
</head>
<body>
<header class="navigation">
    <img src="../Assets/SerWise.png" class="navimg">
    <table>
        <tr>
            <td><a href="../Home/home.jsp">Home</a></td>
            <td><a href="../UnregisteredClient/Services/selectBranch.jsp">Services</a></td>
            <td><a href="../UnregisteredClient/Register/register.jsp">Register</a></td>
            <td><a href="../Login/login.jsp"><button class="button">Login</button></a></td>
        </tr>
    </table>
</header>

<div class="two-content-div glass">
    <div class="two-content-div-one">
        <span class="title">SerWise</span><br>
        <span class="subtitle">User Login</span>
    </div>
    <div class="two-content-div-form">
        <form action="../ServletLogin" method="post">
            <input type="text" name="id" placeholder="Email" required><br>
            <input type="password" name="pswd" id="password" placeholder="Password" required><br>
            <div style="color:red" id="err"></div>
            <%
                String msg = request.getParameter("message");
                if(msg!=null){
                    out.println("<span style=\"color: #EE534F\">"+msg+"</span><br>");
                }
            %>
            <input type="submit" value="Login" class="button"> &MediumSpace;
            <a href="enterEmail.jsp"> <button type="button" class="button">Forget Password</button> </a>
        </form>
<%--        <form action="enterEmail.jsp">--%>
<%--            <input type="submit" value="Forget Password" class="button">--%>
<%--        </form>--%>
    </div>
</div>

<footer class="footer"></footer>

<script src="/SerWise_war/footer.js"></script>
</body>
</html>
