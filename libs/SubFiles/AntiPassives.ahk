#Requires AutoHotkey v2.0

ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, ImagePath, Tolerance := 30) {
    try {
        ; Store the previous CoordMode and set to Screen
        prevCoordMode := A_CoordModePixel
        CoordMode "Pixel", "Screen"


        ; Perform the image search with specified tolerance
        result := ImageSearch(&FoundX, &FoundY, X1, Y1, X2, Y2, "*" Tolerance " " ImagePath)

        ; Restore previous CoordMode if needed
        if (prevCoordMode != "Screen")
            CoordMode "Pixel", prevCoordMode

        ; Return and log results
        if (result) {
            return true
        } else {
            return false
        }
    } catch as e {
        MsgBox("Error in ImageSearchWrapper: " e.Message . " " . ImagePath)

        return false
    }
}


okay() {

    loop {
        ; Break the loop if the "TinyTaskRE.ahk" window does not exist (even if minimized)
        
        if ImageSearchWrapper(&FoundX, &FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, A_ScriptDir . "\..\Images\Buttons\okay.png", 50) {
            ; If the image is found, move the mouse to the coordinates and click
            MouseMove(FoundX, FoundY)
            Click
        } else {
            Sleep(100) ; Add a small delay to reduce CPU usage
        }
    }
}

okay()