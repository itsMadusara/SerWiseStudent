<%--
  Created by IntelliJ IDEA.
  User: Thamira Weerakoon
  Date: 12/3/2022
  Time: 9:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../../CSS/content.css">
  <link rel="stylesheet" href="../../CSS/navigation.css">
  <link rel="stylesheet" href="../../CSS/footer.css">
  <link rel="stylesheet" href="../../CSS/backgrount.css">
  <title>Document</title>
</head>
<body>
<%
  if (session.getAttribute("uid")==null){
    response.sendRedirect("../../Login/login.html");
  }
%>
<header class="navigation"></header>

<div class="two-content-div glass">
  <div>
    <span class="title">SerWise</span><br>
    <span class="subtitle">Appointments</span>
  </div>
    <div class="colomn-content-div options">
      <div>
        <span class="title">Make Appointments</span><br>
        <span>Make an appointment to get the best services.</span><br>
        <a href="makeAppointments.jsp"><button class="button">Make Now</button></a>
      </div>
      <div>
        <span class="title">Your Appointments</span><br>
        <span>View your appointments here to keep track.</span><br>
        <a href="ViewAppointments.jsp"><button class="button">View Appointments</button></a>
      </div>
    </div>
</div>


<footer class="footer"></footer>

<script src="/SerWise_war/RegisteredClient/RegisteredClientHeader.js"></script>
<script src="/SerWise_war/footer.js"></script>
</body>
</html>
