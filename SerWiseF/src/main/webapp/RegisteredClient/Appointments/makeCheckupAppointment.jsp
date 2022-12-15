<%--
  Created by IntelliJ IDEA.
  User: Thamira Weerakoon
  Date: 12/5/2022
  Time: 5:51 AM
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

<div class="two-content-div">
    <div>
        <span class="title">SerWise</span><br>
        <span>Check Up Appointments</span>
    </div>
    <div>
        <div class="two-content-div-form">
            <span class="subtitle">Appointments</span>
            <form action="../../ServletAddCheckupAppointment" method="post">
                <label for="Branch">Select Branch:</label>
                <select name="Branch_Id" id="Branch">
                        <%
                            try{
                            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                            statement=connection.createStatement();
                            PreparedStatement ps1=connection.prepareStatement("select * from serwise.branch");
                            resultSet = ps1.executeQuery();
                            while(resultSet.next()){
                            %>
                                <option value="<%=resultSet.getString("Branch_Id")%>"><%=resultSet.getString("Location")%></option>
                            <%
                            }
                            connection.close();
                            } catch (Exception e) {
                            e.printStackTrace();
                            }
                        %>
                </select><br>
                <label for="Vehicle">Select Vehicle:</label>
                <select name="Vehicle_Id" id="Vehicle">
                        <%
                            try{
                            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                            statement=connection.createStatement();
                            PreparedStatement ps1=connection.prepareStatement("select * from serwise.vehicle where Registered_Client_Id=?");
                            ps1.setInt(1,id);
                            resultSet = ps1.executeQuery();
                            while(resultSet.next()){
                            %>
                                <option value="<%=resultSet.getString("Vehicle_Id")%>"><%=resultSet.getString("Reg_No")%></option>
                            <%
                            }
                            connection.close();
                            } catch (Exception e) {
                            e.printStackTrace();
                            }
                        %>
                </select><br>
                <input name="Date" type="date" placeholder="Date" id="date" min="" max="" required><br>
                <input name="Time" type="time" placeholder="Time" id="time" min="08:00:00" max="17:00:00" required><br>
                <input type="submit" value="Create" class="button">
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
</body>
<script>
    date=new Date();
    year=date.getFullYear();
    month=date.getMonth()+1;
    fmonth=date.getMonth()+4;
    day=date.getDate();

    today = year + '-' + month + '-' + day;
    end = year + '-' + fmonth + '-' + day;

    document.getElementById("date").setAttribute("min", today);
    document.getElementById("date").setAttribute("max", end);
    console.log(today);
</script>
</html>