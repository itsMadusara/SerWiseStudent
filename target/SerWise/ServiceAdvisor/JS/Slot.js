let N_of_m=1;
var data = {};
function editslot(id)
{
    var S_Id = document.getElementById('Slot_Id');
    var bk_g = document.getElementById('blur');
    var popwin = document.getElementById('popupid');
    var ft = document.getElementById('footer');
    S_Id.value = id;
    ft.classList.add('active');
    bk_g.classList.add('active');
    popwin.style.display='block';
}
function popup_close(){
    document.getElementById('popupid').style.display='none';
    var bk_g = document.getElementById('blur');
    bk_g.classList.remove('active');
    var input_container=document.getElementById("append");
    input_container.innerHTML="";
    N_of_m=0;
    var ft = document.getElementById('footer');
    ft.classList.remove('active');
    const msg=document.getElementById("msg");
    msg.innerText="";
}

function add_member()
{
    if(N_of_m<5)
    {
        const label = document.createElement('label');
        const inputM = document.createElement('input');
        const minusbutton=document.getElementById("minusbutton");
        minusbutton.style.display='block';
        label.innerText = 'Slot Member' +" "+ (++N_of_m);
        // console.log(N_of_m);
        label.id = 'L' + (N_of_m);
        inputM.id = 'M' + (N_of_m);
        inputM.required = true;
        inputM.setAttribute('list','member');
        if(N_of_m==5)
        {
            const plusbutton=document.getElementById("plusbutton");
            plusbutton.style.display='none';
        }


        document.getElementById("append").appendChild(label);
        document.getElementById("append").appendChild(inputM);
        document.getElementById("append").appendChild("<br>");

    }
}

function removemember()
{
    if(N_of_m>0)
    {
        const label = document.getElementById('L'+(N_of_m));
        const inputM = document.getElementById('M'+(N_of_m--));
        label.remove();
        inputM.remove();
        const plusbutton=document.getElementById("plusbutton");
        plusbutton.style.display='block';

    }
    if(N_of_m==0)
    {
        const minusbutton=document.getElementById("minusbutton");
        minusbutton.style.display='none';
    }
}


async function get_slot_ldr(){   //async function for fetching free slot
    let slot_ldr = await fetch('/SerWise_war/GetSlotLeader', {
        body : JSON.stringify({
            Branch_Id: B_Id
        }),
        method : "POST"
    })
        .then((response)=>{
            return response.json();
        })

    slot_ldr_list.innerHTML = '';
    for (let i = 0; i < slot_ldr["noOfRows"]; i++) {
        const newOption = document.createElement('option');
        newOption.value = slot_ldr["slotLdr_Id"+i]+" "+slot_ldr["slotLdr"+i];
        slot_ldr_list.appendChild(newOption);
    }

     // alert("KKKK")
     // alert(freeslots["noOfRows"])

}


async function get_slot_mbr(){   //async function for fetching free slot
    var snm = document.getElementById('Slot_Id');
    var S_Id = snm.value


    let slot_mbr = await fetch('/SerWise_war/GetSlotMember', {
        body : JSON.stringify({
            Slot_Id: S_Id,
            Branch_Id: B_Id
        }),
        method : "POST"
    })
        .then((response)=>{
            return response.json();
        })

    slot_Mbr_list.innerHTML = '';
    for (let i = 0; i < slot_mbr["noOfRows"]; i++) {
        const newOption = document.createElement('option');
        newOption.value = slot_mbr["slotMbr_Id"+i]+" "+slot_mbr["name"+i];
        slot_Mbr_list.appendChild(newOption);
    }


    // alert(freeslots["noOfRows"])

}


async function edit_slot(){   //async function for fetching free slot
    var snm = document.getElementById('Slot_Id');
    var ldr = document.getElementById('SL');
    // alert("snm.value")
    var S_Id = snm.value
    var slot_ldr = parseInt(ldr.value);

    data["N_of_mbr"] = N_of_m;
    data["Slot_Id"] = S_Id;
    data["Branch_Id"] = B_Id;
    data["Slot_Ldr"] = slot_ldr;

    for (let i = 1; i <= N_of_m; i++) {
        const input = document.getElementById(`M${i}`);
        if (input.value) {
            var n=parseInt(input.value)
            const variableName = 'M' + i; // Construct the name of the variable
            window[variableName] = n;
            data[variableName] = window[variableName];
        }
    }

    let slot = await fetch('/SerWise_war/EditSlot', {
        body : JSON.stringify(data),
        method : "POST"
    })
        .then((response)=>{
            return response.json();
        })

    // alert(slot["ok"])
    popup_close()

}

//get elements
const slot_Ldr_field = document.getElementById('SL');
const slot_ldr_list= document.getElementById('Slotleaders');

const slot_Mbr_field = document.getElementById('M1');
const slot_Mbr_list= document.getElementById('member');

//event listener.
slot_Ldr_field.addEventListener('click', get_slot_ldr);
slot_Mbr_field.addEventListener('click', get_slot_mbr);