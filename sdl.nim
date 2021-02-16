import sdl2
import sdl2/image
include win32
from os import sleep

var lastFrame: uint32 = 0
proc tickFPS*(fps: int) =
    let desired = uint32(1000 / fps)
    let diff = getTicks() - lastFrame
    if desired > diff:
        sleep(int32(desired - diff)) # Delay to maintain steady frame rate
    lastFrame = getTicks()

const dir = "C:\\Users\\yovel\\Desktop\\Background"

let images = getFilesInDir(dir)

discard image.init(IMG_INIT_PNG)
discard sdl2.init(INIT_EVERYTHING)

echo "Creating window..."
var window = sdl2.createWindowFrom(cast[ptr int](getDesktopWindow()))
echo "Creating renderer!"
var renderer = window.createRenderer(-1, Renderer_Accelerated or Renderer_PresentVsync);

renderer.setDrawColor(0, 0, 0)


echo "Running mainloop!"
var
    evt = sdl2.defaultEvent
    runGame = true

    i = 0
    img_name: string
    img: TexturePtr

while runGame:
    while pollEvent(evt):
        if evt.kind == QuitEvent:
            runGame = false
            break

    img_name = images[i mod images.len]
    img = renderer.loadTexture(img_name)
    inc(i)
    echo img_name

    renderer.clear()
    # DRAW
    renderer.copy(img, nil, nil)
    renderer.present()

    img.destroyTexture()
    tickFPS(24)

window.destroy()