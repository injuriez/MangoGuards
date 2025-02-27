#Requires AutoHotkey v2.0
#Include ../FindText.ahk
#Include ../Modules.ahk
; Thanks claude for this :3
IsRobloxFullscreen() {
    static WS_CAPTION := 0xC00000   

    if hwnd := WinExist("Roblox") {
        style := WinGetStyle(hwnd)
        WinGetPos(&x, &y, &width, &height, hwnd)


        monitorIndex := MonitorFromWindow(hwnd)
        MonitorGet(monitorIndex, &screenLeft, &screenTop, &screenRight, &screenBottom)
        screenWidth := screenRight - screenLeft
        screenHeight := screenBottom - screenTop

        isFullscreen := !(style & WS_CAPTION)
            && width >= screenWidth - 1  
            && height >= screenHeight - 1
            && Abs(x - screenLeft) < 5   
            && Abs(y - screenTop) < 5
            
        return isFullscreen
    }
    return false
}


MonitorFromWindow(hwnd) {
    MonitorCount := MonitorGetCount()
    WinGetPos(&wx, &wy, &ww, &wh, hwnd)
    windowCenterX := wx + ww/2
    windowCenterY := wy + wh/2
    
    bestMonitor := MonitorGetPrimary()
    
    Loop MonitorCount {
        MonitorGet(A_Index, &left, &top, &right, &bottom)
        if (windowCenterX >= left && windowCenterX <= right 
            && windowCenterY >= top && windowCenterY <= bottom) {
            return A_Index
        }
    }
    
    return bestMonitor
}

global fullscreen := IsRobloxFullscreen()

