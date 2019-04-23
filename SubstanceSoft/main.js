const electron  = require('electron');
const {app, BrowserWindow, globalShorcut} = electron;
var path = require('path')

let mainWindow;

app.on('ready', () =>{
    mainWindow = new BrowserWindow(
        {
            titleBarStyle: 'hidden',
            minWidth: 1024,
            minHeight: 768,
            show: false,
            backgroundColor: '#bababa',
            icon: path.join(__dirname, 'images/64x64.png')
        }
    );
    mainWindow.setTitle('SubstanceSoft');
    mainWindow.loadURL('http://192.168.15.174/substancesoft/views/menus/index.php');

    mainWindow.maximize();
    mainWindow.on('close',()=>
    {
        mainWindow = null;
    })
});