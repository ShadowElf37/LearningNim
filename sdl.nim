import sdl2
include win32
from os import sleep

var lastFrame: uint32 = 0
proc tickFPS*(fps: int) =
    let desired = uint32(1000 / fps)
    let diff = getTicks() - lastFrame
    if desired > diff:
        sleep(int32(desired - diff)) # Delay to maintain steady frame rate
    lastFrame = getTicks()

const height = 480
const width = 640

discard sdl2.init(INIT_EVERYTHING)

echo "Creating window..."
var window = sdl2.createWindowFrom(cast[ptr int](getDesktopWindow()))
echo "Creating renderer!"
var renderer = window.createRenderer(-1, 0);

renderer.setDrawColor(0, 0, 0, 255)
renderer.present()

echo "Running mainloop!"
var
    evt = sdl2.defaultEvent
    runGame = true

while runGame:
    while pollEvent(evt):
        if evt.kind == QuitEvent:
            runGame = false
            break
    tickFPS(30)

window.destroy()