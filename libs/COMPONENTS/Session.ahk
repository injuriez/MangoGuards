#Requires Autohotkey v2

; Global variables
global myGui := "", timerText := "", totalSeconds := 0

CreateSessionUI(modeText := "WINTER PORTAL [HOST]") {
    ; Create GUI with options for no caption (prevents moving) and always on top
    myGui := Gui("-Caption +AlwaysOnTop +ToolWindow")
    myGui.Add("Picture", "x16 y8 w63 h62", "C:\Users\Peyto\Downloads\mango.png")
    myGui.SetFont("s10 Bold")
    myGui.Add("Text", "x88 y8 w186 h23 +0x200", modeText)

    ; Create timer text control with a variable reference - explicitly declare as global
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

    ; Calculate position for bottom right corner
    xPos := screenWidth - guiWidth - 10  ; 10px margin from right edge
    yPos := screenHeight - guiHeight - 10  ; 10px margin from bottom edge

    ; Reset timer variables
    totalSeconds := 0

    ; Show the GUI at the calculated position
    myGui.Show(Format("w{1} h{2} x{3} y{4}", guiWidth, guiHeight, xPos, yPos))

    ; Set up timer function to update display every second
    SetTimer(UpdateTimer, 1000)
}

; Update timer display function
UpdateTimer() {
    global timerText, totalSeconds
    
    ; Increment seconds
    totalSeconds++
    
    ; Format time as h:mm:ss
    hours := Floor(totalSeconds / 3600)
    minutes := Floor(Mod(totalSeconds, 3600) / 60)
    seconds := Mod(totalSeconds, 60)
    
    ; Update display
    timerText.Value := Format("⌚ {1}:{2:02}:{3:02}", hours, minutes, seconds)
}

; Function to reset the timer
ResetTimer() {
    global totalSeconds
    totalSeconds := 0
}

; Function to close the UI
CloseSessionUI() {
    ExitApp()
}

; Example of how to use the function - uncomment to test
; CreateSessionUI()