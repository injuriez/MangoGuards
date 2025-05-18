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



ChangeLogs(msg) {
    try {
        ; Use the correct path to the settings folder
        logFilePath := A_ScriptDir . "\..\..\Settings\MangoSettings\session\LastLog.txt"
        
        ; Ensure the directory exists
        SplitPath(logFilePath, , &dir)
        if !FileExist(dir) {
            DirCreate(dir)
        }

        ; Open the file in write mode
        LogFile := FileOpen(logFilePath, "w", "UTF-8")
        if (LogFile) {
            LogFile.WriteLine(msg) ; Overwrite the log file with the new message
            LogFile.Close()
            return true
        } else {
            ; Silent fail - no MsgBox to avoid interrupting script
            MsgBox("Error: Unable to open log file at " . logFilePath)
            return false
        }
    } catch as e {
        ; Silent fail - no MsgBox to avoid interrupting script
        MsgBox("Error in ChangeLogs: " . e.Message)
        return false
    }
}