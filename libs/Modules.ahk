#Requires AutoHotkey v2.0
#Include OCR.ahk

BetterClick(x, y) {
    MouseMove(x, y)
    Sleep(10)
    MouseMove(1, 0, , "R")
    Sleep(20)
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

DetectPresentCurrency(x, y, width := 160, height := 45) {
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
    MouseMove(1133, 901) ; 1133, 901;1064, 877
    Sleep(1000)
    targetX := 1133
    targetY := 901
    
    if (presents := DetectPresentCurrency(targetX, targetY, 170, 45)) {
        ToolTip("Found number: " presents.amount
             . "`nOriginal text: " presents.raw_text
             . "`nAt position: X:" presents.X " Y:" presents.Y)
    } else {
        ToolTip("No present currency found in scan area.")
    }
}