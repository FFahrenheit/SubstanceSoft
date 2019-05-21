var form = document.getElementById('test');
var consola = document.getElementById('consola');
var msg = document.getElementById('command');

const SerialPort = require('serialport');

var serialPort = new SerialPort('COM5', {
    baudrate: 9600,
    dataBits: 8, 
    parity: 'none', 
    stopBits: 1, 
    flowControl: false 
});

form.addEventListener('submit',(e)=>
{
    e.preventDefault();
    console.log(msg.value);
    serialPort.write(msg.value);
})

serialPort.on('data', function (data) {
    console.log('Data:', data);
    consola.innerHTML = data;
});

// Read data that is available but keep the stream from entering //"flowing mode"
serialPort.on('readable', function () {
    console.log('Data:', port.read());
});