var formulario = document.getElementById('formulario');

formulario.addEventListener('submit',function(e)
{
    e.preventDefault();
    console.log('working!');

    var apagado = document.getElementById('apagado').value;
    var encendido = document.getElementById('encendido').value;
    if(formulario.checkValidity()===true)
    {
        var datos = new FormData();
        datos.append("apagado",apagado);
        datos.append("encendido",encendido);

        fetch('../../php/forms/cambiar-horario.php',
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

var input = $('#encendido');
input.clockpicker({
    autoclose: true
});

var input = $('#apagado');
input.clockpicker({
    autoclose: true
});