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



BetterMouseMove(targetX, targetY, speed := 2) {
    MouseGetPos(&startX, &startY)
    count := 25  ; number of steps
    
    Loop count {
        progress := A_Index / count
        currentX := startX + (targetX - startX) * progress
        currentY := startY + (targetY - startY) * progress
        MouseMove(Round(currentX), Round(currentY))
        Sleep(speed)
    }
}