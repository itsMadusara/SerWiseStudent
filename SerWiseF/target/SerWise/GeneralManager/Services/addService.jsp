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
<%--    <%--%>
<%--        if (session.getAttribute("auth")==null){--%>
<%--            response.sendRedirect("/Login/login.html");--%>
<%--        }--%>
<%--        else {--%>
<%--            if (!session.getAttribute("auth").toString().equals("GM")) {--%>
<%--                out.println("invalid authentication");--%>
<%--                out.println(session.getAttribute("auth"));--%>
<%--            }--%>
<%--        }--%>
<%--    %>--%>
    <header class="navigation"></header>


    <div class="two-content-div glass">
        <div>
            <span class="title">SerWise</span><br>
            <span class="subtitle">Add Inventory Item</span>
        </div>
        <div class="two-content-div-form">
            <form method="post">
                <input type="text" name="serviceID" placeholder="Service ID"><br>
                <input type="text" name="serviceName" placeholder="Service Name"><br>
                <input type="text" name="price" placeholder="Service Price in Rs."><br>
                <input type="text" name="timeSpend" placeholder="Time Spend In Mins"><br>
                <input type="text" name="branchID[]" placeholder="Available Branch ID"><br>
                <input type="submit" class="button" value="Add Item"> &MediumSpace;
<!--                <button class="button" id="addBranches" onclick="addFields()">Add Branch</button> &MediumSpace;-->
<!--                <button class="button" id="addBranches" onclick="addFields()">Add Item</button>-->

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