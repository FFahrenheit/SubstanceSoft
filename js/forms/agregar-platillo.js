var formulario = document.getElementById('formulario');

formulario.addEventListener('submit',function(e)
{
    e.preventDefault();
    console.log('working!');

    var datos = new FormData(formulario);

    if(formulario.checkValidity()===true)
    {
        fetch('../../php/forms/agregar-platillo.php',
        {
            method: 'POST',
            body: datos
        })
        .then (res => res.json())
        .then (data =>
            {
                console.log("aqui llega js");
                console.log(data);
                if(!isNaN(data))
                {
                    var path = '/substancesoft/views/forms/nueva-receta.php?key=';
                    path.concat(data);
                    window.location.pathname = path;
                }
                else 
                {
                    alert(data);
                }
            })
    }
})
