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
  <link rel="stylesheet" href="/SerWise_war/ServiceAdvisor/CSS/content.css">
  <title>Document</title>
</head>
<body>
<header class="navigation">
  <img src="/SerWise_war/Assets/SerWise.png" class="navimg">
  <table>
    <tr>
      <td><a href="/SerWise_war/ServiceAdvisor/Home.jsp" style="color:#EE534F">Home</a></td>
      <td><a href="/SerWise_war/BranchInventoryList?b_Id=<%out.println(session.getAttribute("branchId"));%>" >Inventory</a></td>
      <td><a href="/SerWise_war/BranchAppointmentList?b_Id=<%out.println(session.getAttribute("branchId"));%>" >Appointment</a></td>
      <td><a href="/SerWise_war/ServiceAdvisor/Job/job.jsp">Jobs</a></td>
      <td><a href="/SerWise_war/GetSlotList?b_Id=<%out.println(session.getAttribute("branchId"));%>">Slots</a></td>
      <td><a href="/SerWise_war/ServletLogout"><button class="button">Logout</button></a></td>
    </tr>
  </table>
</header>


<div class="home-first-content">
  <div>
    <span class="title">SerWise</span><br>
    <span>We Care About Your Car</span><br>
    <a href="#"><button class="button">Join Now</button></a>
  </div>
</div>

<div class="two-content-div">
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

<div class="two-content-div">
  <div>
    <img src="../Assets/HomeLastContentDiv.jpg" class="content-div-img">
  </div>
  <div>
    <span class="title">Best service in Sri Lanka</span><br>
    <span>Nemo enim ipsam voluptatem quia voluptas sit aspernatur
                 aut odit aut fugit, sed quia consequuntur magni dolores
                  eos qui ratione voluptatem sequi nesciunt.
                  Neque porro quisquam est, qui dolorem.</span>
  </div>
</div>

<footer class="footer">
  <div class="center"><img src="/SerWise_war/Assets/SerWise.png" class="logo"></div>
  <div class="center"><a href="#"> Contact Us </a> &nbsp|
    &nbsp<a href="#"> About Us </a> &nbsp|
    &nbsp <a href="#"> Legal Stuff </a></div>
  <div class="center">All Rights Recieved</div>
</footer>
</body>
</html>