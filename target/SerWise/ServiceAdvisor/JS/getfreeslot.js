var N_of_m = 1;
async function get_fr_slot(){   //async function for fetching free slot
    let freeslots = await fetch('/SerWise_war/getfreeslot', {
        body : JSON.stringify(
            {
                Branch_Id: B_Id
            }
        ),
        method : "POST"
    })
        .then((response)=>{
            return response.json();
        })
    slot_list.innerHTML = '';
    for (let i = 0; i < freeslots["noOfRows"]; i++) {
        const newOption = document.createElement('option');
        newOption.value = freeslots["slot"+i];
        slot_list.appendChild(newOption);
    }

    // alert(freeslots["noOfRows"])

}

async function get_service(){   //async function for fetching free slot
    let service = await fetch('/SerWise_war/getServiceListSA', {
        body : JSON.stringify(
            {
            }
        ),
        method : "POST"
    })
        .then((response)=>{
            return response.json();
        })
    service_list.innerHTML = '';
    const Option = document.createElement('option');
    Option.value = 'Default';
    service_list.appendChild(Option);

    for (let i = 0; i < service["noOfRows"]; i++) {
        const newOption = document.createElement('option');
        newOption.value = service["name"+i];
        service_list.appendChild(newOption);
    }

      // alert(service["name1"])

}

const item_list= document.getElementById('Item_o');
async function get_item(){   //async function for fetching free slot
    let item = await fetch('/SerWise_war/getItemList', {
        body : JSON.stringify(
            {
                Branch_Id: B_Id
            }
        ),
        method : "POST"
    })
        .then((response)=>{
            return response.json();
        })
    item_list.innerHTML = '';
    for (let i = 0; i < item["noOfRows"]; i++) {
        const newOption = document.createElement('option');
        newOption.value = item["item"+i];
        item_list.appendChild(newOption);
    }

    // alert("LLLL")

}





//get elements
const slot_field = document.getElementById('slot');
const slot_list= document.getElementById('slots');

const service_field = document.getElementById('src');
const service_list= document.getElementById('service');



//event listener.
slot_field.addEventListener('click', get_fr_slot);
service_field.addEventListener('click', get_service);

function add_item()
{
    if(N_of_m<20)
    {
        const label = document.createElement('label');
        const labelQ = document.createElement('label');
        const inputM = document.createElement('input');
        const inputQ = document.createElement('input');
        const minusbutton=document.getElementById("minusbutton");
        const Hidden_input=document.getElementById("No_Of_Item");
        minusbutton.style.display='block';

        Hidden_input.value = N_of_m;

        label.innerText = 'Item' +" "+ (++N_of_m);
        labelQ.innerText = 'Qty';

        // console.log(N_of_m);
        label.id = 'L' + (N_of_m);
        labelQ.id = 'Q' + (N_of_m);

        inputM.id = 'Item' + (N_of_m);
        inputQ.id = 'IQ' + (N_of_m);

        inputM.setAttribute('list','Item_o');

        if(N_of_m==20)
        {
            const plusbutton=document.getElementById("plusbutton");
            plusbutton.style.display='none';
        }

        document.getElementById("append").appendChild(label);
        document.getElementById("append").appendChild(inputM);
        document.getElementById("append").appendChild(labelQ);
        document.getElementById("append").appendChild(inputQ);
        document.getElementById("append").appendChild("<br>");

    }
}


function remove_item()
{
    if(N_of_m>0)
    {
        const label = document.getElementById('L'+(N_of_m));
        const inputM = document.getElementById('Item'+(N_of_m));
        const labelQ = document.getElementById('Q'+(N_of_m));
        const inputQ = document.getElementById('IQ'+(N_of_m--));

        const Hidden_input=document.getElementById("No_Of_Item");

        label.remove();
        inputM.remove();
        labelQ.remove();
        inputQ.remove();
        const plusbutton=document.getElementById("plusbutton");
        plusbutton.style.display='block';
        Hidden_input.value = N_of_m;

    }
    if(N_of_m==0)
    {
        const minusbutton=document.getElementById("minusbutton");
        minusbutton.style.display='none';
    }
}