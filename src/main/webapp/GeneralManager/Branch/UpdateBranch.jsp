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


<div class="two-content-div glass">
  <div>
    <span class="title">SerWise</span><br>
    <span class="subtitle">Manage Branches</span>
  </div>
  <div class="two-content-div-form">
    <form method="post" action="/SerWise_war/updateBranchDetails">
      <input type="text" name="branchID" placeholder="Branch ID" pattern="[0-9]+" value="<% out.println(request.getAttribute("branchID")); %>" readonly><br>
      <input type="text" name="location" pattern="([A-Z])[A-Za-z0-9' ']+" placeholder="Branch Location (City)" value="<% out.println(request.getAttribute("location")); %>" required><br>
      <input type="text" name="address" placeholder="Address" value="<% out.println(request.getAttribute("address")); %>" required><br>
      <input type="number" name="noOfSlots" placeholder="No of Slots" min="2" pattern="[0-9]+" value="<% out.println(request.getAttribute("noOfSlots")); %>" required><br>
      <input type="text" name="branchManagerID" pattern="[0-9]+" placeholder="Branch Manager ID" value="<%if (request.getAttribute("branchManagerID")==null){out.println("No Branch Manager Assign");}else{out.println(request.getAttribute("branchManagerID"));} %>"><br>
      <button type="submit" class="button">Update Branch</button><br>
    </form>
  </div>
</div>


  <footer class="footer"></footer>

  <script src="/SerWise_war/GeneralManager/GeneralManagerHeader.js"></script>
  <script src="/SerWise_war/footer.js"></script>
</body>
</html>