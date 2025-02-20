#Requires AutoHotkey v2.0
#Include ../../AllText.ahk
#Include ../../Modules.ahk
#Include ../../FindText.ahk
#Include ../../../TinyTaskRE.ahk

global connection

Countdown(seconds, text) {
    global CountdownText
    if seconds == 0 {
        CountdownText.Text := text  ; Clear the countdown text
    } else {
        Loop (seconds) {
            CountdownText.Text := "Starting in " seconds - A_Index " seconds..."
            Sleep(1000)
        }
        CountdownText.Text := ""  ; Clear the countdown text
        StartTinyTask()

    }
}
StartTinyTask() {
    global connection
    ; Starts tiny task
    connection.Text := "[CONNECTED]"
    Send("{F8 down}")
    Sleep(100)
    Send("{F8 up}")
    Sleep(1000)
    loop {
        if (ok:=FindText(&X, &Y, 1040-150000, 345-150000, 1040+150000, 345+150000, 0, 0, PortalPicker))
            {
              Sleep(1000)
              Send("{F8 down}")
              Sleep(100)
              Send("{F8 up}")
              Sleep(500)
              CollectRewards()
              CountdownText.Value := ""
              break

            }
    }
}

CollectRewards() {
    if (ok:=FindText(&X, &Y, 670-150000, 245-150000, 670+150000, 245+150000, 0, 0, Failed))
        {


          Sleep(2000)
          PickPortalsAGAIN()
        } 
        else {
            x_offset := 0  ; Initialize x_offset
            MouseMove(749 + x_offset, 500)
      
            loop {
                if (FindText(&X, &Y, 1292-150000, 617-150000, 1292+150000, 617+150000, 0, 0, Namek)) {
                    MouseGetPos(&mouseX, &mouseY)
                    BetterClick(mouseX, mouseY + 90)
                    Sleep(2000)
                    ; find the yes button
                    Yesbutton()
                    break
                } else if (FindText(&X, &Y, 1062-150000, 581-150000, 1062+150000, 581+150000, 0, 0, shibuya)) {
                    MouseGetPos(&mouseX, &mouseY)
                    BetterClick(mouseX, mouseY + 90)
                    Sleep(2000)
                    ; find the yes button
                    Yesbutton()
                    break
                } else {
                    BetterClick(749 + x_offset, 500)  ; Click the starting position
                    Sleep(2000)
                }
                x_offset += 170  ; Increase x_offset by 170 for next loop
            }
            
        }
      ; Move mouse to starting position
  
}
Yesbutton() {
    loop {
        if (ok:=FindText(&X, &Y, 846-150000, 557-150000, 846+150000, 557+150000, 0, 0, yes)) {
            BetterClick(X, Y)
            Sleep(500)
            CancelButton()
            Sleep(1000)
            break
        } else {
            if (ok:=FindText(&X, &Y, 853-150000, 556-150000, 853+150000, 556+150000, 0, 0, darkerYes)) {
                BetterClick(X, Y)
                Sleep(2000)
                CancelButton()
                Sleep(1000)
                break
            }
        }
    }
}
CancelButton() {
    global presents
    loop {
        if (ok:=FindText(&X, &Y, 961-150000, 569-150000, 961+150000, 569+150000, 0, 0, cancel)) {
            BetterClick(X, Y - 20)
            Sleep(2000)
            Sleep(500)
            BetterClick(X, Y)
            Sleep(500)
            BetterClick(X, Y)
            Sleep(500)
            BetterClick(X, Y)
            Sleep(500)
            BetterClick(X, Y)
            Sleep(1000)
            if (ok:=FindText(&X, &Y, 620-150000, 715-150000, 620+150000, 715+150000, 0, 0, PresentsThreeThousand))
                {
                  presents := presents + 3000
                  CountdownText.Text := "Presents - " presents
                }
            PickPortalsAGAIN()
            break
        } 
             
    }
}

PickPortalsAGAIN() {
    ; Initialize base coordinates and spacing
    baseX := 531
    baseY := 432
    colSpacing := 160
    rowSpacing := 150
    
    ; Track scrolling
    scrollCount := 0
    maxScrolls := 3

    MouseMove(546, 813)
    Sleep(1000)
    BetterClick(432, 813)
    
    while (scrollCount <= maxScrolls) {
        row := 0
        col := 0
        namekFound := false

        while (row < 3) {
            while (col < 6) {
                SmoothMouseMove(baseX + (col * colSpacing), baseY + (row * rowSpacing))
                Sleep(1000)

                if (FindText(&X, &Y, 697-150000, 603-150000, 697+150000, 603+150000, 0, 0, Namek)) {
                    namekFound := true
                    MouseGetPos(&mouseX, &mouseY)
                    BetterClick(mouseX, mouseY)
                    Sleep(1000)
                    
                    if (FindText(&X, &Y, 846-150000, 557-150000, 846+150000, 557+150000, 0, 0, yes)) {
                        BetterClick(X, Y - 30)
                        StartTinyTask()
                        Sleep(2000)
                        break
                    }
                }
                col++
            }
            col := 0
            row++
            if (namekFound)
                break
        }

        if (!namekFound) {
            SmoothMouseMove(baseX, baseY + (2 * rowSpacing))
            Sleep(200)
            Send("{WheelDown}")
            Sleep(1000)
            scrollCount++
        } else {
            break
        }
    }
}
findvoting() {
    loop {
        if (ok:=FindText(&X, &Y, 925-150000, 109-150000, 925+150000, 109+150000, 0, 0, voteDectect))
            {
              ; if find voting ui then start countdown
              Countdown(0, "Found Voting UI")
              Sleep(5000)
              Countdown(20, "")
              
            }
    }
}
SmoothMouseMove(targetX, targetY, speed := 2) {
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


WinterPortal() {
    baseX := 531
    baseY := 432
    
    ; Grid spacing
    colSpacing := 160
    rowSpacing := 150
    
    ; Track scrolling
    scrollCount := 0
    maxScrolls := 3

    if (FindText(&X, &Y, 602-150000, 259-150000, 602+150000, 259+150000, 0, 0, LobbyCheck)) {
        BetterClick(1495, 227)
        Sleep(1000)
        Send("{Tab}")
        Sleep(100)
        Send("{j}")
        Sleep(2000)
        BetterClick(1180, 326 - 10)
        
        text := "winter portal"
        for each, char in StrSplit(text) {
            Send(char)
            Sleep(100)
        }
        Sleep(1000)

        WinGetPos(&winX, &winY, &winWidth, &winHeight, "A")

        while (scrollCount <= maxScrolls) {
            row := 0
            col := 0
            namekFound := false

            while (row < 3) {
                while (col < 6) {
                    SmoothMouseMove(baseX + (col * colSpacing), baseY + (row * rowSpacing))
                    Sleep(500) 

                    if (FindText(&X, &Y, 697-150000, 603-150000, 697+150000, 603+150000, 0, 0, Namek)) {
                        namekFound := true
                        MouseGetPos(&mouseX, &mouseY)
                        BetterClick(mouseX, mouseY)
                        
                        loop {
                            if (FindText(&X, &Y, 744-150000, 554-150000, 744+150000, 554+150000, 0, 0, usebutton)) {
                                BetterClick(X, Y)
                                Sleep(2000)
                                
                                loop {
                                    if (ok := FindText(&X, &Y, 787-150000, 549-150000, 787+150000, 549+150000, 0, 0, create)) {
                                        BetterClick(X, Y)
                                        Sleep(100)
                                        break
                                    }
                                }
                                
                                Sleep(35000)
                        
                                Loop {
                                    if (ok := FindText(&X, &Y, 138-150000, 842-150000, 138+150000, 842+150000, 0, 0, NamekLoading)) {
                                        Countdown(0, "Loading into [planet namek]")
                                        Sleep(2000)
                                        findvoting()
                                        Sleep(500)
                                        break
                                    }
                                }
                                break
                            }
                        }
                    }
                    col++
                }
                col := 0
                row++
            }

            if (!namekFound) {
                SmoothMouseMove(baseX, baseY + (2 * rowSpacing))
                Sleep(200)
                Send("{WheelDown}")
                Sleep(1000)
                scrollCount++
            } else {
                break
            }
        }
    }
}