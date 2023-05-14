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


    <div class="home-first-content">
        <div>
            <span class="title">SerWise</span><br>
            <span>We Care About Your Vehicle</span><br>
        </div>
    </div>

    <div class="two-content-div glass">
        <div class="two-content-div-one">
            <span class="title">Friendly Service <br> Guaranteed</span><br>
        </div>
        <div class="two-content-div-form">
            <span class="subtitle">Contact Us</span>
            <form>
                <input type="text" placeholder="First Name"><br>
                <input type="text" placeholder="Last Name"><br>
                <input type="text" placeholder="Email"><br>
                <input type="submit" value="Contact" class="button">
            </form>
        </div>
    </div>

    <div class="two-content-div glass">
        <div>
            <img src="../../Assets/HomeLastContentDiv.jpg" class="content-div-img">
        </div>
        <div>
            <span class="title">Best service in Sri Lanka</span><br>
            <span>Nemo enim ipsam voluptatem quia voluptas sit aspernatur
                 aut odit aut fugit, sed quia consequuntur magni dolores 
                  eos qui ratione voluptatem sequi nesciunt. 
                  Neque porro quisquam est, qui dolorem.</span>
        </div>
    </div>


    <footer class="footer"></footer>

<script src="/SerWise_war/GeneralManager/GeneralManagerHeader.js"></script>
<script src="/SerWise_war/footer.js"></script>
</body>
</html>