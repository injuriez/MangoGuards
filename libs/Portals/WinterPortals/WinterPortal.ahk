#Requires AutoHotkey v2.0
#Include ../../AllText.ahk
#Include ../../Modules.ahk
#Include ../../FindText.ahk

Tier10 := "|<>*75$27.zzzzzzzzzzzwTzsy0zy3U3zUM0Ts201y0EQDk27Vy0Ew7y27kzkEy7y27kzkEw7y27VzkEQDy201zkM0Ty3U3zsy1zU"


PlayerPosition() {
    
    MsgBox("Press okay once you found your position")
    Sleep(5000)
    StartTinyTask()
}

StartTinyTask() {
    ChangeLogs("Starting TinyTask")
    Send("{F8 down}")
    Sleep(100)
    Send("{F8 up}")
    Sleep(500)
    
    Sleep(1000)
    WinORloserChecker()
}



WinORloserChecker() {
    global X1 := 214
    global Y1 := 5
    global X2 := 1600
    global Y2 := 600
    ChangeLogs("awaiting rewards")

    Loop {
      
        Sleep(500)
        if ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, A_ScriptDir . "\..\..\Images\status\portal.png", 50) {
            ChangeLogs("Picking The Rewards")
            Sleep(1000)
            Send("{F8 down}")
            Sleep(100)
            Send("{F8 up}")
            Sleep(500)
            CollectRewards()
            try {
                if FileExist("../../Settings/MangoSettings/session/stats/wins.txt") {
                    Wins := FileOpen("../../Settings/MangoSettings/session/stats/wins.txt", "r")
                    currentWins := Integer(Wins.ReadLine())
                    Wins.Close()
                } else {
                    currentWins := 0
                }
                
          
                Wins := FileOpen("../../Settings/MangoSettings/session/stats/wins.txt", "w")
                Wins.Write(currentWins + 1)
                Wins.Close()
                

                if FileExist("../../Settings/MangoSettings/session/stats/TotalWins.txt") {
                    TotalWins := FileOpen("../../Settings/MangoSettings/session/stats/TotalWins.txt", "r")
                    TotalCurrentWins := Integer(TotalWins.ReadLine())
                    TotalWins.Close()
                } else {
                    TotalCurrentWins := 0
                }
                
                TotalWins := FileOpen("../../Settings/MangoSettings/session/stats/TotalWins.txt", "w")
                TotalWins.Write(TotalCurrentWins + 1)
                TotalWins.Close()
            } catch as e {
                MsgBox("Error updating win stats: " e.Message)
            }
            Sleep(500)
            
            break
        } else {
            Sleep(500)
            
            if ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, A_ScriptDir . "\..\..\Images\status\failed.png", 50) {
                Sleep(1000)
                Send("{F8 down}")
                Sleep(100)
                Send("{F8 up}")
                Sleep(500)
                try {
                    if FileExist("../../Settings/MangoSettings/session/stats/losses.txt") {
                        loss := FileOpen("../../Settings/MangoSettings/session/stats/losses.txt", "r")
                        currentLosses := Integer(loss.ReadLine())
                        loss.Close()
                    } else {
                        currentLosses := 0
                    }
         
                    loss := FileOpen("../../Settings/MangoSettings/session/stats/losses.txt", "w")
                    loss.Write(currentLosses + 1)
                    loss.Close()
                } catch as e {
                    MsgBox("Error updating loss stats: " e.Message)
                }
                Sleep(2000)
                PickPortalsAGAIN()
                break
            } else {
                if (ok := FindText(&X, &Y, 668-150000, 247-150000, 668+150000, 247+150000, 0, 0, shibuyafailed)) {
                    Sleep(1000)
                    Send("{F8 down}")
                    Sleep(100)
                    Send("{F8 up}")
                    Sleep(500)
                    Sleep(2000)
                    PickPortalsAGAIN()
                    break
                }
            }
        }
    }
}

CollectRewards() {
    ChangeLogs("Collecting Rewards")
    portals := [
        {x: 722, y: 500},
        {x: 960, y: 500},
        {x: 1194, y: 499}
    ]

    CheckWorldType(worldType) {
        for portal in portals {
            BetterMouseMove(portal.x, portal.y)
            Sleep(500)
            
            switch worldType {
                case "Namek":
                    if (FindText(&X, &Y, 1292-150000, 617-150000, 1292+150000, 617+150000, 0, 0, Namek)) {
                        BetterClick(portal.x, portal.y + 120)
                        Sleep(2000)
                        Yesbutton1()
                        return true
                    }
                case "Shibuya":
                    if (FindText(&X, &Y, 1062-150000, 581-150000, 1062+150000, 581+150000, 0, 0, shibuya)) {
                        BetterClick(portal.x, portal.y + 120)
                        Sleep(2000)
                        Yesbutton1()
                        return true
                    }
                case "Spider":
                    if (FindText(&X, &Y, 1061-150000, 618-150000, 1061+150000, 618+150000, 0, 0, spider)) {
                        BetterClick(portal.x, portal.y + 120)
                        Sleep(2000)
                        Yesbutton1()
                        return true
                    }
            }
            
            if (A_Index < portals.Length) {
                BetterClick(portal.x, portal.y)
                Sleep(2000)
            }
        }
        return false
    }

    if (!CheckWorldType("Namek")) {
        if (!CheckWorldType("Shibuya")) {
            CheckWorldType("Spider")
        }
    }
}

Yesbutton1() {
    loop {
        if (ok := FindText(&X, &Y, 841-150000, 568-150000, 841+150000, 568+150000, 0, 0, yes)) {
            BetterClick(X, Y)
            Sleep(500)
            CancelButton1()
            Sleep(1000)
            break
        } else {
            if (ok := FindText(&X, &Y, 853-150000, 556-150000, 853+150000, 556+150000, 0, 0, darkerYes)) {
                BetterClick(X, Y)
                Sleep(2000)
                CancelButton1()
                Sleep(1000)
                break
            }
        }
    }
}

CancelButton1() {
    loop {
        if (ok := FindText(&X, &Y, 961-150000, 569-150000, 961+150000, 569+150000, 0, 0, cancel)) {
            BetterClick(X, Y - 20)
            Sleep(2000)
            Sleep(500)
            BetterClick(X, Y)
            Sleep(500)
            BetterClick(X, Y)
            Sleep(500)
            BetterClick(X, Y)
            Sleep(500)
            webhook()
            BetterClick(X, Y)
            Sleep(1000)
            Sleep(1000)
            PickPortalsAGAIN()
            break
        } 
    }
}

PickPortalsAGAIN() {
    Setting := FileOpen("../../Settings/MangoSettings/map.txt", "r")
    World := Setting.ReadLine()
    leech := FileOpen("../../Settings/MangoSettings/WinterPortal/leech.txt", "r")
    LeechValue := leech.ReadLine()
    
    if (World == "Namek") {
        
        PickNamekAgain()
    } else if (World == "Shibuya") {
        PickShibuyaAgain()
    } 
}

findvoting() {
    ChangeLogs("Searching for Voting")
    loop {
        if (ok := FindText(&X, &Y, 925-150000, 109-150000, 925+150000, 109+150000, 0, 0, voteDectect)) {
            ChangeLogs("Found voting screen")
            Sleep(5000)
            PlayerPosition()
        }
    }
}

WinterPortal() {
    ChangeLogs("Searching for portals")

    Setting := FileOpen("../../Settings/MangoSettings/map.txt", "r")
    World := Setting.ReadLine()
    
    
    if (World == "Namek")
        
        namekworld()
        
    else if (World == "Shibuya")
        shibuyaworld()
        
}


namekworld() {
    baseX := 531
    baseY := 432
    colSpacing := 160
    rowSpacing := 150
    
    BetterClick(556, 319)
    Sleep(1000)
    Send("{Tab}")
    Sleep(100)
    Send("{j}")
    Sleep(2000)
    BetterClick(556, 319)
    
    text := "winter portal"
    for each, char in StrSplit(text) {
        Send(char)
        Sleep(100)
    }
    Sleep(1000)

    WinGetPos(&winX, &winY, &winWidth, &winHeight, "A")
    namekFound := false
    
    while (!namekFound) {
        row := 0
        col := 0

        while (row < 3 && !namekFound) {
            while (col < 6 && !namekFound) {
                targetX := baseX + (col * colSpacing)
                targetY := baseY + (row * rowSpacing)
                
                SmoothMouseMove(targetX, targetY)
                Sleep(300)
                
                ; Check for normal Namek portal
                if (FindText(&X, &Y, 697-150000, 603-150000, 697+150000, 603+150000, 0, 0, Namek)) {
                    ; Check if it's a Tier 10 portal
                    if (!FindText(&X, &Y, 1442-150000, 559-150000, 1442+150000, 559+150000, 0, 0, Tier10)) {
                        ; Not a Tier 10 portal, move to next portal
                        col++
                        continue
                    }
                    
                    ; This is a Tier 10 portal
                    namekFound := true
                    MouseGetPos(&mouseX, &mouseY)
                    BetterClick(mouseX, mouseY)
                    Sleep(500)
                    
                    useButtonFound := false
                    loop 30 {
                        if (FindText(&X, &Y, 744-150000, 554-150000, 744+150000, 554+150000, 0, 0, usebutton)) {
                            BetterClick(X, Y)
                            Sleep(2000)
                            BetterClick(781, 553)
                            Sleep(1000)
                            BetterClick(966, 553)
                            useButtonFound := true
                            break
                        }
                        Sleep(100)
                    }
                    
                    if (useButtonFound) {
                        loadingFound := false
                       
                        Loop {
                            if ImageSearchWrapper(&FoundX, &FoundY, 0, 500, 800, 1100, A_ScriptDir . "\..\..\Images\LoadingScreens\PlanetNamek.png", 50) {
                                ChangeLogs("Found Loading Screen")
                                Sleep(2000)
                                
                                findvoting()
                                Sleep(500)
                                loadingFound := true
                                break
                            }
                            Sleep(100)
                        }
                        
                        if (!loadingFound) {
                            namekFound := false
                        }
                    } else {
                        namekFound := false
                    }
                } else {
                    ; No Namek portal found, move to next position
                    col++
                }
            }
            
            if (!namekFound) {
                col := 0
                row++
            }
        }

        if (!namekFound) {
            SmoothMouseMove(winWidth/2, winHeight/2)
            Sleep(200)
            
            Loop 5 {
                Send("{WheelDown}")
                Sleep(150)
            }
            
            Sleep(1000)
            baseY := 432
        }
    }
}
shibuyaworld() {
    baseX := 531
    baseY := 432
    colSpacing := 160
    rowSpacing := 150

    BetterClick(556, 319)
    Sleep(1000)
    Send("{Tab}")
    Sleep(100)
    Send("{j}")
    Sleep(2000)
    BetterClick(556, 319)

    text := "winter portal"
    for each, char in StrSplit(text) {
        Send(char)
        Sleep(100)
    }
    Sleep(1000)

    WinGetPos(&winX, &winY, &winWidth, &winHeight, "A")
    Shibuya := false

    while (!Shibuya) {
        row := 0
        col := 0

        while (row < 3 && !Shibuya) {
            while (col < 6 && !Shibuya) {
                targetX := baseX + (col * colSpacing)
                targetY := baseY + (row * rowSpacing)
                
                SmoothMouseMove(targetX, targetY)
                Sleep(300)

                ; Check for normal Shibuya portal
                if (FindText(&X, &Y, 1154-150000, 620-150000, 1154+150000, 620+150000, 0, 0, ShibuyaPortal)) {
                    ; Check if it's a Tier 10 portal
                    if (!FindText(&X, &Y, 1442-150000, 559-150000, 1442+150000, 559+150000, 0, 0, Tier10)) {
                        ; Not a Tier 10 portal, move to next portal
                        col++
                        continue
                    }
                    
                    ; This is a Tier 10 portal
                    Shibuya := true
                    MouseGetPos(&mouseX, &mouseY)
                    BetterClick(mouseX, mouseY)
                    Sleep(500)
                    
                    useButtonFound := false
                    loop 30 { 
                        if (FindText(&X, &Y, 744-150000, 554-150000, 744+150000, 554+150000, 0, 0, usebutton)) {
                            BetterClick(X, Y)
                            Sleep(2000)
                            BetterClick(781, 553) 
                            Sleep(1000)
                            BetterClick(966, 553) 
                            useButtonFound := true
                            break
                        }
                        Sleep(100)
                    }

                    if (useButtonFound) {
                        loadingFound := false
                        Loop  { 
                            if ImageSearchWrapper(&FoundX, &FoundY, 0, 500, 800, 1100, A_ScriptDir . "\..\..\Images\LoadingScreens\ShibuyaLoading.png", 50) {
                                ChangeLogs("Found Loading Screen")
                                Sleep(2000)
                                findvoting()
                                Sleep(500)
                                loadingFound := true
                                break
                            }
                            Sleep(100)
                        }

                        if (!loadingFound) {
                            Shibuya := false  
                        }
                    } else {
                        Shibuya := false  
                    }
                } else {
                    ; No Shibuya portal found, move to next position
                    col++
                }
            }
            
            if (!Shibuya) {
                col := 0
                row++
            }
        }

        if (!Shibuya) {
            SmoothMouseMove(winWidth/2, winHeight/2)
            Sleep(200)
            Loop 5 {
                Send("{WheelDown}")
                Sleep(150)
            }

            Sleep(1000)
            baseY := 432
        }
    }
}
PickNamekAgain() {
    global offset := 0 
    global MaxRowCheck := 0
    global RowsOnScreen := 0
    portals := [
        {x: 529, y: 444},
        {x: 704, y: 444},
        {x: 875, y: 448},
        {x: 1045, y: 444},
        {x: 1219, y: 442},
        {x: 1387, y: 442}
    ]
    
    ; Set PixelGetColor to use screen coordinates in RGB mode
    CoordMode("Pixel", "Screen")
    
    ; Setup
    Sleep(1000)
    BetterClick(432, 813)
    Sleep(1000)
    SmoothMouseMove(portals[1].x, portals[1].y + offset, 0)

    
    while true { 
        for portal in portals {
            Sleep(600)
            SmoothMouseMove(portal.x, portal.y + offset, 0)
            MaxRowCheck += 1

            ; Check for Namek portal
            if (FindText(&X, &Y, 697-150000, 603-150000, 697+150000, 603+150000, 0, 0, Namek)) {
                ; Check if it's a Tier 10 portal
                if (!FindText(&X, &Y, 1442-150000, 559-150000, 1442+150000, 559+150000, 0, 0, Tier10)) {
                    ; Not a Tier 10 portal, move to next portal
                    continue
                }
                
                ; This is a Tier 10 portal
                MouseGetPos(&mouseX, &mouseY)
                BetterClick(mouseX, mouseY)
                Sleep(500)
                
                if (FindText(&X, &Y, 838-150000, 568-150000, 838+150000, 568+150000, 0, 0, yesagain)) {
                    BetterClick(X, Y)
                    StartTinyTask()
                    Sleep(2000)
                    return ; Exit after finding the portal
                }
            }
            ; pixel color check for 
            MouseGetPos(&mouseX, &mouseY)
            if (mouseX != "" && mouseY != "") { ; Ensure valid coordinates
                color := PixelGetColor(mouseX, mouseY)
                if (color = "0x0D0D0D") { ; Stop if the color is 161616
                    BetterClick(1480, 217)
                    Sleep(1000)
                    BetterClick(1449, 829)
                }
            } else {
                MsgBox("Invalid mouse coordinates.")
                return
            }
        }
        
        ; Check if the row is complete
        if MaxRowCheck >= 6 {
            RowsOnScreen += 1 ; Increment the number of rows on screen
            offset += 150 ; Move to the next row
            MaxRowCheck := 0 ; Reset the counter for the next row
        }
        
        ; Scroll down after checking 3 rows
        if RowsOnScreen >= 3 {
            MouseMove(960, 540) ; Move to center of screen (adjust as needed)
            Loop 3 {  ; Send multiple wheel down commands
                Send "{WheelDown}"
                Sleep(50)
            }
            offset := 0 ; Reset the offset for the next set of rows
            RowsOnScreen := 0 ; Reset the row counter after scrolling
        }
        
        ; Exit condition if no more rows to process
        if offset > 600 { ; Adjust this value based on the number of rows
            MsgBox("Finished scanning all rows.")
            break
        }
    }
}

PickShibuyaAgain() {
    global offset := 0 
    global MaxRowCheck := 0
    global RowsOnScreen := 0
    portals := [
        {x: 529, y: 444},
        {x: 704, y: 444},
        {x: 875, y: 448},
        {x: 1045, y: 444},
        {x: 1219, y: 442},
        {x: 1387, y: 442}
    ]
    
    ; Set PixelGetColor to use screen coordinates in RGB mode
    CoordMode("Pixel", "Screen")
    
    ; Setup
    Sleep(1000)
    BetterClick(432, 813)
    Sleep(1000)
    SmoothMouseMove(portals[1].x, portals[1].y + offset, 0)
    
    while true { 
        for portal in portals {
            Sleep(600)
            SmoothMouseMove(portal.x, portal.y + offset, 0)
            MaxRowCheck += 1

            ; Check for Shibuya portal
            if (FindText(&X, &Y, 1154-150000, 620-150000, 1154+150000, 620+150000, 0, 0, ShibuyaPortal)) {
                ; Check if it's a Tier 10 portal
                if (!FindText(&X, &Y, 1442-150000, 559-150000, 1442+150000, 559+150000, 0, 0, Tier10)) {
                    ; Not a Tier 10 portal, move to next portal
                    continue
                }
                
                ; This is a Tier 10 portal
                MouseGetPos(&mouseX, &mouseY)
                BetterClick(mouseX, mouseY)
                Sleep(500)
                
                if (FindText(&X, &Y, 838-150000, 568-150000, 838+150000, 568+150000, 0, 0, yesagain)) {
                    BetterClick(X, Y)
                    StartTinyTask()
                    Sleep(2000)
                    return ; Exit after finding the portal
                }
            }
            ; pixel color check for 
            MouseGetPos(&mouseX, &mouseY)
            if (mouseX != "" && mouseY != "") { ; Ensure valid coordinates
                color := PixelGetColor(mouseX, mouseY)
                if (color = "0x0D0D0D") { ; Stop if the color is 161616
                    BetterClick(1480, 217)
                    Sleep(1000)
                    BetterClick(1449, 829)
                }
            } else {
                MsgBox("Invalid mouse coordinates.")
                return
            }
        }
        
        ; Check if the row is complete
        if MaxRowCheck >= 6 {
            RowsOnScreen += 1 ; Increment the number of rows on screen
            offset += 150 ; Move to the next row
            MaxRowCheck := 0 ; Reset the counter for the next row
        }
        
        ; Scroll down after checking 3 rows
        if RowsOnScreen >= 3 {
            MouseMove(960, 540) ; Move to center of screen (adjust as needed)
            Loop 3 {  ; Send multiple wheel down commands
                Send "{WheelDown}"
                Sleep(50)
            }
            offset := 0 ; Reset the offset for the next set of rows
            RowsOnScreen := 0 ; Reset the row counter after scrolling
        }
        
        ; Exit condition if no more rows to process
        if offset > 600 { ; Adjust this value based on the number of rows
            MsgBox("Finished scanning all rows.")
            break
        }
    }
}

closepassives() {
    DetectHiddenWindows(true)
    scriptTitle := "ahk_class AutoHotkey ahk_exe AutoHotkey*.exe"
    
    if WinExist("AntiPassives.ahk - AutoHotkey") {
        ; Use PostMessage to gracefully exit the script
        PostMessage(0x111, 65307, 0,, "AntiPassives.ahk - AutoHotkey")
        return true
    } else if WinExist("AntiPassives.ahk ahk_class AutoHotkey") {
        ; Alternative window title format
        PostMessage(0x111, 65307, 0,, "AntiPassives.ahk ahk_class AutoHotkey")
        return true
    } else {
        return false
    }
}
WinterPortal()
F2::StopApp()
StopApp() {
    try {

        EraseWins := FileOpen("../../Settings/MangoSettings/session/stats/wins.txt", "w")
        EraseWins.Write(0)  
        EraseWins.Close()
        

        EraseLosses := FileOpen("../../Settings/MangoSettings/session/stats/losses.txt", "w")
        EraseLosses.Write(0)
        EraseLosses.Close()
    } catch as e {
        MsgBox("Error resetting stats: " e.Message)
    }
    closepassives()
    ExitApp()
}
webhook() {
    Run(A_ScriptDir "\..\..\webhook.ahk")   
}
ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, ImagePath, Tolerance := 30) {
    try {
        ; Store the previous CoordMode and set to Screen
        prevCoordMode := A_CoordModePixel
        CoordMode "Pixel", "Screen"


        ; Perform the image search with specified tolerance
        result := ImageSearch(&FoundX, &FoundY, X1, Y1, X2, Y2, "*" Tolerance " " ImagePath)

        ; Restore previous CoordMode if needed
        if (prevCoordMode != "Screen")
            CoordMode "Pixel", prevCoordMode

        ; Return and log results
        if (result) {
            return true
        } else {
            return false
        }
    } catch as e {
        MsgBox("Error in ImageSearchWrapper: " e.Message . " " . ImagePath)

        return false
    }
}

ChangeLogs(msg) {

    try {
        ; Correct the file path
        logFilePath := A_ScriptDir . "\..\..\Settings\MangoSettings\Session\LastLog.txt"
        
        ; Ensure the directory exists
        SplitPath(logFilePath, , &dir)
        if !FileExist(dir) {
            MsgBox("Directory does not exist. Attempting to create: " . dir) ; Debugging
            if !DirCreate(dir) {
                MsgBox("Failed to create directory: " . dir) ; Debugging
                return
            }
        }

        ; Open the file in write mode
        LogFile := FileOpen(logFilePath, "w")
        if (LogFile) {
            LogFile.WriteLine(msg) ; Overwrite the log file with the new message
            LogFile.Close()
        } else {
            MsgBox("Error: Unable to open log file at " . logFilePath)
        }
    } catch as e {
        MsgBox("Error in ChangeLogs: " . e.Message)
    }
}