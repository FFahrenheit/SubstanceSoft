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
      if(datos != null)
      {
        if(datos.get("new") && datos.get("preferencia")==="aplicacion_movil")
        {
          var fs = require('fs');
          var file = fs.readFileSync('C:/Users/lghhs/Documents/SubstanceSoft_Backup/backup.sql');
          var archivo = new FormData();
          archivo.append("sql", file);
          fetch('../../php/requests/recieveVM.php',
          {
              method: 'POST',
              body: archivo
          })
          .then (res => res.json())
          .then (data =>
          {
            //console.log(data);
          })
          .catch(function() {
            alert("Can't connect to backend try latter");
          });
        }
      }
        alert(data);
        window.location.reload(true); 
    })
}
