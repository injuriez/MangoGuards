#Include libs\OCR.ahk

findMultiplier(*) {
    ; Scan entire screen
    result := OCR.FromRect(0, 0, A_ScreenWidth, A_ScreenHeight)
    
    if (result.Text) {
        ; Pattern matches "x" followed by numbers with comma
        ; More flexible regex to catch variations like x2,400 x12,500 etc.
        if (RegExMatch(result.Text, "x\d{1,3}(?:,\d{3})+", &match)) {
            found := result.FindString(match[0])
            OutputDebug("Found text: " match[0] " at " found.x "," found.y "`n")
            return {
                multiplier: match[0],
                X: found.x,
                Y: found.y
            }
        }
    }
    return false
}

checkMultiplier() {
    if (mult := findMultiplier()) {
        MsgBox("Located multiplier: " mult.multiplier "`n")
        MouseMove(mult.X, mult.Y)
        ; Optional: Add click or other actions here
    }
}

; Hotkeys
k::SetTimer(checkMultiplier, 100)  ; Faster scanning interval (100ms)
j::SetTimer(checkMultiplier, 0)    ; Pause scanning
1::ExitApp                         ; Exit script

; Optional: Add visual feedback
; showFound(text, x, y) {
;     ToolTip("Found: " text, x, y)
;     SetTimer () => ToolTip(), -1000  ; Hide after 1 second
; }