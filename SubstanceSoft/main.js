const electron  = require('electron');
const {app, BrowserWindow, globalShorcut, Menu} = electron;
var path = require('path')

let mainWindow;

app.on('ready', () =>{
    mainWindow = new BrowserWindow(
        {
            titleBarStyle: 'hidden',
            minWidth: 1024,
            minHeight: 768,
            //frame: false,
            show: false,
            backgroundColor: '#bababa',
            icon: path.join(__dirname, 'images/64x64.png'),
            title: 'SubstanceSoft',
        }
    );
    mainWindow.setTitle('SubstanceSoft');
    mainWindow.loadURL('http://localhost/substancesoft/views/menus/index.php');

    mainWindow.maximize();
    mainWindow.on('close',()=>
    {
        mainWindow = null;
    })

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
            //{ role: 'toggledevtools' },
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
              label: 'Learn More',
              click () { require('electron').shell.openExternal('https://github.com/FFahrenheit/SubstanceSoft') }
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
});