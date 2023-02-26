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
            <form method="post" action="/SerWise_war/addemployee">
                <input type="text" name="firstName" pattern="[A-Za-z]+" placeholder="First Name" required><br>
                <input type="text" name="lastName" pattern="[A-Za-z]+" placeholder="Last Name" required><br>
                <input type="text" name="contact" pattern="(07)[0-9]{8}" placeholder="Contact Number" required><br>
                <input type="text" name="address" placeholder="Address (Home)" required><br>
                <input type="text" name="city" pattern="[A-Za-z0-1]+" placeholder="City" required><br>
                <input type="text" name="BranchID" pattern="[0-9]+" placeholder="Branch ID" required><br>
                <input type="date" name="date" required><br>
                <select name="role" class="drop-down-list" required>
                    <option value="2">General Manager</option>
                    <option value="4">Branch Manager</option>
                    <option value="3">Serwise Advisor</option>
                </select><br>
                <input type="text" name="employeeID" pattern="[0-9]+" placeholder="Employee ID" required><br>
                <input type="email" name="email" placeholder="Email" required><br>
                <input type="password" name="password" placeholder="Password" required><br>
                <button type="submit" class="button">Add Employee</button><br>
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