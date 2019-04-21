<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ClockPicker Tests</title>

    <link rel="stylesheet" type="text/css" href="../../js/vendor/clock/dist/jquery-clockpicker.min.css"> ***

    <script src="../../js/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/vendor/clock/dist/jquery-clockpicker.min.js"></script> ***
</head>

<body>
        <div class="container">
                <input id="input-a" value="" data-default="20:48">
            </div>
            <script type="text/javascript">
var input = $('#input-a');
input.clockpicker({
    autoclose: true
});

// Manual operations
            </script>
</body>

</html>