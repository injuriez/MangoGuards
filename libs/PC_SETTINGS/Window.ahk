#Requires AutoHotkey v2.0
#Include ../FindText.ahk
#Include ../Modules.ahk

IsRobloxFullscreen() {
    Sleep(3000)

    if hwnd := WinExist("Roblox") {
        style := WinGetStyle(hwnd)

        WinGetPos(&x, &y, &width, &height, hwnd)

        MonitorGet(MonitorGetPrimary(), &screenLeft, &screenTop, &screenRight, &screenBottom)
        screenWidth := screenRight - screenLeft
        screenHeight := screenBottom - screenTop

        isFullscreen := !(style & 0xC00000)
            && width == screenWidth 
            && height == screenHeight
            && x == screenLeft 
            && y == screenTop
            
        return isFullscreen
    }
    return false
}
global fullscreen := IsRobloxFullscreen()

