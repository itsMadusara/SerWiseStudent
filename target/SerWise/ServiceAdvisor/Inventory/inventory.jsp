<%@ page import="java.sql.Connection" %>
<%@ page import="com.CS01.SerWise.Services.DatabaseConnection" %>
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
    <link rel="stylesheet" href="/SerWise_war/ServiceAdvisor/CSS/table.css">
    <link rel="stylesheet" href="/SerWise_war/ServiceAdvisor/CSS/popup.css">
    <title>Document</title>
</head>
<body>

<%
    if (session.getAttribute("auth")==null){
        response.sendRedirect("/SerWise_war/Login/login.html");
    }
    else {
        if (!session.getAttribute("auth").toString().equals("3")) {
            out.println("invalid authentication");
            out.println(session.getAttribute("auth"));
        }
    }
%>

<div id="blur" class="back_g">
    <header class="navigation">
        <img src="/SerWise_war/Assets/SerWise.png" class="navimg">
        <table>
            <tr>
                <td><a href="/SerWise_war/ServiceAdvisor/Home.jsp">Home</a></td>
                <td><a href="/SerWise_war/BranchInventoryList?b_Id=<%out.println(session.getAttribute("branchId"));%>" style="color:#EE534F">Inventory</a></td>
                <td><a href="/SerWise_war/BranchAppointmentList?b_Id=<%out.println(session.getAttribute("branchId"));%>">Appointment</a></td>
                <td><a href="/SerWise_war/ServiceAdvisor/Job/job.jsp">Jobs</a></td>
                <td><a href="/SerWise_war/GetSlotList?b_Id=<%out.println(session.getAttribute("branchId"));%>">Slots</a></td>
                <td><a href="/SerWise_war/ServletLogout"><button class="button">Logout</button></a></td>
            </tr>
        </table>
    </header>

    <div>

        <div class="single-content-div center title">
            <span class="title">SerWice &MediumSpace;</span> <span class="subtitle"> - &MediumSpace; View Inventory</span>
        </div>

        <div class="single-content-div center title">
            Search By Item name : &MediumSpace;
            <form>
                <input type="text" placeholder="Employee ID">
                &MediumSpace;
                <input type="submit" value="Search" class="button">
            </form>
        </div>

        <div class="center form-display-table">
            <table id="tablej">
                <tr>
                    <th>Item ID</th>
                    <th>Name</th>
                    <th>Measurement</th>
                    <th>Batch No</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
                <%
                    int noOfRows = (int) request.getAttribute("noOfRows");
                    int i = 0;
                    while (i<noOfRows){
                        out.println("<tr>");
                        out.println("<td>");
                        out.println(request.getAttribute("ItemID"+i).toString());
                        out.println("</td>");
                        out.println("<td>");
                        out.println(request.getAttribute("ItemName"+i).toString());
                        out.println("</td>");
                        out.println("<td>");
                        out.println(request.getAttribute("Measure"+i).toString());
                        out.println("</td>");
                        out.println("<td>");
                        out.println(request.getAttribute("Batch_No"+i).toString());
                        out.println("</td>");
                        out.println("<td>");
                        out.println(request.getAttribute("Qtt"+i).toString());
                        out.println("</td>");
                        out.println("<td>");
                        out.println(request.getAttribute("Price"+i).toString());
                        out.println("</td>");
                        out.println("</tr>");
                        i=i+1;
                    }
                %>
            </table>
        </div>
    </div>
</div>

<script src="/SerWise_war/ServiceAdvisor/JS/getfreeslot.js">
    //fetching free slots...
</script>

<footer class="footer">
    <div class="center"><img src="/SerWise_war/Assets/SerWise.png" class="logo"></div>
    <div class="center"><a href="#"> Contact Us </a> &nbsp|
        &nbsp<a href="#"> About Us </a> &nbsp|
        &nbsp <a href="#"> Legal Stuff </a></div>
    <div class="center">All Rights Recieved</div>
</footer>
</body>
</html>