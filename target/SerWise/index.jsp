<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/content.css">
    <link rel="stylesheet" href="CSS/navigation.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="CSS/backgrount.css">
    <title>Document</title>
</head>
<body>
<%
    if(session.getAttribute("uid")!=null){
        session.invalidate();
        response.sendRedirect("index.jsp");
    }
%>
<header class="navigation">
    <img src="Assets/SerWise.png" class="navimg">
    <table>
        <tr>
            <td><a href="#">Home</a></td>
            <td><a href="UnregisteredClient/Services/selectBranch.jsp">Services</a></td>
            <td><a href="UnregisteredClient/Register/register.jsp">Register</a></td>
            <td><a href="Login/login.jsp"><button class="button">Login</button></a></td>
        </tr>
    </table>
</header>


<div class="home-first-content">
    <div>
        <span class="title">SerWise</span><br>
        <span>We Care About Your Vehicle</span><br>
        <a href="UnregisteredClient/Register/register.jsp"><button class="button">Join Now</button></a>
    </div>
</div>

<div class="two-content-div glass">
    <div class="two-content-div-one">
        <span class="title">Friendly Service <br> Guaranteed</span><br>
    </div>
    <div class="two-content-div-form">
        <span class="subtitle">Contact Us</span>
        <form>
            <input type="text" placeholder="First Name"><br>
            <input type="text" placeholder="Last Name"><br>
            <input type="text" placeholder="Email"><br>
            <input type="submit" value="Contact" class="button">
        </form>
    </div>
</div>

<div class="two-content-div glass">
    <div>
        <img src="Assets/HomeLastContentDiv.jpg" class="content-div-img">
    </div>
    <div>
        <span class="title">Best service in Sri Lanka</span><br>
        <span>We have employed skilled technicians and mechanics who are trained to diagnose and fix various mechanical, electrical, and technical issues in vehicles.These professionals use specialized tools, equipment, and diagnostic technology to identify problems and perform repairs effectively.</span>
    </div>
</div>

<footer class="footer"></footer>

<script src="/SerWise_war/footer.js"></script>
</body>
</html>