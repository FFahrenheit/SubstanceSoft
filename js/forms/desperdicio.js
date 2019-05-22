var formulario = document.getElementById('formulario');

formulario.addEventListener('submit',function(e)
{
    e.preventDefault();
    console.log('working!');

    var desperdicio = document.getElementById('rate').value;

    var datos = new FormData();
    datos.append("rate", desperdicio);

    if(formulario.checkValidity() === true)
    {
        fetch('../../php/forms/cambiar-desperdicio.php',
        {
            method: 'POST', 
            body: datos
        })
        .then (res => res.json())
        .then (data => 
            {
                console.log("aqui llega js");
                console.log(data);
    
                alert(data);
    
                window.location.reaload\(true); 
                    
            })
    }
})