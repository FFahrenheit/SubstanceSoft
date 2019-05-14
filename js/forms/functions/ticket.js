function printOrder(order) {
  console.log(order);
  var data = new FormData();
  data.append("order", order);
  if ("type" in localStorage && "imp" in localStorage) {
    data.append("type", localStorage.getItem("type"));
    data.append("imp", localStorage.getItem("imp"));
    console.log(localStorage.getItem("type"));
    console.log(localStorage.getItem("imp"));
    if ("com" in localStorage) {
      data.append("com", localStorage.getItem("com"));
      console.log(localStorage.getItem("com"));
    }
    else {
      data.append("com", "");
    }
  }
  else {
    data.append("type", "");
    data.append("imp", "");
    data.append("com", "");
  }
  fetch('../../../ImpresionTermica/ticket.php',
    {
      method: 'POST',
      body: data
    })
    .then(res => res.json())
    .then(data => {
      console.log(data);
      alert(data);
      console.log("en teoria se imprimió");
      window.location.reload(true);
    })
}
