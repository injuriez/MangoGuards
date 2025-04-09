#Requires AutoHotkey v2.0



ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, ImagePath, Tolerance := 50) {
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

yes() {
    global X1 := 0
    global Y1 := 5
    global X2 := 1000
    global Y2 := 1100
    

    if (ImageSearchWrapper(&FoundX, &FoundY, 0, 5, 1000, 1100, A_ScriptDir . "\LegendCards\Rewards.png", 100)) {
        MsgBox("Heroes image found at " FoundX ", " FoundY)
        MouseMove(FoundX, FoundY)
    } else {
        MsgBox("Heroes image not found")
    }
}
F1::yes()