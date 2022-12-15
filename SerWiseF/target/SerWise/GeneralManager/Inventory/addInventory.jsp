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
            <form method="post" action="/SerWise_war/addinventory">
                <input type="text" name="itemID" placeholder="Item ID"><br>
                <input type="text" name="itemName" placeholder="Item Name"><br>
                <select name="measurement">
                    <option value="Liters">Liters</option>
                    <option value="Units">No of Units</option>
                    <option value="Kilograms">Kilograms</option>
                </select><br>
                <input type="text" name="price" placeholder="Price Per Unit (Rs.)"><br>
                <input type="submit" class="button" value="Add Item"> <br>
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