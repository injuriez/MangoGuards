#Requires AutoHotkey v2.0


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

LookDown() 
{
    BetterClick(700, 299)  
    
    loop 40 
    {
        SendInput("{WheelUp}")
        Sleep 50
    }
    Sleep 1000
    
    SendInput(Format("{Click {} {} Left}", 949, 929))
    Sleep 1000
    
    loop 100 
    {
        SendInput("{WheelDown}")
        Sleep 50
    }
}


SmoothMouseMove(targetX, targetY, speed := 2) {
    MouseGetPos(&startX, &startY)
    count := 10  ; Reduced number of steps for efficiency
   
    Loop count {
        progress := A_Index / count
        currentX := startX + (targetX - startX) * progress
        currentY := startY + (targetY - startY) * progress
        MouseMove(Round(currentX), Round(currentY))
        Sleep(speed)
    }
}


