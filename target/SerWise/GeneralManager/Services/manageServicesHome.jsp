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
        <span class="title">SerWise &MediumSpace;</span> <span class="subtitle"> - &MediumSpace; Manage Services</span>
    </div>
    <div class="single-content-div center title">
        Search By Name : &MediumSpace; 
        <form>
            <input id="nameInput" type="text" placeholder="Item Name">
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
                <th>Time Spend in Mins.</th>
                <th colspan="2">Manage Options</th>
            </tr>
            <%
                int noOfRows = (int) request.getAttribute("noOfRows");
                int i = 0;
                while (i<noOfRows){
                    out.println("<tr>");
                    out.println("<td>");
                    String serviceId = request.getAttribute("serviceID"+i).toString();
                    out.println(serviceId);
                    out.println("</td>");
                    out.println("<td>");
                    out.println(request.getAttribute("name"+i));
                    out.println("</td>");
                    out.println("<td>");
                    out.println("Rs.");
                    out.println(request.getAttribute("price"+i));
                    out.println("</td>");
                    out.println("<td>");
                    out.println(request.getAttribute("time"+i));
                    out.println("</td>");
                    out.println("<td>");
                    out.println("<a href='/SerWise_war/updateService?ServiceId="+serviceId+"'><button class='button'>Update</button></a>");
                    out.println("</td>");
                    out.println("<td>");
                    out.println("<a href='/SerWise_war/deleteService?ServiceId="+serviceId+"'><button class='button'>Remove</button></a>");
                    out.println("</td>");
                    out.println("</tr>");
                    i=i+1;
                }
            %>
        </table>
    </div>


    <footer class="footer"></footer>

    <script src="/SerWise_war/GeneralManager/GeneralManagerHeader.js"></script>
    <script src="/SerWise_war/GeneralManager/Services/serviceList.js"></script>
    <script src="/SerWise_war/footer.js"></script>
</body>
</html>