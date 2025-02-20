#Requires AutoHotkey v2.0
#Include OCR.ahk

BetterClick(x, y) {
    MouseMove(x, y)
    sleep 10
    MouseMove(1, 0, , "R")
    sleep 20
    MouseClick("Left", -1, 0, , , , "R")
    Sleep(50)
}



ShowScanArea(x, y, w, h) {
    scan_area := Gui()
    scan_area.Opt("+AlwaysOnTop -Caption +ToolWindow")
    scan_area.BackColor := "Red"
    WinSetTransparent(180, scan_area)
    scan_area.Show("x" x " y" y " w" w " h" h)
    return scan_area
}

ExtractNumber(text) {
    ; Remove all non-digit characters
    cleaned := RegExReplace(text, "[^\d]", "")
    return cleaned
}

DetectPresentCurrency(x, y, width := 100, height := 40) {
    scan_box := ShowScanArea(x, y, width, height)
    result := OCR.FromRect(x, y, width, height)
    SetTimer(() => scan_box.Destroy(), -3000)
    
    if (result.Text) {
        ; Extract any numbers from the text
        number := ExtractNumber(result.Text)
        if (number != "") {
            found := result.FindString(result.Text)
            OutputDebug("Full text found: " result.Text "`nExtracted number: " number "`n")
            
            return {
                amount: Integer(number),    ; Clean number for calculations
                raw_text: result.Text,      ; Original text
                X: found.x,
                Y: found.y
            }
        }
    }
    return false
}

CurrencyGrab() {
    MouseMove(1082, 879)
    Sleep(1000)
    targetX := 1082
    targetY := 879
    
    if (presents := DetectPresentCurrency(targetX, targetY, 100, 40)) {
        ToolTip("Found number: " presents.amount
             . "`nOriginal text: " presents.raw_text
             . "`nAt position: X:" presents.X " Y:" presents.Y)
    } else {
        ToolTip("No present currency found in scan area.")
    }
}