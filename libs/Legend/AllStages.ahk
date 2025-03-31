#Requires AutoHotkey v2.0
#Include ../../libs/TinyTaskWrapper/tinytask.ahk
#Include ../FindText.ahk
class Cards {
    static voting := "|<>*93$71.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzbzwzzzzzzzzy7zkzzy7zzzzs7zUzzw7zzzzsDy3zzsDzzzzkTw7zzkTzzzzkTkTbzUzzTzzUzUs1w0DU7zzUy3U1k0C07zz1w601U0M07zz1kM01U0U0Dzy3UkA3UL0sDzy23Uw7Uy3kTzw471wD1w00zzw0S3sS3s03zzs0w7Uw7kTzzzs3s01sDUzzzzk7s03k3U0TzzkTk0Dk700zzzUzk0zUD01zzzXzs7zkzU7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
    static gems := "|<>*116$66.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzXzzzzzzzzzw0zzzzzzzzzs0Dzzzzzzzzk0TzzzzzzzzUwTzzzzzzzzVzz0wEky0zzVzy0A00Q0zzXkA0A00A0zzXUACA00ADzzXkACAAAA1zzVwA0AAAC0zzUwA0QAAD0Tzk0ADwAAAsTzs0A0AAAA0Tzw0S0AAAA0zzy0z0QQSC1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
    static RewardsText := "|<>*86$162.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzzzzzw3zzzzzz00Dzzzzzzzzzzzzzzzzw3zzzzzy003zzzzzzzzzzzzzzzzw3zzzzzy001zzzzzzzzzzzzzzzzw3zzzzzy000zzzzzzzzzzzzzzzzw3zzzzzy000Tzzzzzzzzzzzzzzzw3zzzzzy000Tzzzzzzzzzzzzzzzw3zzzzzy0z0Dzzzzzzzzzzzzzzzw3zzzzzy0zUDs1z3yDszsC7UsDsA3y0Dzzy0zUDU0S1w7kDU43U07U03s07zzy0zUD00C1s7kD003007003k03zzy0zUC0061s3UC003006003k03zzy0z0A0060k3UQ00300C003k07zzy000Q0k30k10Q00300A003kTjzzy000M1s30E10M1U30DQ0U3kDzzzy000s3s30000s3s30Ts3s3k0Tzzy000s003U000s7s30Ts3s3k07zzy001s007U001s7s30Ts7w3s03zzy000s007k001s7s30Ts3s3w03zzy000s00Tk001s3s30Ts3s3z01zzy0z0M3zzk0U3s0U30Tw0U3zs1zzy0z0Q1yTs1U3w0030Tw003ky1zzy0zUA00Ds1k7w0030Ty003U01zzy0zUC007w1k7y0030Ty003U03zzz0zkD007w3k7z0030Tz003U03zzz0zkDU0Dy3sDzU43UTzU03k07zzzVzszk0Ty7wTzsC7UzzsC7w0TzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
 }
 global PositionShown := false
 
BetterClick(x, y) {
    MouseMove(x, y)
    Sleep(10)
    MouseMove(1, 0, , "R")
    Sleep(20)
    MouseClick("Left", -1, 0, , , , "R")
    Sleep(50)
}

Position() {
    global PositionShown
    if (!PositionShown) {
        MsgBox("Once you found your position press okay")
        PositionShown := true
    }
    Sleep(3000)
    StartTinyTask1()
}
 
StartTinyTask1() {

    ; Starts tiny task

    if (IsTinyTaskPlaying()) {
        Send("{F8 down}") ; stops tinytask
        Sleep(100)
        Send("{F8 up}")
        Sleep(500)
        Send("{F8 down}") ; start tinytask
        Sleep(100)
        Send("{F8 up}")
        Sleep(500)
    } else {
        Send("{F8 down}") ; start tinytask
        Sleep(100)
        Send("{F8 up}")
        Sleep(500)
    }
    
    Loop {
        if (ok := FindText(&X, &Y, 669-150000, 586-150000, 669+150000, 586+150000, 0, 0, Cards.RewardsText)) {

            try {
                Run(A_ScriptDir . "\..\webhook.ahk")
                if FileExist("../Settings/MangoSettings/session/stats/losses.txt") {
                    loss := FileOpen("../Settings/MangoSettings/session/stats/losses.txt", "r")
                    currentLosses := Integer(loss.ReadLine())
                    loss.Close()
                } else {
                    currentLosses := 0
                }
     
                loss := FileOpen("../Settings/MangoSettings/session/stats/losses.txt", "w")
                loss.Write(currentLosses + 1)
                loss.Close()
            } catch as e {
                MsgBox("Error updating loss stats: " e.Message)
            }
            



            Sleep(1000)
            Send("{F8 down}")
            Sleep(100)
            Send("{F8 up}")
            Sleep(500)
            if (IsTinyTaskPlaying()) { ; if tinytask start running again it will turn it off
                Send("{F8 down}") ; stops tinytask
                Sleep(100)
                Send("{F8 up}")
                Sleep(500)
            }

            BetterClick(1184, 840)
            Sleep(500)
     
            Sleep(500)
            RunWait(A_ScriptDir . "\..\webhook.ahk")
            sleep(3000)
            LegendStart()
            Sleep(500)

            Sleep(500)
            break
        
        } else if (ok := FindText(&X, &Y, 1142-150000, 448-150000, 1142+150000, 448+150000, 0, 0, Cards.gems)) {

            try {
                if FileExist("../Settings/MangoSettings/session/stats/wins.txt") {
                    Wins := FileOpen("../Settings/MangoSettings/session/stats/wins.txt", "r")
                    currentWins := Integer(Wins.ReadLine())
                    Wins.Close()
                } else {
                    currentWins := 0
                }
                
          
                Wins := FileOpen("../Settings/MangoSettings/session/stats/wins.txt", "w")
                Wins.Write(currentWins + 1)
                Wins.Close()
                

                if FileExist("../Settings/MangoSettings/session/stats/TotalWins.txt") {
                    TotalWins := FileOpen("../Settings/MangoSettings/session/stats/TotalWins.txt", "r")
                    TotalCurrentWins := Integer(TotalWins.ReadLine())
                    TotalWins.Close()
                } else {
                    TotalCurrentWins := 0
                }
                
                TotalWins := FileOpen("../Settings/MangoSettings/session/stats/TotalWins.txt", "w")
                TotalWins.Write(TotalCurrentWins + 1)
                TotalWins.Close()
            } catch as e {
                MsgBox("Error updating win stats: " e.Message)
            }

            


            Sleep(1000)
            Send("{F8 down}")
            Sleep(100)
            Send("{F8 up}")
            Sleep(500)
            if (IsTinyTaskPlaying()) { ; if tinytask start running again it will turn it off
                Send("{F8 down}") ; stops tinytask
                Sleep(100)
                Send("{F8 up}")
                Sleep(500)
            }
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(1184, 840)
            Sleep(500)
            LegendStart()

            Sleep(500)
            break
        }
    }

}


 LegendStart() {
    loop {
        global X1 := 500  
        global Y1 := 50   
        global X2 := 1500 
        global Y2 := 400  
        if (ok:=FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Cards.voting))
            {
              Sleep(500)
              BetterClick(879, 181) ; clicks vote yes
              Sleep(3000)
              PickCards()
              Sleep(1000)
              break
            }
        }
    
 }
 RestartMatch() {
    BetterClick(671, 483) ; clicks a random card so it can reset stage\
    Sleep(2000)
    BetterClick(951, 568)
    Sleep(2000)
    BetterClick(970, 570) ; clicks cancel
    Sleep(2000)
    BetterClick(879, 181) ; clicks vote yes 
    Sleep(7000)
    BetterClick(37, 1039) ; clicks settings icon
    Sleep(1000)
    BetterClick(1204, 504) ; clicks the restart match button
    Sleep(1000)
    BetterClick(834, 569) 
    Sleep(1000) ; Add delay to give game time to reset and show cards
}
PickCards() {
    global X1 := 214
    global Y1 := 227
    global X2 := 1500
    global Y2 := 600
    Setting := FileOpen("../Settings/LegendSettings/CardStarter.txt", "r")
    StarterCard := Setting.ReadLine()
    loop {
        if StarterCard == "Champions" {
            if ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, A_ScriptDir . "\LegendCards\Champions.png", 50) {
                AdjustedX := FoundX + 100 ; Adjust this value as needed
                AdjustedY := FoundY + 50 ; Adjust this value as needed
                BetterClick(AdjustedX, AdjustedY)
                Sleep(500)
                Random()
                Sleep(500)
                break
            } else {
                RestartMatch()
            }
        } else if StarterCard == "Exploding" {
            if ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, A_ScriptDir . "\LegendCards\Exploding.png", 50) {
                AdjustedX := FoundX + 100 ; Adjust this value as needed
                AdjustedY := FoundY + 50 ; Adjust this value as needed
                BetterClick(AdjustedX, AdjustedY)
                Sleep(500)
                Random()
                Sleep(500)
                break
            } else {
                RestartMatch()
            }
        } else if StarterCard == "Immunity" {
            if ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, A_ScriptDir . "\LegendCards\Immunity.png", 50) {
                AdjustedX := FoundX + 100 ; Adjust this value as needed
                AdjustedY := FoundY + 50 ; Adjust this value as needed
                BetterClick(AdjustedX, AdjustedY)
                Sleep(500)
                Random()
                Sleep(500)
                break
            } else {
                RestartMatch()
            }
        } else if StarterCard == "Quake" {
            if ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, A_ScriptDir . "\LegendCards\Quake.png", 50) {
                AdjustedX := FoundX + 100 ; Adjust this value as needed
                AdjustedY := FoundY + 50 ; Adjust this value as needed
                BetterClick(AdjustedX, AdjustedY)
                Sleep(500)
                Random()
                Sleep(500)
                break
            } else {
                RestartMatch()
            }
        } else if StarterCard == "Revitalize" {
            if ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, A_ScriptDir . "\LegendCards\Revitalize.png", 50) {
                AdjustedX := FoundX + 100 ; Adjust this value as needed
                AdjustedY := FoundY + 50 ; Adjust this value as needed
                BetterClick(AdjustedX, AdjustedY)
                Sleep(500)
                Random()
                Sleep(500)
                break
            } else {
                RestartMatch()
            }
        } else if StarterCard == "Thrice" {
            if ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, A_ScriptDir . "\LegendCards\Thrice.png", 50) {
                AdjustedX := FoundX + 100 
                AdjustedY := FoundY + 50 
                BetterClick(AdjustedX, AdjustedY)
                Sleep(500)

                Random()

                Sleep(500)
                break
            } else {
                RestartMatch()
            }
        }
    }

}
Random() {
    Sleep(500)
    BetterClick(962, 571) ; clicks cancel
    Sleep(3000)
    Position()
    Sleep(500)
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
        MsgBox("Error in ImageSearchWrapper: " e.Message)
        return false
    }
}


LegendStart()
F2::QUITAPP()
QUITAPP() {
    try {

        EraseWins := FileOpen("../Settings/MangoSettings/session/stats/wins.txt", "w")
        EraseWins.Write(0)  
        EraseWins.Close()
        

        EraseLosses := FileOpen("../Settings/MangoSettings/session/stats/losses.txt", "w")
        EraseLosses.Write(0)
        EraseLosses.Close()
    } catch as e {
        MsgBox("Error resetting stats: " e.Message)
    }

    if ProcessExist("TinyTask.exe") {
        ProcessClose("TinyTask.exe")
    }
    
    sessionui := WinExist("Window")
    if (sessionui) {
       WinClose("Window")
    }
    
    ExitApp
}
