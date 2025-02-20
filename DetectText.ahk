#Requires AutoHotkey v2.0
#Include libs/OCR.ahk

; Create a GUI to show the scan area
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

; Test hotkey - now includes coordinate display
F1:: {
    MouseGetPos(&mouseX, &mouseY)
    ToolTip("Testing at X:" mouseX " Y:" mouseY)
    if (presents := DetectPresentCurrency(mouseX, mouseY, 150, 40)) {  ; Increased scan area
        OutputDebug("Found " presents.amount " presents at X:" presents.X " Y:" presents.Y "`n")
    } else {
        MsgBox("No present currency found at X:" mouseX " Y:" mouseY)
    }
    SetTimer(() => ToolTip(), -3000)  ; Clear tooltip after 3 seconds
}
F2::ExitApp  ; Press F2 to exit