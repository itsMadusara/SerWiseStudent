<%--
  Created by IntelliJ IDEA.
  User: Thamira Weerakoon
  Date: 2/5/2023
  Time: 8:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.CS01.SerWise.Controllers.inventoryItemBranchTable" %>
<%@ page import="java.sql.SQLException" %>
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
    <link rel="stylesheet" href="../CSS/table.css">
    <link rel="stylesheet" href="../CSS/popup.css">
    <link rel="stylesheet" href="../CSS/content.css">
    <title>Document</title>
</head>
<body>
<%
    if (session.getAttribute("auth")==null){
        response.sendRedirect("/SerWise_war/Login/login.html");
    }
%>

<div id="blur" class="back_g">
    <header class="navigation"></header>

    <div>
        <div class="single-content-div center title">
            Search By Item Number :
            <form action="searchInventory.jsp" method="post">
                <input type="number" name="iId" placeholder="Item Number" required>
                <input type="submit" value="Search" class="button">
            </form>
            <div style="color:red" id="err"></div>
            <%
                String msg=request.getParameter("message");
                if(msg==null){
                    msg="";
                }
            %>
            <br><h4 style="color: #EE534F"><%=msg%></h4>
        </div>
        <div class="single-content-div center title">
            <span class="title">SerWice</span><span class="subtitle">:&MediumSpace;Branch Inventory</span>
        </div>

        <div class="form-display-table glass">
            <table>
                <tr>
                    <th>Item No</th>
                    <th>Batch No</th>
                    <th>Quantity</th>
                    <th>Handling Time</th>
                    <th colspan="3">Manage Inventory</th>
                </tr>

                <%
                    int branchId=Integer.parseInt(session.getAttribute("branchId").toString());
                    try{
                        ArrayList<String[]> results1 = inventoryItemBranchTable.select("Inventory_Item_Id,batchNo,quantity,handling_time","Branch_Id="+branchId);
                        for (String[] i : results1){
                %>
                <tr>
                    <td><%=i[0]%></td>
                    <td><%=i[1]%></td>
                    <td><%=i[2]%></td>
                    <td><%=i[3]%></td>
                    <td><form method="post" action="addStock.jsp">
                        <input type="submit" value="Add Stock" class="button"/>
                        <input type = "hidden" name="Item_Id" value="<%=i[0] %>" class="button" />
                        <input type = "hidden" name="batchNo" value="<%=i[1] %>" class="button" />
                    </form></td>
                    <td><form method="post" action="updateHT.jsp">
                        <input type="submit" value="Update Handling Time" class="button"/>
                        <input type = "hidden" name="Item_Id" value="<%=i[0] %>" class="button" />
                        <input type = "hidden" name="batchNo" value="<%=i[1] %>" class="button" />
                    </form></td>
                    <td><form method="post" action="addNewBatch.jsp">
                        <input type="submit" value="Add New Batch" class="button"/>
                        <input type = "hidden" name="Item_Id" value="<%=i[0] %>" class="button" />
                        <input type = "hidden" name="batchNo" value="<%=i[1] %>" class="button" />
                    </form></td>
                </tr>
                <%
                        }
                    } catch (SQLException | ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }
                %>
            </table>
        </div>
    </div>
</div>


<footer class="footer"></footer>
<script src="/SerWise_war/StoreKeeper/StoreKeeperHeader.js"></script>
<script src="/SerWise_war/footer.js"></script>
</body>
</html>
