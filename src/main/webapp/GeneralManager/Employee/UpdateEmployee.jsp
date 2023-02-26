<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/SerWise_war/CSS/content.css">
    <link rel="stylesheet" href="/SerWise_war/CSS/navigation.css">
    <link rel="stylesheet" href="/SerWise_war/CSS/footer.css">
    <link rel="stylesheet" href="/SerWise_war/CSS/backgrount.css">
    <title>Document</title>
</head>
<body>
<%
    if (session.getAttribute("auth")==null){
        response.sendRedirect("/SerWise_war/Login/login.html");
    }
    else {
        if (!session.getAttribute("auth").toString().equals("2")) {
            out.println("invalid authentication");
            out.println(session.getAttribute("auth"));
        }
    }
%>
<header class="navigation"></header>


<div class="two-content-div">
    <div>
        <span class="title">SerWise</span><br>
        <span class="subtitle">Add Employee</span>
    </div>
    <div class="two-content-div-form">
        <form method="post" action="/SerWise_war/updateEmployeeDetails">
            <input type="text" name="employeeID" placeholder="Employee ID" value="<%out.print(request.getAttribute("EmployeeID"));%>" readonly><br>
            <input type="text" name="firstName" placeholder="First Name" value="<%out.print(request.getAttribute("FirstName"));%>"><br>
            <input type="text" name="lastName" placeholder="Last Name" value="<%out.print(request.getAttribute("LastName"));%>"><br>
            <input type="text" name="contact" placeholder="Contact Number" value="<%out.print(request.getAttribute("Contact"));%>"><br>
            <input type="text" name="address" placeholder="Address (Home)" value="<%out.print(request.getAttribute("Address"));%>"><br>
            <input type="text" name="city" placeholder="City" value="<%out.print(request.getAttribute("Address"));%>"><br>
            <input type="text" name="BranchID" placeholder="Branch ID" value="<%out.print(request.getAttribute("BranchID"));%>"><br>
            <input type="date" name="date" value="<%out.print(request.getAttribute("JoinedDate"));%>"><br>
            <input type="text" name="role" placeholder="Role" value="dummy value"><br>
            <button type="submit" class="button">Update Employee</button><br>
        </form>
    </div>
</div>


<footer class="footer">
    <div class="center"><img src="../../Assets/SerWise.png" class="logo"></div>
    <div class="center"><a href="#"> Contact Us </a> &nbsp|
        &nbsp<a href="#"> About Us </a> &nbsp|
        &nbsp <a href="#"> Legal Stuff </a></div>
    <div class="center">All Rights Recieved</div>
</footer>
<script src="/SerWise_war/GeneralManager/GeneralManagerHeader.js"></script>
</body>
</html>