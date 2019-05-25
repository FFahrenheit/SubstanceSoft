var form = document.getElementById('reclamo');
var upd = document.getElementById('again');
var clave;

again.addEventListener('click', (e)=>
{
    console.log("Recalculando");
    
    var datos = new FormData(form);

    fetch('../../../php/forms/actualizar-total-nuevo.php',
    {
        method: 'POST',
        body: datos
    })
    .then(res => res.json())
    .then(data => {
        console.log("aqui llega js");
        console.log(data);

        alert(data);

        window.location.reload(true);

    })
})

form.addEventListener('submit', (e) => 
{
    e.preventDefault();
    console.log("Vamo a reclamar");

    var datos = new FormData(form);

    fetch('../../../php/forms/actualizar-total.php',
        {
            method: 'POST',
            body: datos
        })
        .then(res => res.json())
        .then(data => {
            console.log("aqui llega js");
            console.log(data);

            alert(data);

            window.location.reload(true);

        })
});

function showDetails(button)
{
    clave = button.id;
    console.log(clave);
}

function confirmDelete()
{
    var dat = new FormData();

    dat.append("user", clave);

    console.log("Si se envía la información " + dat.get("user"))

    console.log(clave);

    fetch('../../../php/forms/functions/cancelar-comanda.php',
    {
        method: 'POST',
        body: dat
    })
    .then (res => res.json())
    .then (data =>
    {
        console.log("aqui llega js");
        console.log(data);
        alert(data);
        //window.location.pathname = '/substancesoft/views/forms/modificar-usuario.php';
        //window.history.back();
        window.location.reload(true);

    })

}
