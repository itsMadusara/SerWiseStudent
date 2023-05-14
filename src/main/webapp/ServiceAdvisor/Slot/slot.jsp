<%@ page import="java.sql.Connection" %>
<%@ page import="com.CS01.SerWise.Services.DatabaseConnection" %>
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
<%@ page import ="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.io.IOException"%>

<%
  class slot{
    Integer slot_id;
    String leader;
  }
  List<slot> data = new ArrayList<slot>();

  try{
    Connection con = DatabaseConnection.initializeDatabase();
//      need to write sql q for find the right slots for the branch according
//      to the user using session management.
    PreparedStatement ps = con.prepareStatement("select * from serwise.slot");
    ResultSet rs = ps.executeQuery();

    while(rs.next()){
      slot slt = new slot();
      slt.slot_id=rs.getInt("Slot_Id");
      slt.leader=rs.getString("Slot_Leader_Id");
      data.add(slt);
    }
  }
  catch(SQLException sq){
    response.sendRedirect("1Errsql.html");
  }
  catch(ClassNotFoundException cq){
    response.sendRedirect("2Err.html");
  }
%>

<div id="blur" class="back_g">
  <header class="navigation">
    <img src="/SerWise_war/Assets/SerWise.png" class="navimg">
    <table>
      <tr>
        <td><a href="/SerWise_war/ServiceAdvisor/Home.jsp">Home</a></td>
        <td><a href="/SerWise_war/BranchInventoryList?b_Id=<%out.println(session.getAttribute("branchId"));%>">Inventory</a></td>
        <td><a href="/SerWise_war/BranchAppointmentList?b_Id=<%out.println(session.getAttribute("branchId"));%>" >Appointment</a></td>
        <td><a href="/SerWise_war/ServiceAdvisor/Job/job.jsp" >Jobs</a></td>
        <td><a href="/SerWise_war/GetSlotList?b_Id=<%out.println(session.getAttribute("branchId"));%>" style="color:#EE534F">Slots</a></td>
        <td><a href="/SerWise_war/ServletLogout"><button class="button">Logout</button></a></td>
      </tr>
    </table>
  </header>

  <%
    String B_Id = String.valueOf(session.getAttribute("branchId"));
  %>


  <div class="single-content-div center title">
    <span class="title">SerWice &MediumSpace;</span> <span class="subtitle"> - &MediumSpace; Slot Management</span>
  </div>


  <div class="colomn-content">
    <%
      int noOfRows = (int) request.getAttribute("noOfRows");
      int i = 0;
      while (i<noOfRows){
        String s_id = request.getAttribute("SlotId"+i).toString();
        out.println("<div>" +
                "<span class=\"subtitle\" >Slot "+ s_id+"</span><br>" +
                "<button class=\"slot-button\" onclick=\"editslot("+s_id+")\">Click Here</button>" +
                "</div>");
        i=i+1;
      }
    %>
  </div>
</div>

<div id="popupwin">
  <div class="popup" id="popupid" >
    <div class="popup-content">
      <div>
        <button class="close" onclick="popup_close()" style="background: none; border: none; float: right;">X</button>
      </div>
      <div>
        <p class="subtitle" id="Sname">Edit Slot</p>
        <form id="frm_m" action=javascript:void(0)" onsubmit="edit_slot()">

          <div class="frm-input">
            <label>Slot ID</label>
            <input name="Slot_Id" id="Slot_Id" disabled required>
          </div>
          <div class="frm-input">
            <label>Slot Leader</label>
            <input list="Slotleaders" name="SL" id="SL" required>
            <datalist id="Slotleaders"></datalist>
          </div>

          <div class="frm-input">
            <label>Slot Member 1</label>
            <input list="member" id="M1" name="M1" required>
            <datalist id="member">

            </datalist>
          </div>

          <div id="append" class="frm-input">
          </div>
          <div>
            <p id="msg" style="color: #EE534F"></p>
          </div>
          <button id="plusbutton" type="button" class="close" onclick="add_member()" style="background: none; border: none; float: right">+</button>
          <button id="minusbutton" type="button" class="close" onclick="removemember()" style="background: none; border: none; float: right; display: none">-</button>
          <br>

          <button class="button" type="button" style="background-color: #dddddd" onclick="popup_close()">Cancel</button>
          <button class="button" type="submit">Confirm</button>
        </form>
      </div>
    </div>
  </div>
</div>


<script src="/SerWise_war/ServiceAdvisor/JS/Slot.js">


</script>

<script>
  var B_Id = <%= B_Id %>;
</script>

<footer class="footer" id="footer">
  <div class="center"><img src="/SerWise_war/Assets/SerWise.png" class="logo"></div>
  <div class="center"><a href="#"> Contact Us </a> &nbsp|
    &nbsp<a href="#"> About Us </a> &nbsp|
    &nbsp <a href="#"> Legal Stuff </a></div>
  <div class="center">All Rights Recieved</div>
</footer>
</body>
</html>