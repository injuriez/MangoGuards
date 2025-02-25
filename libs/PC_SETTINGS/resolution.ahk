#Requires AutoHotkey v2.0

; Add this function to your script
GetDisplayInfo() {
    ; Get primary monitor resolution
    primaryMonitor := MonitorGetPrimary()
    
    ; Get full resolution of primary monitor
    MonitorGet(primaryMonitor, &Left, &Top, &Right, &Bottom)
    width := Right - Left
    height := Bottom - Top
    
    ; Get DPI scaling
    hDC := DllCall("GetDC", "Ptr", 0)
    dpiX := DllCall("GetDeviceCaps", "Ptr", hDC, "Int", 88)  ; LOGPIXELSX
    dpiY := DllCall("GetDeviceCaps", "Ptr", hDC, "Int", 90)  ; LOGPIXELSY
    DllCall("ReleaseDC", "Ptr", 0, "Ptr", hDC)
    
    ; Calculate scaling percentage (96 is standard DPI)
    scaling := dpiX / 96 * 100
    
    return {
        width: width,
        height: height,
        scaling: scaling
    }
}

; Add this to your CreateGui() function after myGui := Gui("+AlwaysOnTop")
displayInfo := GetDisplayInfo()


; You can store these values globally if needed:
global screenWidth := displayInfo.width
global screenHeight := displayInfo.height
global displayScaling := displayInfo.scaling

