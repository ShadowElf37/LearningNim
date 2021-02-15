import os
from times import cpuTime
from math import round
from strutils import parseInt, intToStr
import win32
from memfiles import nil
import streams
#import vapoursynth as vs

const MAX_PATH = 260

#proc loopVideo(video: string) =
    #let frame_server = vs.Source(video)
    #for frame in frame_server:
    #    echo frame


proc getFilesInDir(dir: string): seq[string] =
    for file in walkDirRec(dir):
        result.add(file)

if paramCount() >= 1:
    let target = paramStr(0)

    if fileExists target:
        echo setDesktop(target)
    else:
        raise newException(ValueError, "No file or folder provided.")

let sampleA = "C:\\Users\\yovel\\Desktop\\6.bmp"
let sampleB = "C:\\Users\\yovel\\Desktop\\test.bmp"
let target = "C:\\Users\\yovel\\Desktop\\Background"
let video = "C:\\Users\\yovel\\Desktop\\sample.mov"

