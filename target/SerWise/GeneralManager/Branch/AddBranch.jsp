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


    <div class="two-content-div glass">
        <div>
            <span class="title">SerWise</span><br>
            <span class="subtitle">Manage Branches</span>
        </div>
        <div class="two-content-div-form">
            <form method="post" action="/SerWise_war/addbranch">
<%--                <input type="text" name="branchID" pattern="[0-9]+" placeholder="Branch ID" required><br>--%>
                <input type="text" name="location" pattern="([A-Z])[A-Za-z0-9' ']+" placeholder="Branch Location (City)" required><br>
                <input type="text" name="address" placeholder="Address" required><br>
                <input type="number" name="noOfSlots" pattern="[0-9]+" min="2" placeholder="No of Slots" required><br>
<%--                <input type="text" name="branchManagerID" id="branchManagerId" pattern="[0-9]+" placeholder="Branch Manager ID"><br>--%>
                <button type="submit" id="addBranchBtn" class="button">Add Branch</button><br>
            </form>
        </div>
    </div>


    <footer class="footer"></footer>

    <script src="/SerWise_war/GeneralManager/GeneralManagerHeader.js"></script>
    <script src="/SerWise_war/GeneralManager/Branch/addBranchManager.js"></script>
    <script src="/SerWise_war/footer.js"></script>
</body>
</html>