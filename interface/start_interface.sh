
function run_s() {
  export DISPLAY=:0
  xhost +
  npx electron ./interface/src/index.js
}

startx & run_s