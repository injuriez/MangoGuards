#Requires AutoHotkey v2.0
#Include ../../AllText.ahk
#Include ../../Modules.ahk
#Include ../../FindText.ahk
#Include ../../../TinyTaskRE.ahk

global connection
global SelectedWorldd := "."  ; Assign a default value
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
    Loop {
        if (ok := FindText(&X, &Y, 1040-150000, 345-150000, 1040+150000, 345+150000, 0, 0, PortalPicker))
            {
              Sleep(1000)
              Send("{F8 down}")
              Sleep(100)
              Send("{F8 up}")
              Sleep(500)
              CollectRewards()
              CountdownText.Text := ""
              break

            } else {
                if (ok:=FindText(&X, &Y, 667-150000, 247-150000, 667+150000, 247+150000, 0, 0, Failed))
                    {
                        Sleep(500)
                        PickPortalsAGAIN()
                        CountdownText.Text := ""
                        break
                    }
            }
    }
}

CollectRewards() {
    ; Define portal positions
    portals := [
        {x: 722, y: 500},  ; Left portal
        {x: 960, y: 500},  ; Middle portal
        {x: 1194, y: 499}  ; Right portal
    ]

    ; Function to check a specific world type
    CheckWorldType(worldType) {
        for portal in portals {
            BetterMouseMove(portal.x, portal.y)
            Sleep(500)
            
            switch worldType {
                case "Namek":
                    if (FindText(&X, &Y, 1292-150000, 617-150000, 1292+150000, 617+150000, 0, 0, Namek)) {
                        BetterClick(portal.x, portal.y + 120)
                        Sleep(2000)
                        Yesbutton()
                        return true
                    }
                case "Shibuya":
                    if (FindText(&X, &Y, 1062-150000, 581-150000, 1062+150000, 581+150000, 0, 0, shibuya)) {
                        BetterClick(portal.x, portal.y + 120)
                        Sleep(2000)
                        Yesbutton()
                        return true
                    }
                case "Spider":
                    if (FindText(&X, &Y, 1061-150000, 618-150000, 1061+150000, 618+150000, 0, 0, spider)) {
                        BetterClick(portal.x, portal.y + 120)
                        Sleep(2000)
                        Yesbutton()
                        return true
                    }
            }
            
            ; Check next portal
            if (A_Index < portals.Length) {
                BetterClick(portal.x, portal.y)
                Sleep(2000)
            }
        }
        return false
    }

    ; Check worlds in priority order
    if (!CheckWorldType("Namek")) {
        if (!CheckWorldType("Shibuya")) {
            CheckWorldType("Spider")
        }
    }
}


Yesbutton() {
    loop {
        if (ok:=FindText(&X, &Y, 841-150000, 568-150000, 841+150000, 568+150000, 0, 0, yes)) {
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
    ; global presents
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
            PickPortalsAGAIN()
            break
        } 
             
    }
}

PickPortalsAGAIN() {
    if (SelectedWorldd == "Namek") {
        PickNamekAgain()

    } 
    if (SelectedWorldd == "Shibuya") {
        PickShibuyaAgain()

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

WinterPortal(world) {
    SelectedWorldd := world ; Assign world to SelectedWorldd
    
    if (world = "Namek") {
        namekworld()
    } else if (world = "Shibuya") {
        shibuyaworld()
    }
}



namekworld() {
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


shibuyaworld() {
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
            Shibuya := false

            while (row < 3) {
                while (col < 6) {
                    SmoothMouseMove(baseX + (col * colSpacing), baseY + (row * rowSpacing))
                    Sleep(500) 

                    if (FindText(&X, &Y, 1154-150000, 620-150000, 1154+150000, 620+150000, 0, 0, ShibuyaPortal)) {
                        Shibuya := true
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
                                                       
                                Loop {
                                    if (ok := FindText(&X, &Y, 175-150000, 914-150000, 175+150000, 914+150000, 0, 0, shibuyaloading)) {
                                        Countdown(0, "Loading into [Shibuya]")
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

            if (!Shibuya) {
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
PickNamekAgain() {
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
                    
                    if (FindText(&X, &Y, 838-150000, 568-150000, 838+150000, 568+150000, 0, 0, yesagain)) {
                        BetterClick(X, Y)
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


PickShibuyaAgain() {
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
        shibuya := false

        while (row < 3) {
            while (col < 6) {
                SmoothMouseMove(baseX + (col * colSpacing), baseY + (row * rowSpacing))
                Sleep(1000)

                if (FindText(&X, &Y, 1154-150000, 620-150000, 1154+150000, 620+150000, 0, 0, ShibuyaPortal)) {
                    shibuya := true
                    MouseGetPos(&mouseX, &mouseY)
                    BetterClick(mouseX, mouseY)
                    Sleep(1000)
                    
                    if (FindText(&X, &Y, 838-150000, 568-150000, 838+150000, 568+150000, 0, 0, yesagain)) {
                        BetterClick(X, Y)
                        StartTinyTask()
                        Sleep(2000)
                        break
                    }
                }
                col++
            }
            col := 0
            row++
            if (shibuya)
                break
        }

        if (!shibuya) {
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