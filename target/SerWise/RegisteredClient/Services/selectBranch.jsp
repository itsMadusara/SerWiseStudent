<%--
  Created by IntelliJ IDEA.
  User: Thamira Weerakoon
  Date: 4/18/2023
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.CS01.SerWise.Controllers.branchTable" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
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
    if (session.getAttribute("uid")==null){
        response.sendRedirect("../../Login/login.html");
    }
%>
<header class="navigation"></header>

<div class="single-content-div title">
    <div>
        <span class="title">Branches</span><br>
        <span class="subtitle">Please Select a Branch:</span>
    </div>
</div>

<div class="two-content-div glass">
    <%
        try{
            ArrayList<String[]> results = branchTable.select();
            int noOfResults = results.size();
    %>
    <div class="colomn-content-div">
        <%
            for (int i = 0; i<noOfResults ;i=i+2){
                out.println("<div class='subtitle center'>");
                out.println("<span class=\"subtitle\">"+results.get(i)[2]+"</span><br>");
                out.println("&emsp;");
                out.println("<form method=\"post\" action=\"viewServices.jsp\">");
                out.println("<input type=\"submit\" value=\"View Services\" class=\"button\"/>");
                out.println("<input type = \"hidden\" name=\"Branch_Id\" value=\""+results.get(i)[0]+"\" class=\"button\" />");
                out.println("</form>");
                out.println("</div>");
            }
        %>
    </div>
    <div class="colomn-content-div">
        <%
            for (int i = 1; i<noOfResults ;i=i+2){
                out.println("<div class='subtitle center'>");
                out.println("<span class=\"subtitle\">"+results.get(i)[2]+"</span><br>");
                out.println("&emsp;");
                out.println("<form method=\"post\" action=\"viewServices.jsp\">");
                out.println("<input type=\"submit\" value=\"View Services\" class=\"button\"/>");
                out.println("<input type = \"hidden\" name=\"Branch_Id\" value=\""+results.get(i)[0]+"\" class=\"button\" />");
                out.println("</form>");
                out.println("</div>");
            }
        %>
    </div>
        <%
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        %>
</div>

<%--<div class="two-content-div">--%>
<%--    <div>--%>
<%--        <%--%>
<%--            try{--%>
<%--                ArrayList<String[]> results = branchTable.select();--%>
<%--                for (String[] i : results){--%>
<%--        %>--%>
<%--        <div>--%>
<%--            <span class="subtitle"><%=i[2]%></span><br>--%>
<%--            <form method="post" action="viewServices.jsp">--%>
<%--                <input type="submit" value="View Services" class="button"/>--%>
<%--                <input type = "hidden" name="Branch_Id" value="<%=i[0] %>" class="button" />--%>
<%--            </form>--%>
<%--        </div>--%>
<%--        <%--%>
<%--                }--%>
<%--            } catch (SQLException | ClassNotFoundException e) {--%>
<%--                throw new RuntimeException(e);--%>
<%--            }--%>
<%--        %>--%>
<%--    </div>--%>
<%--</div>--%>


<footer class="footer"></footer>

<script src="/SerWise_war/RegisteredClient/RegisteredClientHeader.js"></script>
<script src="/SerWise_war/footer.js"></script>
</body>
</html>