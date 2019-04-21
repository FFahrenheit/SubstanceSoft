var formulario = document.getElementById('formulario');

formulario.addEventListener('submit',function(e)
{
    e.preventDefault();
    console.log('working!');

    console.log()

    var datos = new FormData();

    /*if(formulario.checkValidity()===true)
    {
        fetch('../../php/forms/agregar-surtido.php', 
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

                window.location.reload(false); 
                  
            })
    }*/
})

var input = $('#encendido');
input.clockpicker({
    autoclose: true
});

var input = $('#apagado');
input.clockpicker({
    autoclose: true
});