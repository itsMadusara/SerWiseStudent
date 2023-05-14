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
  <style>
    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
      -webkit-appearance: none;
      margin: 0;
    }
  </style>
  <title>Serwise</title>
</head>
<body>


<%
  if (request.getParameter("date") == null & request.getParameter("time") == null) {
    response.sendRedirect("appoinment.jsp");
  } else {
    Integer id= Integer.valueOf(request.getParameter("id"));
  }
%>

<%
  String B_Id = String.valueOf(session.getAttribute("branchId"));
%>

<header class="navigation">
  <img src="../../Assets/SerWise.png" class="navimg">
  <table>
    <td><a href="/SerWise_war/ServiceAdvisor/Home.jsp">Home</a></td>
    <td><a href="/SerWise_war/BranchInventoryList?b_Id=<%out.println(session.getAttribute("branchId"));%>">Inventory</a></td>
    <td><a href="/SerWise_war/BranchAppointmentList?b_Id=<%out.println(session.getAttribute("branchId"));%>" style="color:#EE534F">Appointment</a></td>
    <td><a href="/SerWise_war/ServiceAdvisor/Job/job.jsp">Jobs</a></td>
    <td><a href="/SerWise_war/GetSlotList?b_Id=<%out.println(session.getAttribute("branchId"));%>">Slots</a></td>
    <td><a href="/SerWise_war/ServletLogout"><button class="button">Logout</button></a></td>
    </tr>
  </table>
</header>

<div class="two-content-div">
  <div class="two-content-div-one">
    <span class="title">SerWise</span><br>
    <span>Create Job</span>
  </div>
  <div class="two-content-div-form">
    <span class="subtitle">Create Job</span>

    <form method="post" action="/SerWise_war/ServletCreateJob">
      <label>Branch Id</label>
      <input type="number" value='<%=B_Id%>' name="b_id" id="b_id" readonly><br>
      <label>Appointment Id</label>
      <input type="number" value='<%=request.getParameter("id")%>' name="id" id="id" readonly><br>
      <label>Description</label>
      <input type="text" value='<%=request.getParameter("des")%>' name="type" id="type" required readonly><br>
      <label>Date</label>
      <input type="Date" value='<%=request.getParameter("date")%>' name="date" id="date" readonly><br>
      <label>Time</label>
      <input type="Time" value="<%=request.getParameter("time")%>" name="time" id="time" readonly><br>
      <label>Slot</label>
      <input type="number" list='slots' placeholder="Slot Number" name="slot" id="slot" required>
      <label>Service</label>
      <input type="text" list='service' placeholder="Service" name="src" id="src" required>
      <datalist id="slots"></datalist>
      <datalist id="service"></datalist>

        <br>
        <span class="subtitle">Add Item</span>
        <button id="plusbutton" type="button" class="close" onclick="add_item()" style="background: none; border: none; float: right">+</button>
        <button id="minusbutton" type="button" class="close" onclick="remove_item()" style="background: none; border: none; float: right; display: none">-</button>


        <div id="append" class="frm-input">



          <div class="frm-input">
            <label>Item 1</label>
            <input list="Item_o" id="Item1" name="Item1">
            <datalist id="Item_o">


            </datalist>
            <label id="L1" name="L1" >Qty</label>
            <input id="IQ1" name="IQ1">
            <datalist id="member">

            </datalist>
          </div>
      </div>

      <input type="hidden" id="No_Of_Item" name="No_Of_Item" >
      <input type="submit" value="Create Job" class="button">
    </form>
  </div>
</div>



<script src="/SerWise_war/ServiceAdvisor/JS/getfreeslot.js">
  //fetching free slots...

</script>

<script>
  var B_Id = <%= B_Id %>;
  get_item();
  const Hidden_input=document.getElementById("No_Of_Item");
  Hidden_input.value = N_of_m;
</script>


<footer class="footer">
  <div class="center"><img src="../../Assets/SerWise.png" class="logo"></div>
  <div class="center"><a href="#"> Contact Us </a> &nbsp|
    &nbsp<a href="#"> About Us </a> &nbsp|
    &nbsp <a href="#"> Legal Stuff </a></div>
  <div class="center">All Rights Recieved</div>
</footer>
</body>
</html>