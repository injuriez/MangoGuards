#Requires AutoHotkey v2.0
look() {


global X1 := 1200 ; left of the box
global Y1 := 1000 ; top of the box
global X2 := 1700  ; right of the box
global Y2 := 700 ; bottom of the box

    if ImageSearchWrapper(&FoundX, &FoundY, 1200, 200, 1700, 500, A_ScriptDir . "/../../../Images/LovePortalPOS/Namek/middle.png", 125) {
        MouseMove(FoundX, FoundY)
        Sleep(500)
        Random()
        Sleep(500)
        return
    } else {
        MsgBox("Quake image not found")
    }
}
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
        MsgBox("Error in ImageSearchWrapper: " e.Message)
        return false
    }
}


F1::look()
F2::ExitApp()