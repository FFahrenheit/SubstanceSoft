var formulario = document.getElementById('formulario');

formulario.addEventListener('submit',function(e)
{
    e.preventDefault();
    console.log('working!'); 

    var datos = new FormData(formulario);

    if(formulario.checkValidity()===true)
    {
        fetch('../../../php/forms/functions/agregar-orden.php', 
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
                if(document.getElementById('drive').value==1)
                {
                    var path  = '/substancesoft/views/functions/forms/nueva-comanda.php?clave='+data+'&drive=1';
                    window.location.href = path;
                }
                else
                {
                    console.log(document.getElementById('drive').value)
                    window.history.back();
                }
            })
    }
})