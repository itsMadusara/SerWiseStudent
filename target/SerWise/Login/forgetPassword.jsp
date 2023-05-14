<%--
  Created by IntelliJ IDEA.
  User: Thamira Weerakoon
  Date: 12/11/2022
  Time: 8:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.CS01.SerWise.Controllers.registeredClientTable" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
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
  <div>
    <span class="title">SerWise</span><br>
    <span class="subtitle">Verify Number</span>
  </div>
  <div class="two-content-div-form">
    <%
      String Id=request.getParameter("id");
      session.setAttribute("Email",Id);
      try{
        String email = "Address='%s'";
        email = String.format(email,Id);
        ArrayList<String[]> results1 = registeredClientTable.select("Contact",email);
        if(results1.isEmpty()){
          response.sendRedirect("Login/enterEmail.jsp?message=Unknown Email,Please Register!");
        }
        for (String[] i : results1){
          session.setAttribute("Contact",i[0]);
    %>
    <form action="OTP.jsp" method="post">
      <label>Contact Number:</label>
      <input type="text" name="contact" placeholder="<%=i[0]%>" disabled><br>
      <input type="submit" value="It's Me!" class="button"> &MediumSpace;
      <a href="../Home/home.jsp"><button type="button" class="button"> Not Me! </button></a>
    </form>
    <%
        }
      } catch (SQLException | ClassNotFoundException e) {
        throw new RuntimeException(e);
      }
    %>
  </div>
</div>

<footer class="footer">
  <div class="center"><img src="../Assets/SerWise.png" class="logo"></div>
  <div class="center"><a href="#"> Contact Us </a> &nbsp|
    &nbsp<a href="#"> About Us </a> &nbsp|
    &nbsp <a href="#"> Legal Stuff </a></div>
  <div class="center">All Rights Recieved</div>
</footer>
</body>
</html>
