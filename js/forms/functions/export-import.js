function confirmExport()
{
    fetch('../../../php/requests/export.php',
    {
        method: 'POST'
    })
    .then (res => res.json())
    .then (data =>
    {
        console.log("aqui llega js");
        console.log(data);
        window.location.pathname = '/substancesoft/views/functions/modulo0-funcion4.php';
    })
}

function confirmImport()
{
    fetch('../../../php/requests/import.php',
    {
        method: 'POST'
    })
    .then (res => res.json())
    .then (data =>
    {
        console.log("aqui llega js");
        console.log(data);
        window.location.pathname = '/substancesoft/views/functions/modulo0-funcion4.php';
    })
}
