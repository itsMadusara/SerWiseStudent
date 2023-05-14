const idInput = document.getElementById("vehicleIdInput");
let rows = document.getElementById("jobTable").rows;
let lastRow = rows.length

idInput.addEventListener("input",function () {
    let id = idInput.value;
    for (let i = 1; i < lastRow; i++) {
        if(!(rows[i].cells[0].innerHTML).includes(id)){
            rows[i].style.display = "none";
        }
        if((rows[i].cells[0].innerHTML).includes(id)){
            rows[i].style.display = "";
        }
    }
})