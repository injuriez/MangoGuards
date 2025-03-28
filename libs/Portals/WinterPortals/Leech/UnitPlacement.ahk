#Requires AutoHotkey v2.0
#Include ../../../FindText.ahk


BetterClick1(x, y) {
    MouseMove(x, y)
    Sleep(10)
    MouseMove(1, 0, , "R")
    Sleep(20)
    MouseClick("Left", -1, 0, , , , "R")
    Sleep(50)
}

SmoothMouseMove1(targetX, targetY, speed := 2) {
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
Failed:="|<>*118$101.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003zU00000000000000zzw00001U00000003k1y0000Ts0000000600C0001ts0000000M00C00030k0000000k00C00061U0000001U00C000A300000003000A000M600000006000MDz1kDXxzDU7kA1y0NzzjUTzzzzUTsM3y0rU3s01kM73Vksk6A1w03k01U04330lUAQ3k03U020087C1X0Tk700300400E6M360z0A00600800U7k6A000s1U400k03UD0MM001U7UD0zU7zUC0kk0070T0S1z0Tv0M3VU00C000w360l70E63000Q003s6A1U600Q6000s006kAM30600kA001k00xUTk60A01UM3w1UDzn0TUA0A060k7s3U7Va070M0Q0A1UAs3003g060k0M0k30Mk7003Q0A1U0s1U60lkD006M0M300k70C1VUT00Qs0s601UA0A73Vr01kw3kQ060s0Tw3z7zzUzzzk0A1U0Dk3s3zw0Tsz00s30000000y0000001UA0000000000000070M00000000000000A1k00000000000000M3000000000000000kC000000000000001kM000000000000001zk000000000000001z0000000000000000M0000000000000000004"
UnitPlaced := "|<>*87$115.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzszzzyDy7zzzzzzzzzzzsDzzy3z3zzzzzzzzzzzw7zzz1zUzzzzzzzzzzzy3zzzUzkTzzzzzzzzzzz1zzzkTsDzzzzzzzzzzzUzzzsDw7zzzzzzzzzzzkTtzw7y323zUVkES13w0DU7y3z1U0TU0M0C01s07U1z1zUk07U0A0600s03U0TUzkM03U060700Q01U07kTsA00k830n00A00kC3sDwC3kMD1UzUw63kMD1w7w71sADUkTky31sA00y1y3Uw63kMDsD1Uw600zUy1kA31kA7w70kS31zzk41s03U063y00M01Uzzw00w01s031zU0C00s07z00y01y01Uzk07U0Q03zk0z01zU0kTw03s0D01zw1zUnzzkQTzVXy6Ds1zzzzkTzzsDzzzzzzzzzzzzzsDzssDzzzzzzzzzzzzzw7zs07zzzzzzzzzzzzzy3zw07zzzzzzzzzzzzzz1zz07zzzzzzzzzzzzzzlzzsDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"
Vote:= "<>*92$71.zzzzzzzzzzzzzzzzzzzzzzzzzbzwzzzzzzzzy7zkzzy7zzzzs7zUzzw7zzzzsDy3zzsDzzzzkTw7zzkTzzzzkTkTbzUzzTzzUzUs1w0DU7zzUy3U1k0C07zz1w601U0M07zz1kM01U0U0Dzy3UkA3UL0sDzy23Uw7Uy3kTzw471wD1w00zzw0S3sS3s03zzs0w7Uw7kTzzzs3s01sDUzzzzk7s03k3U0TzzkTk0Dk700zzzUzk0zUD01zzzXzs7zkzU7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
AutoAbility:="|<>*132$58.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzntwU0sTzzyDbm020TzzsSTDXk1zzz1twyD7Xzzw3bnswyDzzWCTDXXwzzy0NwyDDXzzk1XXswSDzz024DXkVzzsyA1yDU7zznwsDsz1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
; developer notes
; Monarch is the top priority unit if the team has it [Will be placed down first]
; MoneyUnits are the units that will be placed down after Monarch [Will be placed down second]
; If the team has no Monarch, the 3/3 units will be placed down first
checkstatus() {
    global X1 := 214
    global Y1 := 5
    global X2 := 1600
    global Y2 := 600

    Loop {
        Sleep(500)
        ; Check for Rewards
        if ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, A_ScriptDir . "\..\..\Images\status\Rewards.png", 50) {
            Sleep(500)
            webhook()
            SendInput("{f}")
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
            Leech1()
            return true ; Exit with success
        }

        ; Check for Failure
        if ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, A_ScriptDir . "\..\..\Images\status\failed.png", 50) {
            Sleep(1000)
            SendInput("{f}")
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
            Leech1()
            return true ; Exit with success
        }


        ; If no conditions are met, exit the loop
        return false ; Exit with failure
    }
}

GemStart() {
    loss := FileOpen("../../Settings/MangoSettings/session/stats/losses.txt", "w")
    if loss {
        loss.Write(0)
        loss.Close()
        MsgBox("Losses reset to 0.")
    } else {
        MsgBox("Error opening file for writing: ")
        return
    }
    loop {
        if (ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, Vote)) {
   
            BetterClick1(881, 177) ; Clicks yes
            unitManager1()
            break
        } else {
            GemStart()
        }
    }
}


unitManager1() {
    Unit1(864, 595)
    Sleep(500)
    Unit2(602, 374)
    Sleep(500)
    Unit3(1271, 657)  
    Sleep(500)
    Unit4(1218,422)  
    Sleep(500)
    
    ; Use a counter and sleep between checks rather than an infinite loop
    loop {
        if (checkstatus()) {
            break
        }
        if (upgradeAll()) 
            break

        Sleep(5000)  
    }
}
upgradeAll() {
    ; open the unitmanager ui


    Sleep(1000)
    BetterClick1(1365, 416)
    Sleep(500)
    BetterClick1(1575, 412)
    Sleep(500)
    BetterClick1(1774, 408)
    Sleep(1000)
    BetterClick1(1572, 744)
    Sleep(500)
    SmoothMouseMove1(1167, 819)
    CheckAll()

    return checkstatus()

}



Unit1(x, y) {
    SendInput("{1}")
    BetterClick1(x, y)

    Sleep(100)
    loop {
        if (ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, UnitPlaced)) {
            break
        } else {
            ; Retry clicking if the condition is not met
            SendInput("{1}")
            BetterClick1(x, y)
            Sleep(100)
        }
    }
}

Unit2(x, y) {
    SendInput("{2}")
    BetterClick1(x, y)

    Sleep(100)
    loop {
        if (ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, UnitPlaced)) {
            break
        } else {
            ; Retry clicking if the condition is not met
            SendInput("{2}")
            BetterClick1(x, y)
            Sleep(100)
        }
    }
}

Unit3(x, y) {
    SendInput("{3}")
    BetterClick1(x, y)

    Sleep(100)
    loop {
        if (ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, UnitPlaced)) {
            break
        } else {
            ; Retry clicking if the condition is not met
            SendInput("{3}")
            BetterClick1(x, y)
            Sleep(100)
        }
    }
}

Unit4(x, y) {
    SendInput("{4}")
    BetterClick1(x, y)

    Sleep(100)
    loop {
        if (ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, UnitPlaced)) {
            SendInput("{f}")
            break
        } else {
            ; Retry clicking if the condition is not met
            SendInput("{4}")
            BetterClick1(x, y)
            Sleep(100)
        }
    }
}

CheckAbility() {
    
    loop {
        if (ok := FindText(&X, &Y, 671-150000, 345-150000, 671+150000, 345+150000, 0, 0, AutoAbility)) {
            BetterClick1(679, 377)
            Sleep(1000)
            return true
        } else {
            return false
        }
    }
}

CheckAll() {
    MsgBox("Checking all abilities...")
    BetterClick1(1391, 289)
    Sleep(500) ; Give UI time to update
    CheckAbility()
    Sleep(900)
    
    BetterClick1(1596, 289)
    Sleep(500) ; Give UI time to update
    CheckAbility()
    Sleep(900)
    
    BetterClick1(1806, 286)
    Sleep(500) ; Give UI time to update
    CheckAbility()
    Sleep(900)
    
    BetterClick1(1578, 618)
    Sleep(500) ; Give UI time to update
    CheckAbility()
    Sleep(900)

    return
}
LeechButtons() {
    loop {
        if (ok := FindText(&X, &Y, 841-150000, 568-150000, 841+150000, 568+150000, 0, 0, yes)) {
            BetterClick(X, Y)
            Sleep(500)
            LeechCancel()
            Sleep(1000)
            break
        } else {
            if (ok := FindText(&X, &Y, 853-150000, 556-150000, 853+150000, 556+150000, 0, 0, darkerYes)) {
                BetterClick(X, Y)
                Sleep(2000)
                LeechCancel()
                Sleep(1000)
                break
            }
        }
    }
}

LeechCancel() {
    loop {
        if (ok := FindText(&X, &Y, 961-150000, 569-150000, 961+150000, 569+150000, 0, 0, cancel)) { ; detects cancel after picking portal
            ; collects the rewards
            BetterClick(X, Y - 20)
            Sleep(2000)
            Sleep(500)
            BetterClick(X, Y)
            Sleep(500)
            BetterClick(X, Y)
            Sleep(500)
            BetterClick(X, Y)
            Sleep(500)
            webhook() ; WEBHOOK HERE
            BetterClick(X, Y)
            Sleep(1000)
            Sleep(1000)
            GemStart()
            break
        } 
    }
}

Leech1() {
    loop {
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
                            LeechButtons()
                            return true
                        }
                    case "Shibuya":
                        if (FindText(&X, &Y, 1062-150000, 581-150000, 1062+150000, 581+150000, 0, 0, shibuya)) {
                            BetterClick(portal.x, portal.y + 120)
                            Sleep(2000)
                            LeechButtons()
                            return true
                        }
                    case "Spider":
                        if (FindText(&X, &Y, 1061-150000, 618-150000, 1061+150000, 618+150000, 0, 0, spider)) {
                            BetterClick(portal.x, portal.y + 120)
                            Sleep(2000)
                            LeechButtons()
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
