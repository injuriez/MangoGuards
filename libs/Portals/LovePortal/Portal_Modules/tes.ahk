#Requires AutoHotkey v2.0
look() {


    global X1 := 0
    global Y1 := 500
    global X2 := 800
    global Y2 := 1100
    

    if ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, A_ScriptDir . "/../../../Images/LoadingScreens/PlanetNamek.png", 50) {
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