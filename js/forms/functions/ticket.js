function printOrder(order)
{
  console.log(order);
  var data = new FormData();
  data.append("order",order);
  fetch('../../../ImpresionTermica/ticket.php',
  {
      method: 'POST',
      body: data
  })
  .then(res=>
    {
      console.log(res);
      return res.json();
    })
  .then((data)=>
  {
    console.log(data);
    console.log("en teoria se imprimió");
  })
}
