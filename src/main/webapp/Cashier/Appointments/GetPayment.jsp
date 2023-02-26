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

    <div class="single-content-div title">
        <div>
            <span class="title">Services</span><br>
            <span class="subtitle">Get Payment</span>
        </div>
    </div>

    <div class="two-content-div glass">
        <div class="receipt-table">
            <table>
                <tr>
                    <th>Item</th>
                    <th>QTY</th>
                    <th>Price</th>
                </tr>
                <tr>
                    <td>Oil 15-30W</td>
                    <td>5L</td>
                    <td>12500.00</td>
                </tr>
                <tr>
                    <td>Oil Filter</td>
                    <td>1</td>
                    <td>1800.00</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td class="total">14300.00</td>
                </tr>
            </table>
        </div>
        <div class="two-content-div-form">
            <form method="post">
                <span>Amount</span>
                <input type="text" name="firstName" placeholder="Amount"><br>
                <span>Payment</span>
                <input type="text" name="lastName" placeholder="Paid"><br>
                <span>Balance</span>
                <input type="text" name="contact" placeholder="Balance"><br>
                <button type="submit" class="button">Get Bill</button><br>
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
    <script src="/SerWise_war/Cashier/CashierHeader.js"></script>
</body>
</html>