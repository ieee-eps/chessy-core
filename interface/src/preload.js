const { contextBridge, ipcRenderer  } = require('electron')

contextBridge.exposeInMainWorld('chessy', {
    awaitButton: () => function() {
        return new Promise((resolve, reject) => {
            ipcRenderer.emit("awaitButton")

            ipcRenderer.once("awaitButtonResponse", (data) => {
                resolve(data)
            })
        })
    }
})

