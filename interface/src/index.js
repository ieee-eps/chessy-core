const { app, BrowserWindow, ipcMain } = require('electron');
const path = require('node:path');
const Gpio = require("onoff").Gpio;

const PIN_OFFSET = 512;

const pin_btn_1 = new Gpio(PIN_OFFSET+26, "in", "both");
const pin_btn_2 = new Gpio(PIN_OFFSET+19, "in", "both");
const pin_btn_3 = new Gpio(PIN_OFFSET+13, "in", "both");
const pin_btn_4 = new Gpio(PIN_OFFSET+6, "in", "both");
const pin_btn_5 = new Gpio(PIN_OFFSET+5, "in", "both");

const btn = [
  pin_btn_1,
  pin_btn_2,
  pin_btn_3,
  pin_btn_4,
  pin_btn_5
]

function unwatchAll() {
  btn.forEach(v => {
    v.unwatch();
  })
}

function awaitButton() {
  return new Promise((resolve, reject) => {
    let delayer = null;
    btn.forEach((b, i) => {
      b.watch((_, v) => {
        if(v===1) return;
        if(delayer) clearTimeout(delayer);
        delayer = setTimeout(() => {
          unwatchAll();
          resolve(i+1)
        }, 100);
      })
    })
  })
}

const createWindow = () => {
  const mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    frame: false,
    titleBarStyle: "hidden",
    autoHideMenuBar: true,
    webPreferences: {
      preload: path.join(__dirname, 'preload.js')
    },
  });

  mainWindow.loadFile(path.join(__dirname, './public/index.html'));
};

app.whenReady().then(() => {
  createWindow();

  ipcMain.on("awaitButton", async () => {
    ipcMain.emit("awaitButtonResponse", await awaitButton());
  })

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow();
    }
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});
