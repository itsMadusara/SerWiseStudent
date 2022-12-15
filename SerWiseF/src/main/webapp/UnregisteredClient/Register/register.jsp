<%--
  Created by IntelliJ IDEA.
  User: Thamira Weerakoon
  Date: 11/22/2022
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Document</title>
    <script>
        function validate(){
            if(document.rform.Fname.value==="") {
                document.getElementById("err").innerHTML="Enter Fist Name";
                return false;
            }else if(document.rform.Lname.value===""){
                document.getElementById("err").innerHTML="Enter Last Name";
                return false;
            }else if(document.rform.Contact.value===""){
                document.getElementById("err").innerHTML="Enter Contact Number";
                return false;
            }else if(document.rform.Email.value===""){
                document.getElementById("err").innerHTML="Enter Email Address";
                return false;
            }else if(document.rform.pswd.value===""){
                document.getElementById("err").innerHTML="Enter Password";
                return false;
            }else if(document.rform.Contact.value.length<10){
                document.getElementById("err").innerHTML="Please Check Contact Number";
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<header class="navigation">
    <img src="../../Assets/SerWise.png" class="navimg">
    <table>
        <tr>
            <td><a href="../../Home/home.html">Home</a></td>
            <td><a href="../Services/services.html">Services</a></td>
            <td><a href="#">Register</a></td>
            <td><a href="../../Login/login.html"><button class="button">Login</button></a></td>
        </tr>
    </table>
</header>


<div class="two-content-div">
    <div class="two-content-div-one">
        <span class="title">SerWise</span><br>
        <span>Register</span>
    </div>
    <div class="two-content-div-form">
        <span class="subtitle">Register</span>
        <form name="rform" action="../../ServletRegister" method="post">
            <input type="text" name="Fname" placeholder="First Name" required><br>
            <input type="text" name="Lname" placeholder="Last Name" required><br>
            <input type="tel" name="Contact" pattern="[0-9]{10}" placeholder="Contact" required><br>
            <input type="email" name="Email" placeholder="Email" required><br>
            <input type="password" name="pswd" pattern="{8,}" id="password" placeholder="Password" required><br>
            <div id="err"></div>
            <h4 style="color: #EE534F"><%= request.getParameter("message") %></h4>
            <input type="submit" value="Register" onclick=return validate()" class="button">
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
</body>
</html>