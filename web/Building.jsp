
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DEFINE BUILDING</title>
     <!--Bootstrap CSS-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!--main CSS-->
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
       <header class="header" id="header">
            <div class="container"> 
                <div class="d-flex justify-content-center py-5"> 
                    <div class="col-sm-6 col-lg-12 text-center my-3">
                        <h1 class="align-self-center mx-1">DEFINE BUILDING</h1>	
                    </div>		
                </div>
            </div>
        </header>
<div class='height-max'>
<form action="floors" method="post">
    <div class="container">
        <div class="row px-3 justify-content-center">
            <div class="col-3 my-3">
                <h6>No. of Floors</h6>
                <input type="text" name="floors" id='value' class="form-control form-control-lg" required>
            </div>
            <div class="col-1 my-auto">
                <button type="button" id='btn1' class="btn msg-btn">Next</button>
            </div>
        </div>                  
    </div>
    <div class="container">
        <div id="dvTable" class="justify-content-center"></div>
    </div>
    

    
    <div class="container my-4" id="done" style="display: none;">
        <div class="row px-3 justify-content-center">
            <div class="col-1 my-auto">
                <button type="submit" id='btn3' class="btn msg-btn">Done</button>
            </div>
        </div>
    </div>
</form>
</div>
        <footer class="footer py-3">
            <div class="footer-text col-12 d-flex justify-content-center my-2">
                    DEVELOPED FOR
            </div>
            <div class="footer-text col-12 d-flex justify-content-center my-2">
                    INDIAN OIL CORPOROTION 2019
            </div>
	</footer>
    <script>
    let submit = document.getElementById('btn1');
    let column = 3,row;
    submit.addEventListener('click',function (){
        row=Number(document.getElementById('value').value);
        document.getElementById('value').readOnly=true;
        document.getElementById('btn1').disabled=true;
        console.log(row);

        let table = document.createElement('table');
        table.className = 'table col-12 mx-auto';
        table.style.width = 'auto';
        let thead=document.createElement('thead');
        thead.className = 'thead-inverse';
        thead.innerHTML='<td>Floor No.</td><td>Room Count:</td><td>Hall Count:</td>';
        table.appendChild(thead);

        for(let i=0;i<=row;i++){
            let tr=document.createElement('tr');
            let td1=document.createElement('td');
            if(i===0)
                td1.innerHTML='<input name="fno'+i+'" type="text" value="GRND" class="col-6 form-control" readonly/>';
            else
                td1.innerHTML='<input name="fno'+i+'" type="text" value='+i+' class="col-6 form-control" readonly/>';
            tr.appendChild(td1);
            let td2=document.createElement('td');
            td2.innerHTML='<input name="rcnt'+i+'" type="text" class="col-6 form-control"  required/>';
            tr.appendChild(td2);
            let td3=document.createElement('td');
            td3.innerHTML='<input name="hcnt'+i+'" type="text" class="col-6 form-control"  required/>';
            tr.appendChild(td3);

            table.appendChild(tr);
            console.log(tr);
        }


        let dvTable = document.getElementById('dvTable');
        dvTable.innerHTML = '';
        dvTable.appendChild(table);
        document.getElementById('done').style.display="block";
    });

    </script>
</body>
</html>