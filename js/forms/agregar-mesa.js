var formulario = document.getElementById('formulario');

formulario.addEventListener('submit',function(e)
{
    e.preventDefault();
    console.log('working!!!');

    var datos = new FormData(formulario);

    if(formulario.checkValidity()===true)
    {
        fetch('../../php/forms/agregar-mesa.php',
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

                window.location.pathname = '/substancesoft/views/forms/nueva-mesa.html';
            })
    }
})

var confirm_mesa = document.getElementById('numero_mesa');
confirm_mesa.addEventListener('onkeyup', _ => checkTable());

function checkTable()
{
  console.log("Si llegó");
  var numero = document.getElementById('numero_mesa').value;
  var datos = new FormData();
  datos.append("numero", numero);
  fetch('../../php/forms/functions/validar-mesa.php',
  {
      method: 'POST',
      body: datos
  })
  .then (res => res.json())
  .then (data =>
      {
          switch(data)
          {
            case "ok":
            document.getElementById('message').style.color = 'green';
            document.getElementById('message').innerHTML = 'Ok';
            return true;
            break;
            case "nel":
            document.getElementById('message').style.color = 'red';
            document.getElementById('message').innerHTML = 'Ya hay una mesa con ese numero';
            return false;
            break;
          }
      })
}
