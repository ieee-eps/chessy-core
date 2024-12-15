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

let audio = new Audio('sounds/boot.mp3');

function setView(name) {
    document.querySelectorAll('.view').forEach(el => {
        if(el.id === name) {
            el.classList.add("visible");
        } else {
            el.classList.remove("visible");
        }
    })
}

document.addEventListener('DOMContentLoaded', async () => {
    setView("home_view")
    audio.play();
    document.querySelector("#abc").innerHTML = await awaitButton();
})