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
    <header class="navigation"></header>

    <div class="single-content-div center title">
        <span class="title">SerWice &MediumSpace;</span> <span class="subtitle"> - &MediumSpace; View Done Jobs</span>
    </div>
    <div class="single-content-div center title">
        Search By Vehicle ID : &MediumSpace;
        <form>
            <input type="text" id="vehicleIdInput" placeholder="Vehicle ID">
            &MediumSpace;
            <input type="submit" value="Search" class="button" disabled>
        </form>
    </div>

    <div class="form-display-table glass">
        <table id="jobTable">
            <tr>
                <th>Vehicle No.</th>
                <th>Date</th>
                <th>Slot Number</th>
                <th>Manage Option</th>
            </tr>
            <%
                int noOfRows = (int) request.getAttribute("noOfRows");
                int i = 0;
                if(noOfRows==0){
                    out.println("<tr>");
                    out.println("<td colspan='4'>");
                    out.println("There are no jobs that are done and not billed.");
                    out.println("</td>");
                    out.println("</tr>");
                } else {
                    while (i < noOfRows) {
                        out.println("<tr>");
                        out.println("<td>");
                        out.println(request.getAttribute("Vehicle_Id" + i));
                        out.println("</td>");
                        out.println("<td>");
                        out.println(request.getAttribute("Date" + i));
                        out.println("</td>");
                        out.println("<td>");
                        out.println(request.getAttribute("Slot" + i));
                        out.println("</td>");
                        out.println("<td>");
                        out.println("<a href='/SerWise_war/calculateInvoice?jobId="+request.getAttribute("Job_Id"+i)+"'><button class='button'>Update</button></a>");
                        out.println("</td>");
                        out.println("</tr>");
                        i = i + 1;
                    }
                }
            %>
        </table>
    </div>


    <footer class="footer"></footer>
    <script src="/SerWise_war/Cashier/CashierHeader.js"></script>
    <script src="/SerWise_war/Cashier/Appointments/appointmentHome.js"></script>
    <script src="/SerWise_war/footer.js"></script>
</body>
</html>