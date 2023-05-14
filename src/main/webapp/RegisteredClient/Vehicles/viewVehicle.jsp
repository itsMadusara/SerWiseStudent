<%--
  Created by IntelliJ IDEA.
  User: Thamira Weerakoon
  Date: 12/3/2022
  Time: 7:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.CS01.SerWise.Controllers.vehicleTable" %>
<%
  int vId=Integer.parseInt(request.getParameter("Vehicle_Id"));
%>
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

<div class="single-content-div title center">
  <%
    try{
      ArrayList<String[]> results1 = vehicleTable.select("*","Vehicle_Id="+vId);
      for (String[] i : results1){
  %>
  <div>
    <span class="title"><%=i[4]%></span><br>
  </div>
  <%
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  %>
</div>

<div class="single-content-div center glass">
  <div class="single-content-div-form">
    <%
      try{
        ArrayList<String[]> results1 = vehicleTable.select("*","Vehicle_Id="+vId);
        for (String[] i : results1){
    %>
    <div>
      <form>
        <input type="text" value="<%=i[2]%>" disabled>
        <input type="text" value="<%=i[4]%>" disabled>
        <input type="text" value="<%=i[5]%>" disabled>
        <input type="text" value="<%=i[1]%>" disabled>
        <input type="text" value="<%=i[6]%>" disabled>
        <input type="text" value="<%=i[7]%>" disabled>
      </form>
      <form class="center" method="post" action="../../RemoveVehicle">
        <input type="submit" value="Remove Vehicle" class="button"/>
        <input type = "hidden" name="Vehicle_Id" value="<%=vId %>" class="button" />
      </form>
    </div>
    <%
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>
  </div>
</div>


<footer class="footer"></footer>
<script src="/SerWise_war/RegisteredClient/RegisteredClientHeader.js"></script>
<script src="/SerWise_war/footer.js"></script>
</body>
</html>