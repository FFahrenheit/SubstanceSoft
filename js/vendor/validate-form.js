function check()
{
  if (document.getElementById('password').value ==
  document.getElementById('confirm_password').value) {
      document.getElementById('message').style.color = 'green';
      document.getElementById('message').innerHTML = 'Ok';
      return true;
  } else {
      document.getElementById('message').style.color = 'red';
      document.getElementById('message').innerHTML = 'Las contraseñas no coinciden';
      return false;
  }
}
function validate_regex()
{
    if(/^[(a-z|A-Z|0-9)]{4,}$/.test(document.getElementById('usu').value))
    {
      document.getElementById('mensaje').style.color = 'green';
      document.getElementById('mensaje').innerHTML = 'Ok';
      return true;
    }else{
      document.getElementById('mensaje').style.color = 'red';
      document.getElementById('mensaje').innerHTML = 'El usuario debe tener mínimo 4 caracteres alfanuméricos';
      return false;
    }
}

(function() {
  'use strict';

  window.addEventListener('load', function() {
    var form = document.getElementById('formulario');
    form.addEventListener('submit', function(event) {
      if (form.checkValidity() === false) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  }, false);
})();

(function() {
  'use strict';

  window.addEventListener('load', function() {
    var form = document.getElementById('formulario2');
    form.addEventListener('submit', function(event) {
      if (form.checkValidity() === false) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  }, false);
})();