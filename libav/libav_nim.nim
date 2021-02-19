const AVCODEC = "<libavcodec/avcodec.h>"
const AVFORMAT = "<libavformat/avformat.h>"
{.pragma: avcodec, importc, header: AVCODEC.}
{.pragma: avformat, importc, header: AVFORMAT.}

const test = "C:\\Users\\yovel\\Desktop\\final.mp4"

proc av_register_all(): void {.avcodec.}

type
    ByteIOContext {.avformat.} = object
    AVFormatContext {.avformat.} = ref object

proc av_format_open_input(context: var AVFormatContext, file: cstring, format: void, options: void): int {.avformat.}

#av_register_all()

var context: AVFormatContext

echo av_format_open_input(context, test)