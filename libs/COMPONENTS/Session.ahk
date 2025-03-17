#Requires Autohotkey v2

; Global variables
global myGui := "", timerText := "", totalSeconds := 0, Logs := "", countdownSeconds := 0

CreateSessionUI(modeText := "WINTER PORTAL [HOST]", type := "timer", logText := "") {
    global Logs
    myGui := Gui("-Caption +AlwaysOnTop ")
    
    ; Use the correct path to mango.png in the COMPONENTS directory
    imagePath := A_ScriptDir . "\mango.png"
    
    ; Check if file exists
    if !FileExist(imagePath) {
        MsgBox("Error: Image file not found at " . imagePath)
        ; Try alternate path
        imagePath := A_ScriptDir . "\mango.png"
        if !FileExist(imagePath) {
            ; If neither path works, create GUI without image
            myGui.SetFont("s10 Bold")
            myGui.Add("Text", "x88 y8 w186 h23 +0x200", modeText)
        } else {
            myGui.Add("Picture", "x16 y8 w63 h62", imagePath)
            myGui.SetFont("s10 Bold")
            myGui.Add("Text", "x88 y8 w186 h23 +0x200", modeText)
        }
    } else {
        myGui.Add("Picture", "x16 y8 w63 h62", imagePath)
        myGui.SetFont("s10 Bold")
        myGui.Add("Text", "x88 y8 w186 h23 +0x200", modeText)
    }

    if (type = "timer") {
        global timerText
        timerText := myGui.Add("Text", "x88 y40 w86 h23 +0x200", "⌚ 0:00:00")
        totalSeconds := 0
        SetTimer(UpdateTimer, 1000)
    } else if (type = "info") {
        Logs := myGui.Add("Text", "x88 y40 w186 h23 +0x200", logText)
    }

    myGui.OnEvent('Close', (*) => ExitApp())
    myGui.Title := "Window"

    ; Get screen dimensions
    screenWidth := A_ScreenWidth
    screenHeight := A_ScreenHeight

    ; GUI dimensions
    guiWidth := 381
    guiHeight := 82

    xPos := screenWidth - guiWidth - 10
    yPos := screenHeight - guiHeight - 10

    myGui.Show(Format("w{1} h{2} x{3} y{4}", guiWidth, guiHeight, xPos, yPos))
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

StartCountdown(seconds) {
    global countdownSeconds, Logs
    countdownSeconds := seconds
    SetTimer(UpdateCountdown, 1000)
}

UpdateCountdown() {
    global countdownSeconds, Logs
    if (countdownSeconds > 0) {
        minutes := Floor(countdownSeconds / 60)
        seconds := Mod(countdownSeconds, 60)
        Logs.Value := "Starting TinyTask in " . minutes . "m " . seconds . "s"
        countdownSeconds--
    } else {
        Logs.Value := "TinyTask Started"
        SetTimer(UpdateCountdown, "Off")
    }
}

CloseSessionUI() {
    ExitApp()
}
CreateSessionUI("Gem Farm", "timer")