function setCodeStatus(new_status,preference)
{

    var datos = new FormData();
    datos.append("new",new_status);
    datos.append("preferencia",preference);
    fetch('../../php/forms/cambiar-preferencia.php',
    {
        method: 'POST',
        body: datos
    })
    .then (res => res.json())
    .then (data =>
    {
        if(datos.get("new") && datos.get("preferencia")==="aplicacion_movil")
        {
          var fs = require('fs');
          var file = fs.readFileSync('C:/users/%userprofile%/Documents/SubstanceSoft_Backup/backup.sql');
          var datos = new FormData();
          datos.append("sql", file);
          fetch('23.99.135.168/substancesoft/php/requests/recieveVM.php',
          {
              method: 'POST',
              body: datos
          })
          .then (res => res.json())
          .then (data =>
          {
            console.log(data);
          })
        }
        //alert(data);
        window.location.reload(true); 
    })
}
