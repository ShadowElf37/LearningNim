import mpeg
import os

const vp = "C:\\Users\\yovel\\Desktop\\sample.mpg"

var player = plm_create_with_filename(vp)

var frame = player.plm_decode_video()

echo frame[]