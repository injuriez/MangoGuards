#Requires AutoHotkey v2.0
#Include libs/OCR.ahk
ShowScanArea(x, y, w, h) {
    ; Create a transparent window
    scan_area := Gui()
    scan_area.Opt("+AlwaysOnTop -Caption +ToolWindow")
    scan_area.BackColor := "Red"  ; Red border for visibility
    
    ; Make the window transparent
    WinSetTransparent(180, scan_area)
    
    ; Show the window at the scan coordinates
    scan_area.Show("x" x " y" y " w" w " h" h)
    
    ; Return the GUI object so we can destroy it later
    return scan_area
}
DetectPresentCurrency(x, y, width := 100, height := 30) {
    ; Adjust coordinates to scan slightly around the cursor position
    scanX := x - (width // 2)   ; Center the scan box on cursor X
    scanY := y - (height // 2)  ; Center the scan box on cursor Y
    
    ; Show the scan area for debugging
    scan_box := ShowScanArea(scanX, scanY, width, height)
    
    ; Scan region with adjusted coordinates
    result := OCR.FromRect(scanX, scanY, width, height)
    
    ; Wait 2 seconds then destroy the visual box
    SetTimer(() => scan_box.Destroy(), -2000)
    
    if (result.Text) {
        ; Make the pattern matching more flexible
        if (RegExMatch(result.Text, "\D*(\d+)\D*", &match)) {  ; Match numbers with optional non-digits
            found := result.FindString(match[1])
            OutputDebug("Full text found: " result.Text "`n")  ; Debug output
            MsgBox("Found presents: " match[1] "`nAt position: X=" found.x " Y=" found.y
                   "`nFull text: " result.Text)
            return {
                amount: match[1],
                X: found.x,
                Y: found.y,
                text: result.Text
            }
        }
    }
    return false
}

F1:: {
    MouseMove(1135, 899)  ; Move to the text position
    Sleep(100)  ; Add small delay for stability
    
    ; Scan a smaller area around the mouse position
    if (presents := DetectPresentCurrency(1135, 899, 100, 30)) {  ; Reduced width and height
        OutputDebug("Found " presents.amount " presents at X:" presents.X " Y:" presents.Y "`n")
        
        ; Show smaller visual debug box at exact detection location
        debugBox := ShowScanArea(presents.X, presents.Y, 25, 15)
        SetTimer(() => debugBox.Destroy(), -3000)
        
    } else {
        ; Show where we're actually scanning with smaller box
        debugBox := ShowScanArea(1135 - 50, 899 - 15, 100, 30)
        SetTimer(() => debugBox.Destroy(), -3000)
        MsgBox("No present currency found. Debug box shows scan area.")
    }
}