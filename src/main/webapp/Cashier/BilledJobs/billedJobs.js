const idInput = document.getElementById("jobIdInput");
let rows = document.getElementById("doneJobTable").rows;
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