const nav = document.querySelector('.navigation');
const innerText = "<img src=\"../../Assets/SerWise.png\" class=\"navimg\">\n" +
    "<table>\n" +
    "    <tr>\n" +
    "        <td><a href=\"/GeneralManager/Home/home.jsp\" class=\"nava\">Home</a></td>\n" +
    "        <td><a href=\"/GeneralManager/Employee/EmployeeHome.jsp\">Employee</a></td>\n" +
    "        <td><a href=\"/GeneralManager/Services/serviceHome.jsp\">Services</a></td>\n" +
    "        <td><a href=\"/GeneralManager/Inventory/InventoryHome.jsp\">Inventory</a></td>\n" +
    "        <td><a href=\"/GeneralManager/Branch/BranchHome.jsp\">Branches</a></td>\n" +
    "        <td><a href=\"/GeneralManager/Report/reportHome.html\">Reports</a></td>\n" +
    "        <td><a href='/logout'><button class=\"button\">Logout</button></a></td>\n" +
    "        <td><a href=\"#\"><img src=\"../../Assets/ProfilePic.jpg\" class=\"profile\"></a></td>\n" +
    "    </tr>\n" +
    "</table>";
nav.innerHTML=innerText;