proc SystemParametersInfoA*(cmd: cuint, arg1: cuint, arg2: cstring, flags: cuint): bool {.importc, dynlib: "User32.dll".}

proc getDesktopWindow*(): uint64 {.importc, header: "deskhandle.h", cdecl.}
# proc GetModuleFileNameA(hmodule: pointer, into_buffer: array[MAX_PATH, char], size: cdouble): uint {.importc, dynlib: "Kernel32.dll", cdecl.}

proc setDesktop*(img_path: cstring): bool =
    # 0x0014 is set desktop command
    # 0s are nonsense and flags - there are some nice flags but many of them slow the operation down dramatically
    SystemParametersInfoA(0x0014, 0, img_path, 0)

echo getDesktopWindow()