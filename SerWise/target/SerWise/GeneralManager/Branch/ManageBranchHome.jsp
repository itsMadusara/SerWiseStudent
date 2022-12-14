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
        if (session.getAttribute("auth")==null){
            response.sendRedirect("/Login/login.html");
        }
        else {
            if (!session.getAttribute("auth").toString().equals("GM")) {
                out.println("invalid authentication");
                out.println(session.getAttribute("auth"));
            }
        }
    %>
    <header class="navigation"></header>


    <div class="single-content-div center title">
        <span class="title">SerWice &MediumSpace;</span> <span class="subtitle"> - &MediumSpace; Manage Branch</span>
    </div>
    <div class="single-content-div center title">
        Search By Branch ID : &MediumSpace; 
        <form>
            <input type="text" placeholder="Branch ID" name="branchID">
            &MediumSpace;
            <input type="submit" value="Search" class="button">
        </form>
    </div>

    <div class="form-display-table glass">
        <table>
            <tr>
                <th>Branch ID</th>
                <th>Location</th>
                <th>No of Slots</th>
                <th>Branch Manager</th>
                <th colspan="2">Manage Options</th>
            </tr>
            <%
                int noOfRows = (int) request.getAttribute("noOfRows");
                int i = 0;
                while (i<noOfRows){
                    out.println("<tr>");
                    out.println("<td>");
                    String bid = request.getAttribute("branchID"+i).toString();
                    out.println(bid);
                    out.println("</td>");
                    out.println("<td>");
                    out.println(request.getAttribute("location"+i));
                    out.println("</td>");
                    out.println("<td>");
                    out.println(request.getAttribute("noOfSlots"+i));
                    out.println("</td>");
                    out.println("<td>");
                    out.println("Dummy");
                    out.println("</td>");
                    out.println("<td>");
                    out.println("<a href='/updateBranch?bid="+bid+"'><button class='button'>Update</button></a>");
                    out.println("</td>");
                    out.println("<td>");
                    out.println("<a href='/deleteBranch?bid="+bid+"'><button class='button'>Remove</button></a>");
                    out.println("</td>");
                    out.println("</tr>");
                    i=i+1;
                }
            %>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>001</td>--%>
<%--                <td>Colombo</td>--%>
<%--                <td>5</td>--%>
<%--                <td>002</td>--%>
<%--                <td><button class="button">Update</button></td>--%>
<%--                <td><button class="button">Remove</button></td>--%>
<%--            </tr>--%>
        </table>
    </div>


    <footer class="footer">
        <div class="center"><img src="../../Assets/SerWise.png" class="logo"></div>
        <div class="center"><a href="#"> Contact Us </a> &nbsp| 
            &nbsp<a href="#"> About Us </a> &nbsp|
            &nbsp <a href="#"> Legal Stuff </a></div>
        <div class="center">All Rights Recieved</div>
    </footer>
    <script src="GeneralManager/GeneralManagerHeader.js"></script>
</body>
</html>