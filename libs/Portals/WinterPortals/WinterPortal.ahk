#Requires AutoHotkey v2.0
#Include ../../AllText.ahk
#Include ../../Modules.ahk
#Include ../../FindText.ahk

Tier10 := "|<>*75$27.zzzzzzzzzzzwTzsy0zy3U3zUM0Ts201y0EQDk27Vy0Ew7y27kzkEy7y27kzkEw7y27VzkEQDy201zkM0Ty3U3zsy1zU"
FailedText:="|<>*44$208.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000zzzzzk00Dw001zkDw0003zzzzw7zzy00007zzzzzU01zw00Dznzw000zzzzzxzzzz0000zzzzzz00Dzs01zzzzs007zzzzzzzzzzU007zzzzzy01zzU0Dzzzzk00zzzzzzzzzzz000S00003s0DUT00w0z0D003k0000DU007y003s00007U0w0w07k1w0S00D00000y0003y00D00000D07k3s0S07U1s00s00001k0003w00w00000w0S07U1s0S07U07U0000700007s03k00003k3s0T07U1s0S00S00000Q0000Dk0D00000D0D00w0S07U1s01s00001k0000TU0w00000s1w03s1s0S07U07U0000700000yzzk00007zzU07zzU1s0Tzzy00000w00001zzz00000Tzy00Tzy07U1zzzs00003k00003zzw0Dzzzzzk00zzs0S07zzzU1zzzz03w007zzk0zzzzzz003zzU1s0Tzzy07zzzw0Dz00Tzz03zzzzzs007zy07U1zzzs0Tzzzk0zy00zzw0DzzzzzU00Tzs0S07zzzU1zzzz03zy03zzk0zzzzzw000zzU1s0Tzzy07zzzw0Dzs0Dzz03zzzzzk003zy07U1zzzs0Tzzzk0zzk0Tzw0003zzy0007zs0S07zzzU000Tz03zzU1zzk0007zzs000TzU1s0Tzzy0000zw0Dzy07zz0000Tzz01U0zy07U1zzzs0003zk0zzs0Tzw0000zzw0603zs0S07zzzU0007z03zzU1zzk0003zzU0w07zU1s0Tzzy0000Tw0Dzz07zz0000Dzy03k0Ty07U1zzzs0001zk0zzw0Tzw0001zzk0TU0zs0S07zzzU0007z03zzU1zzk0007zz01y03zU1s0Tzzy0000zw0Dzy07zz0000Tzs00007y07U1zzzs0003zk0zzs0Tzw0007zzU0000Ts0S07zzzU000zz03zzU1zzk0zzzzy00000zU1s0Tzzy07zzzw0Dzw0Dzz03zzzzk00003y07U1zzzs0Tzzzk0zzU0zzw0Dzzzz00000Ds0S07zzzU1zzzz03zw03zzk0zzzzs00000TU1s0Tzzy07zzzw0DzU0Tzz03zzzzU00001y07U1zzzs0Tzzzk0zs01zzw0Dzzzw000003s0S07zzzU0000z00000Dzzk0zzzzk0Tzs0DU1s0Tzzy00000w00001zzz03zzzy03zzk0S07U0001s00003k00007zzw0Dzzzs0TzzU1s0S00003U0000700000zzzk0zzzz01zzy03U1s0000C00000Q00007zzz03zzzw0Dzzw0C07U0000s00001k0000zzzw0Dzzzk0zzzk0s0S00003U000070000Dzzzk0zzzz07zzzU3U1s0000C00000w0001zzzzU7zzzy0Tzzy0T0Dk0001w00003s000Tzzzz0zzzzy3zzzw7y1zU000Ds0000Tk00Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
class WinterVAR {
    static Shibuya_Loading := "|<>*58$301.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk7zzzzzy0zz0TzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzw0Dy07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk3zzzk0Tzzzzy03z01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy007zzk0Dzzzzy01z00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw000Tzs03zzzzz00TU0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs0003zw01zzzzzU0Dk07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs0000zy00zzzzzk07s03zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs0000Dz00Tzzzzs03w01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs00003zU0Dzzzzw01y00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00000zk07zzzzy01z00Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00000Ts03zzzzzU0zU0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzrzw00000Dw01zzzzzs0zk07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzy00000Dy00zzzzzzXzs03zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz000007z00Tzzzzzzzw01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz007w07zU0Dzzzzzzzy00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU07z07zk07zzzzzzzz00Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk07zk7zs03zzzzzzzzU0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs03zy7zw01zzzzzzzzk07zzzzzzzzzzzzyTzzzzzzzzzzzzzzzw01zzzzy00zVzzzz1zs03w7zzzk7zzw1zw3zzzUTzzz1zk7zzzy00zzzzz00S03zzw0Dw01k0TzzU0zzs0Ds0zzzU3zzw07k0zzzz00TzzzzU0A00Tzy03y00U03zzk0Tzw07s0TzzU0zzs00k0TzzzU07zzzzk04007zy00z00000Tzk07zw01s07zzk0Dzk00007zzzk00zzzzs00000zz00TU00007zs03zy00s01zzk07zk00003zzzw001zzzw00000DzU0Dk00001zw01zz00Q00zzs03zk00001zzzy0003zzy000007zk07s00000Ty00zzU0C00Dzw01zk00000zzzz00007zz000001zs03w000007z00Tzk07U07zw00zk00000Tzzzk0000zzU00000Tw01y000003zU0Dzs03k01zy00Tk00000Dzzzw00003zk00000Dy00z000000zk07zw01w00Ty00Ts000007zzzy00000zs000003z00TU00000Ds03zy00z00Dz00Ds000003zzzzU0000Dw000001zU0Dk000007w01zz00TU03z00Dw000001zzzzw00003y000000Tk07s000001y00zzU0Ds01zU07w000000zzzzz00001z001w00Ds03w007k00z00Tzk07w00TU07y007k00Tzzzzs0000TU03zU07w01y00Dy00TU0Dzs03z007k03y00Dw00DzzzzzU000Dk03zs03y00z00DzU07k07zw01zU03k03z00Dz007zzzzzy0003s01zw00z00TU07zk03s03zy00zs00s01zU07zk03zzzzzzw001w01zz00TU0Dk07zw01w01zz00Ty00Q00zk07zs01zzzzzzzk00y00zzU0Dk07s03zy00y00zzU0Dz00400zs03zy00zzzzzzzy00T00Tzk07s03w01zz00T00Tzk07zk0000Tw01zz00TzzzyTzzU0DU0Dzs03w01y00zzU0DU0Dzs03zs0000Ty00zzU0Dzzzw3zzk07k07zw01y00z00Tzk07k07zw01zy0000Dz00TzU07zzzw0zzs03s03zy00z00TU07zk03s01zw00zzU000DzU07zk03zzzw0Dzw01w01zz00TU0Dk01zk01w00zy00Tzk0007zk03zk01zzzw03zy00y00zzU0Dk07s00zk01y00Dy00Dzw0007zs00zk00zzzw00zy00T00Tzk07s03w007k00zU01w007zy0003zy007U00Tzzy007y00DU0Dzs03w01y000000Tk000003zzU001zz000000Dzzz000E00Dk07zw01y00z000000Ts000001zzs001zzk000007zzzU000007s03zy00z00TU00000Dy000000zzw000zzs000003zzzk000003w01zz00TU0Dk00000Dz000000Tzz000zzy000001zzzw000003y00zzU0Dk07s000007zk00000DzzU00Tzz000000zzzz000001z00Tzk07s03w000007zs000007zzs00Tzzk00000Tzzzk00001zU0Dzs03w01y000007zy000003zzw00Dzzw00000Dzzzw00001zk07zw01y00z000007zzU00001zzz00Dzzz000007zzzz00001zs03zy00z00TU00007zzs00000zzzU07zzzk00003zzzzk0001zw01zz00TU0Dk00007zzy00100TzzU03zzzw00001zzzzw0003zy01zzU0Tk0Ds0600Dzzzk01U0Tzzk03zzzz00300zzzzzU007zzU0zzs0Dw07y03U0Dzzzw03s0Dzzs01zzzzs07U0zzzzzw00Dzzw1zzy0TzUDzk7y0zzzzzk7z0Tzzs01zzzzzUDw1zzzzzzw1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy00Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy00Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz00Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz007zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk03zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk03zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
    static Namek_Loading := "|<>*63$243.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU000zzzs07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk0000zzz00Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy00001zzs03zzzzzzzzzzzzzzzzzzzzzzzzw1zzzzU00003zz00Tzzzzzzzzzzzzzzzzzzzzzzzy03zzzw000007zs03zzzzzzzzzzzzzzzzzzzzzzzzk0TzzzU00000Tz00Tzzzzzzzzzzzzzzzzzzzzzzzw03zzzw000001zs03zzzzzzzzzzzzzzzzzzzzzzzzU0TzzzU000007z00Tzzzzzzzzzzzzzzzzzzzzzzzw01zzzw000000zs03zzzzzzzzzzzzzzzzzzzzzzzzU0DzzzU000003z00Tzzzzzzzzzzzzzzzzzzzzzzzw01zzzw000000Ds03zzzzzzzzzzzzzzzzzzzzzzzzU0DzzzU000001z00Tzzzzzzzzzzzzzzzzzzzzzzzw01zzzw0000007s03zzzzzzzzzzzzzzzzzzzzzzzzU0DzzzU0Dzk00z00Tzzzzzzzzzzzzzzzzzzzzzzzw01zzzw01zzU07s03zzzzzzzzzzzzzzzzzzzUzzzzU0DzzzU0Dzy00z00TzzzkTy1zy0zs7zzzzz00Dzz4010zzw01zzk03s03zzzk0T03z01w07zzzz000TzU0000zzU0Dzz00T00Tzzs00k0Ts0C00DzzzU000zw00007zw01zzs03s03zzw00201y01U00Tzzs0003zU0000TzU0Dzz00T00Tzz00000Dk00001zzw0000Ds00003zw01zzs03s03zzk00001y000007zz00000z00000TzU0Dzz00T00Tzw00000Dk00000zzk00003s00003zw01zzk03s03zz000001y000003zy00000D00000TzU0Dzy00z00Tzk00000Dk00000DzU00001s00003zw01zzU07s03zy000001y000001zs00000D00000TzU0Dzk00z00TzU00000Dk000007z000000w00007zw0000007s03zw000001y000000zk00TU07U0000zzU000001z00Tz000000Dk000003y00Dy00y0000Dzw000000Ds03zs00T001y007s00Tk03zs07zU0DzzzU000003z00Tz00Dy00Dk01zk03w00zz00zw01zzzw000000Ts03zk03zk01y00Tz00TU07zs07zU0DzzzU000007z00Ty00Tz00Dk07zs01w00zy00zw01zzzw000001zs03zk07zs01y00zzU0DU000007zU0DzzzU00000Tz00Ty00zzU0Dk07zw01w000000zw01zzzw000007zs03zk07zw01y00zzU0DU000007zU0DzzzU00003zz00Ty00zzU0Dk07zw01w000001zw01zzzw00000zzs03zk07zs01y00zzU0DU00000TzU0DzzzU0000Tzz00Ty00Tz00Dk07zw01w000007zw01zzzw0000Tzzs03zk03zk01y00zzU0DU00003zzU0DzzzU0Dzzzzz00Tz00Dw00Dk07zw01w00zzzzzw01zzzw01zzzzzs03zs00T001y00zzU0Dk07zzzzzU0DzzzU0Dzzzzz007z000000Dk07zw01y00Tzzzzw00zzzw01zzzzzs003w000001y00zzU0Dk00zy1zzU007zzU0Dzzzzz000TU00000Dk07zw01z000w07zw000Tzw01zzzzzs001y000001y00zzU0Ds00000zzk001zzU0DzzzzzU00Dk00000Dk07zw01zU00003zy000Dzw01zzzzzw001z000001y00zzU0Dw00000Tzk001zzU0DzzzzzU00Dw00000Dk07zw01zk00001zz000Dzw01zzzzzw001zk00001y00zzU0Dz00000Dzs001zzU0Dzzzzzk00Dz00000Dk07zw01zw00003zzU00Dzw01zzzzzy001zw00001y00zzU0Dzk0000Tzy001zzk0Tzzzzzs00Dzk00k0Dk0Dzw03zz00007zzs00Dzy03zzzzzzk03zzU0S03z01zzk0Tzy0001zzzk03zzw1zzzzzzzk0zzzUDw1zy0zzzUDzzw000zzzzk0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
}

PlayerPosition() {
    MsgBox("Press okay once you found your position")
    Sleep(5000)
    StartTinyTask()
}

StartTinyTask() {
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

    Loop {
      
        Sleep(500)
        if ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, A_ScriptDir . "\..\..\Images\status\portal.png", 50) {
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
    loop {
        if (ok := FindText(&X, &Y, 925-150000, 109-150000, 925+150000, 109+150000, 0, 0, voteDectect)) {
            Sleep(5000)
            PlayerPosition()
        }
    }
}

WinterPortal() {

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
                            if (ok := FindText(&X, &Y, 173-150000, 917-150000, 173+150000, 917+150000, 0, 0, WinterVAR.Namek_Loading)) {
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
                            if (ok := FindText(&X, &Y, 149-150000, 912-150000, 149+150000, 912+150000, 0, 0, WinterVAR.Shibuya_Loading)) {
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
    baseX := 531
    baseY := 432
    colSpacing := 160
    rowSpacing := 150

    MouseMove(546, 813)
    Sleep(1000)
    BetterClick(432, 813)

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
                Sleep(1000)
                
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
                    
                    if (FindText(&X, &Y, 838-150000, 568-150000, 838+150000, 568+150000, 0, 0, yesagain)) {
                        BetterClick(X, Y)
                        StartTinyTask()
                        Sleep(2000)
                        break
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

PickShibuyaAgain() {
    baseX := 531
    baseY := 432
    colSpacing := 160
    rowSpacing := 150

    MouseMove(546, 813)
    Sleep(1000)
    BetterClick(432, 813)

    WinGetPos(&winX, &winY, &winWidth, &winHeight, "A")
    shibuya := false
    
    while (!shibuya) {
        row := 0
        col := 0

        while (row < 3 && !shibuya) {
            while (col < 6 && !shibuya) {
                targetX := baseX + (col * colSpacing)
                targetY := baseY + (row * rowSpacing)
                
                SmoothMouseMove(targetX, targetY)
                Sleep(1000)
                
                if (FindText(&X, &Y, 1154-150000, 620-150000, 1154+150000, 620+150000, 0, 0, ShibuyaPortal)) {
                    ; Check if it's a Tier 10 portal
                    if (!FindText(&X, &Y, 1442-150000, 559-150000, 1442+150000, 559+150000, 0, 0, Tier10)) {
                        ; Not a Tier 10 portal, move to next portal
                        col++
                        continue
                    }
                    
                    ; This is a Tier 10 portal
                    shibuya := true
                    MouseGetPos(&mouseX, &mouseY)
                    BetterClick(mouseX, mouseY)
                    Sleep(500)
                    
                    if (FindText(&X, &Y, 838-150000, 568-150000, 838+150000, 568+150000, 0, 0, yesagain)) {
                        BetterClick(X, Y)
                        StartTinyTask()
                        Sleep(2000)
                        break
                    }
                } else {
                    ; No Shibuya portal found, move to next position
                    col++
                }
            }
            
            if (!shibuya) {
                col := 0
                row++
            }
        }

        if (!shibuya) {
            SmoothMouseMove(winWidth/2, winHeight/2)
            Sleep(200)
            
            Loop 4 {
                Send("{WheelDown}")
                Sleep(150)
            }
            
            Sleep(1000)
            baseY := 432
        }
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
