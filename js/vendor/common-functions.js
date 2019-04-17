$("#menu-toggle").click(function(e) 
{
  e.preventDefault();
  $("#wrapper").toggleClass("toggled");
});


function goBack() 
{
    window.history.back();
}

function refreshPage()
{
  window.location.reload();
}