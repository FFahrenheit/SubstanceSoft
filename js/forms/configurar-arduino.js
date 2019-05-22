var formulario = document.getElementById('formulario');

formulario.addEventListener('submit',(e)=>
{
    e.preventDefault();
    console.log('working!');

    var datos = new FormData(formulario);

    if(formulario.checkValidity()===true)
    {
        fetch('../../php/requests/arduino.php',
        {
            method: 'POST',
            body: datos
        })
        .then (res => res.json())
        .then (data =>
            {
                console.log(data);
                if(data==='ok')
                {
                    alert('Configurado!');
                }
                else 
                {
                    alert('Error');
                }
            })
    }
});
