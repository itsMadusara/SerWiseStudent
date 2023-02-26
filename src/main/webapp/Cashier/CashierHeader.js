const nav = document.querySelector('.navigation');

const innerText = "<img src=\"../../Assets/SerWise.png\" class=\"navimg\">\n" +
    "        <table>\n" +
    "            <tr>\n" +
    "                <td><a href=\"/SerWise_war/Cashier/Home/home.jsp\" class=\"nava\">Home</a></td>\n" +
    "                <td><a href=\"/SerWise_war/Cashier/Appointments/AppointmentHome.jsp\">Appointments</a></td>\n" +
    "                <td><a href='/SerWise_war/ServletLogout'><button class=\"button\">Logout</button></a></td>\n" +
    "                <td><a href=\"#\"><img src=\"../../Assets/ProfilePic.jpg\" class=\"profile\"></a></td>\n" +
    "            </tr>\n" +
    "        </table>";

nav.innerHTML=innerText;