SetDisplayInfo() {
    ; Change resolution first
    result := ChangeResolution(1920, 1080)
    
    ; Then change DPI scaling to 100%
    scaleResult := SetDPIScaling(100)
    
    if (result != 0) {
        MsgBox("Programmatic resolution change failed. Trying alternate method...")
        ; Fallback to a more direct approach
        Run "rundll32.exe display.dll,SetDisplayResolution 1920 1080"
    }
    
    if (scaleResult != 0) {
        MsgBox("DPI scaling change may require logout/restart to take effect")
    }
}

SetDPIScaling(dpi := 100) {
    DllCall("SetProcessDPIAware")
    

    logPixels := dpi * 96 / 100
 
    try {
   
        RegWrite(logPixels, "REG_DWORD", "HKEY_CURRENT_USER\Control Panel\Desktop", "LogPixels")
        

        RegWrite(0, "REG_DWORD", "HKEY_CURRENT_USER\Control Panel\Desktop", "Win8DpiScaling")
        

        RegWrite(dpi, "REG_DWORD", "HKEY_CURRENT_USER\Control Panel\Desktop", "Win8DpiScaling")
        RegWrite(0, "REG_DWORD", "HKEY_CURRENT_USER\Control Panel\Desktop", "DpiScalingVer")
        
     
        RegWrite(logPixels, "REG_DWORD", "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics", "AppliedDPI")
        

        DllCall("User32\SystemParametersInfo", "UInt", 0x009F, "UInt", 0, "Ptr", 0, "UInt", 1)
        
        MsgBox("DPI scaling set to " dpi "%. You may need to log out and back in for changes to take effect.")
        return 0
    } catch as err {
        MsgBox("Failed to set DPI scaling: " err.Message)
        return 1
    }
}

ChangeResolution(w, h) {

    dm := Buffer(156, 0)
    NumPut("UShort", 156, dm, 0)  
    

    if (DllCall("EnumDisplaySettingsA", "Ptr", 0, "UInt", -1, "Ptr", dm)) {
        
        NumPut("UInt", 0x00080000 | 0x00100000, dm, 40)  
        NumPut("UInt", w, dm, 108)  
        NumPut("UInt", h, dm, 112)  
        
        result := DllCall("ChangeDisplaySettingsA", "Ptr", dm, "UInt", 0x01)
        
        if (result == 0)
            MsgBox("Resolution changed successfully")
        else if (result == 1)
            MsgBox("Resolution will change after restart")
        else if (result == -1)
            MsgBox("Failed: Invalid parameters")
        else if (result == -2)
            MsgBox("Failed: The settings could not be written to registry")
        else
            MsgBox("Failed with code: " result)
            
        return result
    } else {
        MsgBox("Failed to get current display settings")
        return -3
    }
}