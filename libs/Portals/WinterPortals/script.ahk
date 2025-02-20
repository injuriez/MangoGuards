#Requires AutoHotkey v2.0
#Include ../../AllText.ahk
#Include ../../Modules.ahk
#Include ../../FindText.ahk
#Include ../../../TinyTaskRE.ahk



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
    ; Starts tiny task
    connection.Value := "[CONNECTED]"
    Send("{F8 down}")
    Sleep(100)
    Send("{F8 up}")
    Sleep(1000)
    loop {
        if (ok:=FindText(&X, &Y, 1033-150000, 345-150000, 1033+150000, 345+150000, 0, 0, PortalPicker))
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
    if (ok:=FindText(&X, &Y, 684-150000, 249-150000, 684+150000, 249+150000, 0, 0, Failed))
        {


          Sleep(2000)
          PickPortalsAGAIN()
        } 
        else {
            x_offset := 0  ; Initialize x_offset
            MouseMove(749 + x_offset, 500)
      
            loop {
                if (FindText(&X, &Y, 697-150000, 603-150000, 697+150000, 603+150000, 0, 0, Namek)) {
                    MouseGetPos(&mouseX, &mouseY)
                    BetterClick(mouseX, mouseY + 90)
                    Sleep(2000)
                    ; find the yes button
                    Yesbutton()
                    break
                } else if (FindText(&X, &Y, 697-150000, 603-150000, 697+150000, 603+150000, 0, 0, shibuya)) {
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
    loop {
        if (ok:=FindText(&X, &Y, 962-150000, 556-150000, 962+150000, 556+150000, 0, 0, cancel)) {
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
            PickPortalsAGAIN()
            break
        } else {
            if (ok:=FindText(&X, &Y, 961-150000, 556-150000, 961+150000, 556+150000, 0, 0, darkerCancel)) {
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
                PickPortalsAGAIN()
                

                break
            }
             
        }
    }
}

PickPortalsAGAIN() {
    MouseMove(546, 813)
    Sleep(1000)
    BetterClick(432, 813)
    row := 0
        col := 0
        loop {
            MouseMove(570 + (col * 150), 447 + (row * 100))  ; Move to the current item
            Sleep(1000)

            if (FindText(&X, &Y, 697-150000, 603-150000, 697+150000, 603+150000, 0, 0, Namek)) {
                ; Adjust coordinates to be relative to the window
                MouseGetPos(&mouseX, &mouseY)
                BetterClick(mouseX, mouseY)
                Sleep(1000)
                ;clicks on the use button
                if (FindText(&X, &Y, 846-150000, 557-150000, 846+150000, 557+150000, 0, 0, yes)) {
                    ; Adjust coordinates to be relative to the window
                    BetterClick(X , Y - 30)
                    StartTinyTask()
                    Sleep(2000)

                }

            } else {
                ; Move to next item
                col++
                if (col >= 6) {
                    col := 0
                    row++
                }
                Sleep(100)
            }
        }
        
}

findvoting() {
    loop {
        if (ok:=FindText(&X, &Y, 923-150000, 129-150000, 923+150000, 129+150000, 0, 0, voteDectect))
            {
              ; if find voting ui then start countdown
              Countdown(0, "Found Voting UI")
              Sleep(5000)
              Countdown(20, "")
              
            }
    }
}


WinterPortal() {

    ; Countdown(20)  ; 20-second countdown timer

    ; Check if in the lobby
    if (FindText(&X, &Y, 602-150000, 259-150000, 602+150000, 259+150000, 0, 0, LobbyCheck)) {
        BetterClick(1495, 227)  ; Close leaderboard
        Sleep(1000)
        Send("{Tab}")  ; Close chat/UI
        Sleep(100)
        Send("{j}")  ; Open item menu
        Sleep(2000)
        BetterClick(1180, 326 - 10)  ; Click search bar

        ; Type "Winter Portal" letter by letter
        text := "winter portal"
        for each, char in StrSplit(text) {
            Send(char)
            Sleep(100)
        }
        Sleep(1000)  ; Wait for items to load

        ; Get the position of the window
        WinGetPos(&winX, &winY, &winWidth, &winHeight, "A")

        ; Search for "Winter Portal" in inventory
        row := 0
        col := 0
        loop {
            MouseMove(570 + (col * 150), 447 + (row * 100))  ; Move to the current item
            Sleep(1000)

            if (FindText(&X, &Y, 697-150000, 603-150000, 697+150000, 603+150000, 0, 0, Namek)) {
                ; Adjust coordinates to be relative to the window
                MouseGetPos(&mouseX, &mouseY)
                BetterClick(mouseX, mouseY)
                ; Found Portal so lets press the use button after clicking
                ;clicks on the use button
                loop {
                    if (FindText(&X, &Y, 763-150000, 538-150000, 763+150000, 538+150000, 0, 0, usebutton)) {
                        ; Adjust coordinates to be relative to the window
                        BetterClick(X , Y - 30)
                        Sleep(2000)
                        ; finds and press the create button 
      

                        loop {
                            if (ok:=FindText(&X, &Y, 804-150000, 538-150000, 804+150000, 538+150000, 0, 0, create)) {
                                BetterClick(X, Y)
                                Sleep(100)
                                break
    
                            } else {
    
                                if (ok:=FindText(&X, &Y, 814-150000, 537-150000, 814+150000, 537+150000, 0, 0, darkerCreate)) {
                                    BetterClick(X, Y)
                                    Sleep(100)
                                    break
                                }
                            }
                        }
                            
                        
                        ; 
                        Sleep(35000)
        
                        Loop {
                            if (ok := FindText(&X, &Y, 183-150000, 794-150000, 183+150000, 794+150000, 0, 0, NamekLoading)) {
                                Countdown(0, "Loading into [planet namek]")
                                Sleep(2000)
                                findvoting()
                                Sleep(500)
                                break
                            }
                        }
    
    
                    }
                }

            } else {
                ; Move to next item
                col++
                if (col >= 6) {
                    col := 0
                    row++
                }
                Sleep(100)
            }
        }
    }
}

