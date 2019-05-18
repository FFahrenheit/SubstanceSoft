var form = document.getElementById('reclamo');
var upd = document.getElementById('again');

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