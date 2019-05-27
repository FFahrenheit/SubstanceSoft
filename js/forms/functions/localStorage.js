function setData()
{
  var type = document.getElementById("type").value;
  var com = document.getElementById("com").value;
  var imp = document.getElementById("imp").value;
  console.log(type);
  if(type != "Seleccione si la impresora es local o remota")
  {
    localStorage.setItem("type", type);
  }
  if(com != "")
  {
    localStorage.setItem("com", com);
  }
  if(imp != "")
  {
    localStorage.setItem("imp", imp);
  }
  alert("MUY BIEN!");
}

function display()
{
    var type = document.getElementById("type").value;
    if(type == "Remota")
    {
      document.getElementById("label").hidden=false;
      document.getElementById("label2").hidden=false;
      document.getElementById("com").hidden=false;
    }
    else
    {
      document.getElementById("label").hidden=true;
      document.getElementById("label2").hidden=true;
      document.getElementById("com").hidden=true;
      document.getElementById("com").value = "";
    }
}

function getBD()
{
  localStorage.getItem("bd");
}
