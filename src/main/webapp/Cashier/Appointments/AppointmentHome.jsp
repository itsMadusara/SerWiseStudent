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
    <header class="navigation"></header>

    <div class="single-content-div center title">
        <span class="title">SerWice &MediumSpace;</span> <span class="subtitle"> - &MediumSpace; View Appointments</span>
    </div>
    <div class="single-content-div center title">
        Search By Appointment ID : &MediumSpace; 
        <form>
            <input type="text" placeholder="Employee ID">
            &MediumSpace;
            <input type="submit" value="Search" class="button">
        </form>
    </div>

    <div class="form-display-table glass">
        <table>
            <tr>
                <th>Appointment ID</th>
                <th>Date</th>
                <th>Slot Number</th>
                <th>Time</th>
                <th>Manage Option</th>
            </tr>
            <tr>
                <td>001</td>
                <td>10/01/2022</td>
                <td>05</td>
                <td>10:00 AM</td>
                <td><a href="/SerWise_war/Cashier/Appointments/GetPayment.jsp"><button class="button">Get Payment</button></a></td>
            </tr>
        </table>
    </div>


    <footer class="footer">
        <div class="center"><img src="../../Assets/SerWise.png" class="logo"></div>
        <div class="center"><a href="#"> Contact Us </a> &nbsp| 
            &nbsp<a href="#"> About Us </a> &nbsp|
            &nbsp <a href="#"> Legal Stuff </a></div>
        <div class="center">All Rights Recieved</div>
    </footer>
    <script src="/SerWise_war/Cashier/CashierHeader.js"></script>
</body>
</html>