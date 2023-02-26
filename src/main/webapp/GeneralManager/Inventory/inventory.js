const container = document.getElementById("branchDiv");
const addButton = document.getElementById("addBranch");
const rmButton = document.getElementById("rmBranch");
const noBranch = document.getElementById("noBranch");
let i = parseInt(noBranch.getAttribute('value'));

addButton.addEventListener("click", function() {
  const input = document.createElement("input");
  i++;
  input.setAttribute('type','text');
  input.setAttribute('name','branchid'+i);
  input.setAttribute('id','branchid'+i);
  noBranch.setAttribute('value',i);
  input.setAttribute('placeholder','Available Branch ID');
  container.appendChild(input);
});

rmButton.addEventListener("click" , function (){
  if (i>1){
    const rmfeild = document.getElementById('branchid'+i);
    container.removeChild(rmfeild);
    i=i-1
    noBranch.setAttribute('value',i);
  }
});