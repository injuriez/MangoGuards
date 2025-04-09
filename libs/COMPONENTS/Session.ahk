#Requires Autohotkey v2

; Global variables
global myGui := "", timerText := "", totalSeconds := 0, sessionSeconds := 0, Logs := "", countdownSeconds := 0, ratio
global timeFilePath := A_ScriptDir . "\..\Settings\MangoSettings\session\stats\TotalTimeUsage.txt"
global lastSavedSeconds := 0  
global wins := 0
global losses := 0
global Wins := "", Losses := "" 
LoadSavedTime() {
    global timeFilePath, totalSeconds
    
    if FileExist(timeFilePath) {
        try {
            timeFile := FileOpen(timeFilePath, "r")
            savedTime := timeFile.ReadLine()
            timeFile.Close()
            
            if IsInteger(savedTime)
                totalSeconds := Integer(savedTime)
        } catch {
            totalSeconds := 0
        }
    }
}

SaveCurrentTime() {
    global timeFilePath, totalSeconds, sessionSeconds, lastSavedSeconds
    
    try {
        incrementSeconds := sessionSeconds - lastSavedSeconds
        lastSavedSeconds := sessionSeconds
        totalSeconds += incrementSeconds

        SplitPath(timeFilePath, , &dir)
        if !FileExist(dir)
            DirCreate(dir)
        
        timeFile := FileOpen(timeFilePath, "w")
        timeFile.WriteLine(totalSeconds)
        timeFile.Close()
    } catch as e {
        MsgBox("Error saving time: " . e.Message)
    }
}

CloseGuiHandler(*) {
    SaveCurrentTime()
    ExitApp()
}

CreateSessionUI(modeText := "WINTER PORTAL [HOST]", type := "timer", logText := "") {
    global Logs, myGui, sessionSeconds, Wins, Losses, ratio, Logss

    ; Check if SessionUI.txt exists and read its value
    sessionUIFilePath := A_ScriptDir . "\..\Settings\ShowSessionUI.txt"
    sessionUIEnabled := false  ; Default to false if the file doesn't exist or is invalid

    if FileExist(sessionUIFilePath) {
        try {
            sessionUIFile := FileOpen(sessionUIFilePath, "r")
            sessionUIValue := Trim(sessionUIFile.ReadLine())
            sessionUIFile.Close()

            if (sessionUIValue = "true") {
                sessionUIEnabled := true
            }
        } catch {
            sessionUIEnabled := false
        }
    }

    ; If SessionUI.txt is false, do not create the UI
    if !sessionUIEnabled {
        MsgBox("Session UI is disabled. Exiting...")
        return
    }

    sessionSeconds := 0

    ; Load previous time
    LoadSavedTime()
    
    ModeText := FileOpen("../Settings/MangoSettings/session/SessionName.txt", "r")
    modeText := ModeText.ReadLine()
    Type := FileOpen("../Settings/MangoSettings/session/TypeSession.txt", "r")
    type := Type.ReadLine()
    myGui := Gui("-Caption +AlwaysOnTop")

    ; Set the background color
    myGui.BackColor := "0x18181b"
    myGui.SetFont("s10 Bold cFFFFFF", "Karla")

    ; Add your controls here
    imagePath := A_ScriptDir . "\mango.png"
    if !FileExist(imagePath) {
        MsgBox("Error: Image file not found at " . imagePath)
    } else {
        myGui.Add("Picture", "x16 y8 w63 h62", imagePath)
    }
    myGui.SetFont("s13")
    myGui.Add("Text", "x88 y15 w158 h30", modeText)


    if (type = "timer") {
        global timerText
        myGui.SetFont("s9")
    
        initialTimeDisplay := "⌚ 0:00:00"
        timerText := myGui.Add("Text", "x88 y40 w80 h20", initialTimeDisplay)
        ratio := myGui.Add("Text", "x168 y40 w70 h20", "W/L: 0/0") 
        Logss := myGui.Add("Text", "x88 y56 w180 h18 +0x200", "null")

        SetTimer(UpdateTimer, 1000)
        SetTimer(CheckLogs, 1000) ; Check logs every 1 second

        CheckStats()
    } else if (type = "info") {
        Logs := myGui.Add("Text", "x88 y40 w186 h23 +0x200", logText)
    }

    myGui.OnEvent('Close', CloseGuiHandler)
    myGui.Title := "Window"

    screenWidth := A_ScreenWidth
    screenHeight := A_ScreenHeight
    guiWidth := 381
    guiHeight := 82
    xPos := screenWidth - guiWidth - 10
    yPos := screenHeight - guiHeight - 10

    ; Show the GUI
    myGui.Show(Format("w{1} h{2} x{3} y{4}", guiWidth, guiHeight, xPos, yPos))

    ; Set rounded corners
    SetRoundedCorners(myGui.Hwnd, guiWidth, guiHeight, 20)
}

SetRoundedCorners(hWnd, width, height, radius) {
    hRgn := DllCall("CreateRoundRectRgn", "Int", 0, "Int", 0, "Int", width + 1, "Int", height + 1, "Int", radius, "Int", radius, "Ptr")
    DllCall("SetWindowRgn", "Ptr", hWnd, "Ptr", hRgn, "Int", true)
}

UpdateTimer() {
    global timerText, sessionSeconds

    sessionSeconds++
    
    hours := Floor(sessionSeconds / 3600)
    minutes := Floor(Mod(sessionSeconds, 3600) / 60)
    seconds := Mod(sessionSeconds, 60)

    minStr := minutes < 10 ? "0" . minutes : minutes
    secStr := seconds < 10 ? "0" . seconds : seconds
    
    timerText.Value := "⌚ " . hours . ":" . minStr . ":" . secStr
    CheckStats()
    SaveCurrentTime()
}
CheckStats() {
    global ratio

    ; Read wins and losses from files
    winsFile := FileOpen(A_ScriptDir . "\..\Settings\MangoSettings\session\stats\wins.txt", "r")
    if winsFile {
        winsValue := winsFile.ReadLine()
        winsFile.Close()
    } else {
        winsValue := "0"
    }

    lossesFile := FileOpen(A_ScriptDir . "\..\Settings\MangoSettings\session\stats\losses.txt", "r")
    if lossesFile {
        lossesValue := lossesFile.ReadLine()
        lossesFile.Close()
    } else {
        lossesValue := "0"
    }

    ; Update the ratio text only if ratio is valid
    if IsObject(ratio) {
        ratio.Text := "W/L: " . winsValue . "/" . lossesValue
    } else {
        MsgBox("Warning: 'ratio' is not initialized.")
    }
}


CheckLogs() {
    global Logss, sessionSeconds, wins, losses, ratio

    ; Read logs from file
    logsFile := FileOpen(A_ScriptDir . "\..\Settings\MangoSettings\session\LastLog.txt", "r")
    if logsFile {
        logText := logsFile.ReadLine()
        logsFile.Close()
    } else {
        logText := "[ No logs found ]"
    }

    ; Update the Logs text
    Logss.Value := logText
}
ResetTimer() {
    global totalSeconds
    totalSeconds := 0
    SaveCurrentTime()
}

CloseSessionUI() {
    SaveCurrentTime()
    ExitApp()
}

CreateSessionUI("winter portal [host]", "timer")
F2::Reload