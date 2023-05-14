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
  <title>Document</title>
</head>
<body>
<%
  if (session.getAttribute("auth")==null){
    response.sendRedirect("/SerWise_war/Login/login.html");
  }
  else {
    if (!session.getAttribute("auth").toString().equals("3")) {
      out.println("invalid authentication");
      out.println(session.getAttribute("auth"));
    }
  }
%>

<%@ page import ="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.io.IOException"%>

<%
//  class job{
//    Integer app_id;
//    String app_typ;
//    Date date;
//    String time;
//    String V_No;
//  }
//  List<job> data = new ArrayList<job>();
//
//  try{
//    Connection con = DatabaseConnection.initializeDatabase();
//    PreparedStatement ps = con.prepareStatement("select * from serwise.appoinment INNER JOIN serwise.vehicle ON serwise.appoinment.Vehicle_Id = serwise.vehicle.Vehicle_Id");
//    ResultSet rs = ps.executeQuery();
//
//    while(rs.next()){
//      job ap = new job();
//      ap.app_id=rs.getInt("Appoinment_Id");
//      ap.app_typ=rs.getString("Desription");
//      ap.date=rs.getDate("Date");
//      ap.time=rs.getString("Time");
//      ap.V_No=rs.getString("Vehicle_No");
//      data.add(ap);
//    }
//  }
//  catch(SQLException sq){
//    response.sendRedirect("Errsql.html");
//  }
//  catch(ClassNotFoundException cq){
//    response.sendRedirect("Err.html");
//  }
//  out.println("<table>");
//  out.println("</table>");
%>
<div  id="blur" class="back_g">
  <header class="navigation">
    <img src="/SerWise_war/Assets/SerWise.png" class="navimg">
    <table>
      <tr>
        <td><a href="/SerWise_war/ServiceAdvisor/Home.jsp">Home</a></td>
        <td><a href="/SerWise_war/BranchInventoryList?b_Id=<%out.println(session.getAttribute("branchId"));%>">Inventory</a></td>
        <td><a href="/SerWise_war/BranchAppointmentList?b_Id=<%out.println(session.getAttribute("branchId"));%>" style="color:#EE534F">Appointment</a></td>
        <td><a href="/SerWise_war/ServiceAdvisor/Job/job.jsp">Jobs</a></td>
        <td><a href="/SerWise_war/GetSlotList?b_Id=<%out.println(session.getAttribute("branchId"));%>">Slots</a></td>
        <td><a href="/SerWise_war/ServletLogout"><button class="button">Logout</button></a></td>
      </tr>
    </table>
  </header>

  <div>

    <div class="single-content-div center title">
      <span class="title">SerWice &MediumSpace;</span> <span class="subtitle"> - &MediumSpace; View Appointment</span>
    </div>

    <div class="single-content-div center title">
      Search By Appointment ID : &MediumSpace;
      <form>
        <input type="text" placeholder="Employee ID">
        &MediumSpace;
        <input type="submit" value="Search" class="button">
      </form>
    </div>

    <div class="center form-display-table">
      <table id="tablej">
        <tr>
          <th>Appointment Type</th>
          <th>Date</th>
          <th>Time</th>
          <th>Vehicle No</th>
          <th style="border-style: none;"></th>
        </tr>
        <%
          int noOfRows = (int) request.getAttribute("noOfRows");
          int i = 0;
          while (i<noOfRows){
            String appid = request.getAttribute("AppId"+i).toString();
            out.println("<tr>");
            out.println("<td>");
            String apptype = request.getAttribute("AppType"+i).toString();
            out.println(apptype);
            out.println("</td>");
            out.println("<td>");
            String appdate = request.getAttribute("AppDate"+i).toString();
            out.println(appdate);
            out.println("</td>");
            out.println("<td>");
            String apptime = request.getAttribute("AppTime"+i).toString();
            out.println(apptime);
            out.println("</td>");
            out.println("<td>");
            String v_no = request.getAttribute("V_No"+i).toString();
            out.println(v_no);
            out.println("</td>");
            out.println("" +
                    "<td style=\"border-style: none;\">" + "<a href=\"/SerWise_war/ServiceAdvisor/Appointment/jobadd.jsp?date="+appdate+"&id="+appid+"&time="+apptime+"&des="+apptype+"\"><button class=\"button\">Create Job</button></a> " +
                    "<button class=\"button\" onclick=\"deleteconfirm('"+appid+"')\">Delete</button></td></tr>");
            i=i+1;
          }
        %>
      </table>
    </div>
  </div>
</div>


<%--popup delete confirmation--%>
<div id="popupwin">
  <div class="popup" id="popupid" >
    <div class="popup-content">
      <div>
        <button class="close" onclick="popup_close()" style="background: none; border: none; float: right;">X</button>
      </div>
      <div>
        <form method="post" action="/SerWise_war/DltAppointment">
          <p id="pop-p1">Do You Want To Delete Appointment of <input type="text" value='' id="v_no" name="v_no" readonly style="border: none;text-align: center"></p>
          <button class="button" type="button" style="background-color: #dddddd" onclick="popup_close()">Cancel</button>
          </a><button class="button" type="submit">Delete</button>
        </form>
      </div>
    </div>
  </div>
</div>

<script>

  function deleteconfirm(id) {
    var bk_g = document.getElementById('blur');
    var popwin = document.getElementById('popupid');
    var pop_text = document.getElementById('v_no');
    var ft = document.getElementById('footer');
    bk_g.classList.add('active');
    ft.classList.add('active');
    pop_text.value = id;
    popwin.style.display='block';
    popwin.style.filter='none';

  }
  function popup_close(){
    document.getElementById('popupid').style.display='none';
    var bk_g = document.getElementById('blur');
    bk_g.classList.remove('active');
  }

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