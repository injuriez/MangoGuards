#Requires AutoHotkey v2.0
#Include ../../AllText.ahk
#Include ../../Modules.ahk
#Include ../../FindText.ahk
#Include ../../../TinyTaskRE.ahk
#Include ../../webhook.ahk
global connection
global SelectedWorldd := "."  ; Assign a default value

class WinterVAR {
    static Namek_Loading := "|<>*63$243.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU000zzzs07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk0000zzz00Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy00001zzs03zzzzzzzzzzzzzzzzzzzzzzzzw1zzzzU00003zz00Tzzzzzzzzzzzzzzzzzzzzzzzy03zzzw000007zs03zzzzzzzzzzzzzzzzzzzzzzzzk0TzzzU00000Tz00Tzzzzzzzzzzzzzzzzzzzzzzzw03zzzw000001zs03zzzzzzzzzzzzzzzzzzzzzzzzU0TzzzU000007z00Tzzzzzzzzzzzzzzzzzzzzzzzw01zzzw000000zs03zzzzzzzzzzzzzzzzzzzzzzzzU0DzzzU000003z00Tzzzzzzzzzzzzzzzzzzzzzzzw01zzzw000000Ds03zzzzzzzzzzzzzzzzzzzzzzzzU0DzzzU000001z00Tzzzzzzzzzzzzzzzzzzzzzzzw01zzzw0000007s03zzzzzzzzzzzzzzzzzzzzzzzzU0DzzzU0Dzk00z00Tzzzzzzzzzzzzzzzzzzzzzzzw01zzzw01zzU07s03zzzzzzzzzzzzzzzzzzzUzzzzU0DzzzU0Dzy00z00TzzzkTy1zy0zs7zzzzz00Dzz4010zzw01zzk03s03zzzk0T03z01w07zzzz000TzU0000zzU0Dzz00T00Tzzs00k0Ts0C00DzzzU000zw00007zw01zzs03s03zzw00201y01U00Tzzs0003zU0000TzU0Dzz00T00Tzz00000Dk00001zzw0000Ds00003zw01zzs03s03zzk00001y000007zz00000z00000TzU0Dzz00T00Tzw00000Dk00000zzk00003s00003zw01zzk03s03zz000001y000003zy00000D00000TzU0Dzy00z00Tzk00000Dk00000DzU00001s00003zw01zzU07s03zy000001y000001zs00000D00000TzU0Dzk00z00TzU00000Dk000007z000000w00007zw0000007s03zw000001y000000zk00TU07U0000zzU000001z00Tz000000Dk000003y00Dy00y0000Dzw000000Ds03zs00T001y007s00Tk03zs07zU0DzzzU000003z00Tz00Dy00Dk01zk03w00zz00zw01zzzw000000Ts03zk03zk01y00Tz00TU07zs07zU0DzzzU000007z00Ty00Tz00Dk07zs01w00zy00zw01zzzw000001zs03zk07zs01y00zzU0DU000007zU0DzzzU00000Tz00Ty00zzU0Dk07zw01w000000zw01zzzw000007zs03zk07zw01y00zzU0DU000007zU0DzzzU00003zz00Ty00zzU0Dk07zw01w000001zw01zzzw00000zzs03zk07zs01y00zzU0DU00000TzU0DzzzU0000Tzz00Ty00Tz00Dk07zw01w000007zw01zzzw0000Tzzs03zk03zk01y00zzU0DU00003zzU0DzzzU0Dzzzzz00Tz00Dw00Dk07zw01w00zzzzzw01zzzw01zzzzzs03zs00T001y00zzU0Dk07zzzzzU0DzzzU0Dzzzzz007z000000Dk07zw01y00Tzzzzw00zzzw01zzzzzs003w000001y00zzU0Dk00zy1zzU007zzU0Dzzzzz000TU00000Dk07zw01z000w07zw000Tzw01zzzzzs001y000001y00zzU0Ds00000zzk001zzU0DzzzzzU00Dk00000Dk07zw01zU00003zy000Dzw01zzzzzw001z000001y00zzU0Dw00000Tzk001zzU0DzzzzzU00Dw00000Dk07zw01zk00001zz000Dzw01zzzzzw001zk00001y00zzU0Dz00000Dzs001zzU0Dzzzzzk00Dz00000Dk07zw01zw00003zzU00Dzw01zzzzzy001zw00001y00zzU0Dzk0000Tzy001zzk0Tzzzzzs00Dzk00k0Dk0Dzw03zz00007zzs00Dzy03zzzzzzk03zzU0S03z01zzk0Tzy0001zzzk03zzw1zzzzzzzk0zzzUDw1zy0zzzUDzzw000zzzzk0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
}
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
    WinORloserChecker()
    
}
WinORloserChecker() {
    Loop {
        Sleep(500)
        if (ok := FindText(&X, &Y, 1040-150000, 345-150000, 1040+150000, 345+150000, 0, 0, PortalPicker)) {
            Sleep(1000)
            Send("{F8 down}")
            Sleep(100)
            Send("{F8 up}")
            Sleep(500)
            CollectRewards()
            CountdownText.Text := ""
            break
        } else {
            Sleep(500)
            if (ok := FindText(&X, &Y, 667-150000, 247-150000, 667+150000, 247+150000, 0, 0, Failed)) {
                Sleep(1000)
                Send("{F8 down}")
                Sleep(100)
                Send("{F8 up}")
                Sleep(500)
                Countdown(0, "foundsomething failed")
                Sleep(2000)
                PickPortalsAGAIN()
                CountdownText.Text := ""
                break
            } else {
                if (ok := FindText(&X, &Y, 668-150000, 247-150000, 668+150000, 247+150000, 0, 0, shibuyafailed)) {
                    Sleep(1000)
                    Send("{F8 down}")
                    Sleep(100)
                    Send("{F8 up}")
                    Sleep(500)
                    Countdown(0, "foundsomething failed")
                    Sleep(2000)
                    PickPortalsAGAIN()
                    CountdownText.Text := ""
                    break
                }
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
    ; global presents
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

            BetterClick(X, Y)
            Sleep(1000)
            InitiateWebhook()
            Sleep(1000)
            PickPortalsAGAIN()
            break
        } 
    }
}

PickPortalsAGAIN() {
    global SelectedWorldd  ; Ensure SelectedWorldd is global
    Countdown(0, "Picking portals again")
    if (SelectedWorldd == "Namek") {
        PickNamekAgain()
    } else if (SelectedWorldd == "Shibuya") {
        PickShibuyaAgain()
    } 
}

findvoting() {
    Countdown(0, "waiting for voting ui")
    loop {
        if (ok := FindText(&X, &Y, 925-150000, 109-150000, 925+150000, 109+150000, 0, 0, voteDectect)) {
            ; if find voting ui then start countdown
            Countdown(0, "Found Voting UI")
            Sleep(5000)
            Countdown(20, "")
        }
    }
}


WinterPortal(world) {
    global SelectedWorldd  ; Ensure SelectedWorldd is global
    SelectedWorldd := world ; Assign world to SelectedWorldd
    Countdown(0, "Namek Selected")

    
    if (world == "Namek") {
        namekworld()
    } else if (world == "Shibuya") {
        shibuyaworld()
    }
}

namekworld() {
    Countdown(0, "Namek world")
    baseX := 531
    baseY := 432
    
    ; Grid spacing
    colSpacing := 160
    rowSpacing := 150
    
    ; Track scrolling
    scrollCount := 0
    maxScrolls := 3

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
                                BetterClick(781,553) ; presses create
                                Sleep(1000)
                                BetterClick(966,553) ; presses cancel
                                
                                break
                            }
                        }
                              
                                               
                        Loop {
                            if (ok := FindText(&X, &Y, 149-150000, 912-150000, 149+150000, 912+150000, 0, 0, WinterVAR.Namek_Loading)) {
                                Countdown(0, "Loading into [planet namek]")
                                Sleep(2000)
                                findvoting()
                                Sleep(500)
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

shibuyaworld() {
    baseX := 531
    baseY := 432
    
    ; Grid spacing
    colSpacing := 160
    rowSpacing := 150
    
    ; Track scrolling
    scrollCount := 0
    maxScrolls := 3

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
                                
                                BetterClick(781,553) 
                                Sleep(1000)
                                BetterClick(966,553) 
                                                       
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