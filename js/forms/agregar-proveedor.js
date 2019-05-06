var formulario = document.getElementById('formulario');

formulario.addEventListener('submit',function(e)
{
    e.preventDefault();
    console.log('working!');

    var datos = new FormData(formulario);

    if(formulario.checkValidity()===true)
    {
        fetch('../../php/forms/agregar-proveedor.php',
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
                if(!isNaN(data.clave))
                {
                    var path = '/substancesoft/views/forms/gestionar-surtido.php?key='+data.clave+'&name='+data.nombre;
                    window.location.href = path;
                }
                else
                {
                    alert(data);
                }
            })
    }
})
