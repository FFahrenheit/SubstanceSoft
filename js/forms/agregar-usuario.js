var formulario = document.getElementById('formulario');

formulario.addEventListener('submit',function(e)
{
    e.preventDefault();
    console.log('working!');

    var datos = new FormData(formulario);

    if(formulario.checkValidity()===true)
    {
        fetch('../../php/forms/agregar-usuario.php',
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

                window.location.pathname = '/substancesoft/views/forms/nuevo-usuario.html';
            })
    }
})
