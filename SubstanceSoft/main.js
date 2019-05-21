const electron = require('electron');
const { app, BrowserWindow, globalShorcut, Menu } = electron;
const fs = require('fs');
var path = require('path');
var url = require('url');
var closeAll = false;
var IPdialog = null;

"use strict";

let mainWindow;

app.on('ready', () => {
  mainWindow = new BrowserWindow(
    {
      titleBarStyle: 'hidden',
      minWidth: 1024,
      minHeight: 768,
      //frame: false,
      show: false,
      backgroundColor: '#FFFFFF',
      icon: path.join(__dirname, 'images/64x64.png'),
      title: 'SubstanceSoft',
      webPreferences: {
        nodeIntegration: true
      }
    }
  );
  //mainWindow.setTitle('SubstanceSoft');

  mainWindow.loadURL(url.format(
    {
      pathname: path.join(__dirname, 'index.html'),
      protocol: 'file',
      slashes: true
    }));

  mainWindow.maximize();

  const template = [
    {
      label: 'Edit',
      submenu: [
        { role: 'undo' },
        { role: 'redo' },
        { type: 'separator' },
        { role: 'cut' },
        { role: 'copy' },
        { role: 'paste' },
        { role: 'pasteandmatchstyle' },
        { role: 'delete' },
        { role: 'selectall' }
      ]
    },
    {
      label: 'View',
      submenu: [
        { role: 'reload' },
        { role: 'forcereload' },
        { role: 'toggledevtools' },
        { type: 'separator' },
        { role: 'resetzoom' },
        { role: 'zoomin' },
        { role: 'zoomout' },
        { type: 'separator' },
        { role: 'togglefullscreen' }
      ]
    },
    {
      role: 'window',
      submenu: [
        { role: 'minimize' },
        { role: 'close' }
      ]
    },
    {
      role: 'help',
      submenu: [
        {
          label: 'Cheque nuestro avance, profe',
          click() { require('electron').shell.openExternal('https://github.com/FFahrenheit/SubstanceSoft') }
        },
        {
          label: 'Reconfigurar',
          click() {
            var reconf =
            {
              "set": false
            };
            reconfJSON = JSON.stringify(reconf);
            fs.writeFile("configuration.json", reconfJSON, function (err) {
              if (err) {
                console.log(err);
                return;
              }
              console.log("Guardado!");
            });
            mainWindow.loadURL(url.format(
              {
                pathname: path.join(__dirname, 'index.html'),
                protocol: 'file',
                slashes: true
              }));
          }
        },
        {
          label: 'Obtener mi IP', click() {
            IPdialog  = new BrowserWindow(
              {
                webPreferences: {
                  nodeIntegration: true
                },
                titleBarStyle: 'hidden',
                maxWidth: 800, //400
                maxHeight: 200, //200
                show: false,
                backgroundColor: '#FFFFFF',
                icon: path.join(__dirname, 'images/64x64.png'),
                title: 'SubstanceSoft',
              }
            );
            IPdialog.loadURL(url.format(
              {
                pathname: path.join(__dirname, 'ip.html'),
                protocol: 'file',
                slashes: true
              }));

              IPdialog.maximize();

              IPdialog.on('close',(event)=>
              {
                IPdialog = null;
              });
          }
        },
        {
          label: 'Configurar módulo de empleados', click()
          {
            Arduino  = new BrowserWindow(
              {
                webPreferences: {
                  nodeIntegration: true
                },
                titleBarStyle: 'hidden',
                maxWidth: 1024, //400
                maxHeight: 768, //200
                show: false,
                backgroundColor: '#FFFFFF',
                icon: path.join(__dirname, 'images/64x64.png'),
                title: 'SubstanceSoft',
              }
            );
            Arduino.loadURL(url.format(
              {
                pathname: path.join(__dirname, 'arduino/setup.html'),
                protocol: 'file',
                slashes: true
              }));

              Arduino.maximize();

              Arduino.on('close',(event)=>
              {
                Arduino = null;
              });
          }
        }
      ]
    }
  ]

  if (process.platform === 'darwin') {
    template.unshift({
      label: app.getName(),
      submenu: [
        { role: 'about' },
        { type: 'separator' },
        { role: 'services' },
        { type: 'separator' },
        { role: 'hide' },
        { role: 'hideothers' },
        { role: 'unhide' },
        { type: 'separator' },
        { role: 'quit' }
      ]
    })

    // Edit menu
    template[1].submenu.push(
      { type: 'separator' },
      {
        label: 'Speech',
        submenu: [
          { role: 'startspeaking' },
          { role: 'stopspeaking' }
        ]
      }
    )

    // Window menu
    template[3].submenu = [
      { role: 'close' },
      { role: 'minimize' },
      { role: 'zoom' },
      { type: 'separator' },
      { role: 'front' }
    ]
  }

  const menu = Menu.buildFromTemplate(template);
  Menu.setApplicationMenu(menu);

  var notificationService = new BrowserWindow(
    {
      titleBarStyle: 'hidden',
      //frame: false,
      show: false,
      backgroundColor: '#FFFFFF',
      webPreferences: {
        nodeIntegration: true
      }
    }
  );

  notificationService.loadURL(url.format(
    {
      pathname: path.join(__dirname, 'service.html'),
      protocol: 'file',
      slashes: true
    }));

  notificationService.maximize();

  notificationService.hide();

  notificationService.on('close', (event) => {
    if (closeAll) {
      notificationService = null;
    }
    else {
      event.preventDefault();
      notificationService.hide();
    }
  });

  mainWindow.on('close', () => {
    mainWindow = null;
    closeAll = true;
    notificationService.close();
    if(IPdialog!=null){
      IPdialog.close();
    }
  })

});
