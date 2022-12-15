<%--
  Created by IntelliJ IDEA.
  User: Thamira Weerakoon
  Date: 12/3/2022
  Time: 7:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%
  HttpSession session1=request.getSession();
  int id=(Integer)session1.getAttribute("uid");
  String driver = "com.mysql.jdbc.Driver";
  String connectionUrl = "jdbc:mysql://localhost:3305/";
  String database = "serwise";
  String userid = "root";
  String password = "";
  try {
    Class.forName(driver);
  } catch (ClassNotFoundException e) {
    e.printStackTrace();
  }
  Connection connection = null;
  Statement statement = null;
  ResultSet resultSet = null;
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
    response.sendRedirect("../../Login/login.jsp");
  }
%>
<header class="navigation">
  <img src="../../Assets/SerWise.png" class="navimg">
  <table>
    <tr>
      <td><a href="../Home/home.jsp ">Home</a></td>
      <td><a href="../Services/services.jsp">Services</a></td>
      <td><a href="../Appointments/appointments.jsp">Appointments</a></td>
      <td><a href="../Vehicles/vehicles.jsp">Vehicles</a></td>
      <td><a href="../Profile/profile..jsp">Profile</a></td>
      <td><a href="../../ServletLogout"><button class="button">Logout</button></a></td>
    </tr>
  </table>
</header>

<div class="single-content-div title center">
  <div>
    <span class="title">Select Vehicle</span><br>
  </div>
</div>



<div class="two-content-div">
  <div class="colomn-content-div">
    <%
      try{
        connection = DriverManager.getConnection(connectionUrl+database, userid, password);
        statement=connection.createStatement();
        PreparedStatement ps1=connection.prepareStatement("select * from serwise.vehicle where Registered_Client_Id=?");
        ps1.setInt(1,id);
        resultSet = ps1.executeQuery();
        while(resultSet.next()){
    %>
    <div>
      <span class="subtitle"><%=resultSet.getString("Reg_No") %></span>
    </div>
    <%
        }
        connection.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>
  </div>
  <div class="colomn-content-div">
    <%
      try{
        connection = DriverManager.getConnection(connectionUrl+database, userid, password);
        statement=connection.createStatement();
        PreparedStatement ps1=connection.prepareStatement("select * from serwise.vehicle where Registered_Client_Id=?");
        ps1.setInt(1,id);
        resultSet = ps1.executeQuery();
        while(resultSet.next()){
    %>
    <div>
      <form method="post" action="viewVehicle.jsp">
        <input type="submit" value="View Details" class="button"/>
        <input type = "hidden" name="Vehicle_Id" value="<%=resultSet.getInt("Vehicle_Id") %>" class="button" />
      </form>
    </div>
    <%
        }
        connection.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>
  </div>
</div>


<footer class="footer">
  <div class="center"><img src="../../Assets/SerWise.png" class="logo"></div>
  <div class="center"><a href="#"> Contact Us </a> &nbsp|
    &nbsp<a href="#"> About Us </a> &nbsp|
    &nbsp <a href="#"> Legal Stuff </a></div>
  <div class="center">All Rights Recieved</div>
</footer>
</body>
</html>