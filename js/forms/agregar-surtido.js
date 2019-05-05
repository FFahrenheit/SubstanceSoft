var user;
var quantity;
var frc;
var ing;
var formulario = document.getElementById('formulario');

function showDetails(button)
{
    user = button.id;
    console.log(user);
}

function showDetailsModify(button)
{
    user = button.id;
    quantity = button.dataset.qty;
    frc = button.dataset.frc;
    ing = button.dataset.ing;
    modfrc = document.getElementById('modfrc');
    modfrc.value = frc;
    modqty = document.getElementById('modqty');
    modqty.value = quantity;
    console.log(user);
    console.log(quantity);
    console.log(frc);
    console.log(ing);
}

function confirmDelete()
{
    var datos = new FormData();

    datos.append("user",user);

    console.log(user);
    fetch('../../php/forms/eliminar-surtido.php',
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
}

function confirmModify()
{
    var datos = new FormData();

    datos.append("user",user);
    datos.append("frequency",document.getElementById('modfrc').value);
    datos.append("quantity",document.getElementById('modqty').value);
    datos.append("ing", ing);

    console.log(user);
    fetch('../../php/forms/modificar-surtido.php',
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
}

formulario.addEventListener('submit',function(e)
{
    e.preventDefault();
    console.log('working!');

    var datos = new FormData(formulario);

    if(formulario.checkValidity()===true)
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
    }
})
