<%--
  Created by IntelliJ IDEA.
  User: Thamira Weerakoon
  Date: 12/5/2022
  Time: 8:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.CS01.SerWise.Controllers.serviceTable" %>
<%@ page import="com.CS01.SerWise.Controllers.branchTable" %>
<%@ page import="com.CS01.SerWise.Controllers.vehicleTable" %>
<%@ page import="java.util.ArrayList" %>
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

  <div class="two-content-div glass center">
    <div>
      <span class="title">SerWise</span><br>
      <span class="subtitle">Make Lube Appointments</span>
    </div>
    <div class="two-content-div-form">
      <div>
      <form action="../../ServletAddLubeAppointment" method="post">
        <label for="Branch">Select Branch:</label>
        <select name="Branch_Id" id="Branch" required>
          <%
            HttpSession session1=request.getSession();
            int id=(Integer)session1.getAttribute("uid");

            try{
              ArrayList<String[]> results1 = branchTable.select();
              for (String[] i : results1){
          %>
          <option value="<%=i[0]%>"><%=i[2]%></option>
          <%
              }
            }catch (Exception e) {
              e.printStackTrace();
            }
          %>
        </select><br>

        <label for="Vehicle">Select Vehicle:</label>
        <select name="Vehicle_Id" id="Vehicle" required>
          <%
            try{
              ArrayList<String[]> results2 = vehicleTable.select("*","Registered_Client_Id="+id);
              for (String[] j : results2){
          %>
            <option value="<%=j[0]%>"><%=j[4]%></option>
          <%
              }
            } catch (Exception e) {
              e.printStackTrace();
            }
          %>
        </select><br>


        <label for="Date">Select Convenient Date:</label>
        <input name="Date" type="date" min="" max="" placeholder="Date" id="date" required><br>
        <label for="Time">Select Convenient Time:</label>
        <input name="Time" type="time" placeholder="Time" id="time" min="08:00:00" max="16:00:00" step="7200" required><br>
        <div style="color:red" id="err"></div>
        <%
          String msg=request.getParameter("message");
          if(msg==null){
            msg="";
          }
        %>
        <h4 style="color: #EE534F"><%=msg%></h4>
        <input type="submit" value="Done" class="button">
      </form>
    </div>
    </div>
</div>


<footer class="footer">
  <div class="center"><img src="../../Assets/SerWise.png" class="logo"></div>
  <div class="center"><a href="#"> Contact Us </a> &nbsp|
    &nbsp<a href="#"> About Us </a> &nbsp|
    &nbsp <a href="#"> Legal Stuff </a></div>
  <div class="center">All Rights Recieved</div>
</footer>
<script src="/SerWise_war/RegisteredClient/RegisteredClientHeader.js"></script>
<script>
  const today = new Date();
  const minDate = new Date(today.getFullYear(),today.getMonth(),today.getDate()+1);
  const maxDate = new Date(today.getFullYear(),today.getMonth()+3,today.getDate());

  // set the minimum and maximum values of the input element
  document.getElementById("date").setAttribute("min", minDate.toISOString().slice(0,10));
  document.getElementById("date").setAttribute("max", maxDate.toISOString().slice(0,10));
</script>
</body>
</html>
