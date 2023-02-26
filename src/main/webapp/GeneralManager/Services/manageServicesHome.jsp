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


    <div class="single-content-div center title">
        <span class="title">SerWice &MediumSpace;</span> <span class="subtitle"> - &MediumSpace; Manage Inventory Items</span>
    </div>
    <div class="single-content-div center title">
        Search By Name : &MediumSpace; 
        <form>
            <input type="text" placeholder="Item Name">
            &MediumSpace;
            <input type="submit" value="Search" class="button">
        </form>
    </div>

    <div class="form-display-table glass">
        <table>
            <tr>
                <th>Service ID</th>
                <th>Service Name</th>
                <th>Price</th>
                <th>Time Spend</th>
                <th>Items Need</th>
                <th>Branch ID</th>
                <th colspan="2">Manage Options</th>
            </tr>
            <tr>
                <td>001</td>
                <td>Tyre Change</td>
                <td>Rs. 40000.00</td>
                <td>20mins</td>
                <td>Tyres</td>
                <td>001</td>
                <td><button class="button">Update</button></td>
                <td><button class="button">Remove</button></td>
            </tr>
        </table>
    </div>


    <footer class="footer">
        <div class="center"><img src="/SerWise_war/Assets/SerWise.png" class="logo"></div>
        <div class="center"><a href="#"> Contact Us </a> &nbsp| 
            &nbsp<a href="#"> About Us </a> &nbsp|
            &nbsp <a href="#"> Legal Stuff </a></div>
        <div class="center">All Rights Recieved</div>
    </footer>
    <script src="/SerWise_war/GeneralManager/GeneralManagerHeader.js"></script>
</body>
</html>