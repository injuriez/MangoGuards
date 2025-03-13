#Requires Autohotkey v2

; Global variables
global myGui := "", timerText := "", totalSeconds := 0

CreateSessionUI(modeText := "WINTER PORTAL [HOST]") {
    myGui := Gui("-Caption +AlwaysOnTop +ToolWindow")
    
    ; Create the image path and check if it exists
    imagePath := A_ScriptDir "\libs\COMPONENTS\mango.png"
    
    ; Debug message box to show the path
    MsgBox("Looking for image at: " imagePath "`nFile exists: " (FileExist(imagePath) ? "Yes" : "No"))
    
    ; Try to add the picture, with fallback if it fails
    try {
        myGui.Add("Picture", "x16 y8 w63 h62", imagePath)
    } catch Error as e {
        MsgBox("Error loading image: " e.Message)
        ; Add text instead as fallback
        myGui.Add("Text", "x16 y8 w63 h62", "🥭")
    }
    
    myGui.SetFont("s10 Bold")
    myGui.Add("Text", "x88 y8 w186 h23 +0x200", modeText)

    global timerText
    timerText := myGui.Add("Text", "x88 y40 w86 h23 +0x200", "⌚ 0:00:00")

    myGui.OnEvent('Close', (*) => ExitApp())
    myGui.Title := "Window"

    ; Get screen dimensions
    screenWidth := A_ScreenWidth
    screenHeight := A_ScreenHeight

    ; GUI dimensions
    guiWidth := 381
    guiHeight := 82

    xPos := screenWidth - guiWidth - 10  ;
    yPos := screenHeight - guiHeight - 10 

    totalSeconds := 0

    myGui.Show(Format("w{1} h{2} x{3} y{4}", guiWidth, guiHeight, xPos, yPos))

    SetTimer(UpdateTimer, 1000)
}


UpdateTimer() {
    global timerText, totalSeconds
    

    totalSeconds++
    

    hours := Floor(totalSeconds / 3600)
    minutes := Floor(Mod(totalSeconds, 3600) / 60)
    seconds := Mod(totalSeconds, 60)

    minStr := minutes < 10 ? "0" . minutes : minutes
    secStr := seconds < 10 ? "0" . seconds : seconds
    
 
    timerText.Value := "⌚ " . hours . ":" . minStr . ":" . secStr
}

ResetTimer() {
    global totalSeconds
    totalSeconds := 0
}

CloseSessionUI() {
    ExitApp()
}
