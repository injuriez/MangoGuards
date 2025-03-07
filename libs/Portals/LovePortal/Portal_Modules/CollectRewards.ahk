#Requires AutoHotkey v2.0
#Include ../../../FindText.ahk
#Include ../host/LovePortalMAIN.ahk ; this has the host variable
#Include ../../../Modules.ahk
#Include ../../../AllText.ahk
#Include ../../../webhook.ahk
ThreeRewardsText := "|<>*125$74.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzkzzzzzzzzzzzw7zzzzzzzzzkz1zzzzzzzzzwDkTzzzzzzzzz3w7zzzzzzzzzkz1zzzzzzzzzk1kNzX7s7z0zw0A07k0s0z07y0300w0A07U0zU0k070300s07w0A01k0UMA31zkz1kA7sD31sTwDkS31y00k07z3w7UkTU0A01zkz1sA7s0D01zw7kS31y3zkTzz0Q7UkTU0Q03zk31sA7w07U0zy0kS31zU1w0DzkSDlszw0TU3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"

Host := "..."
CurrentWorld := "..."
spiritSearch := "|<>*86$54.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyDzyTyTzzw3zyDyAzzs1zyTyQTzsXzzzzwTzszzyTyM7zsTYS9607zs3UC8607zw1U68687zz1X68yATzzlX68yATzslX68yATzs1U68yA7zs1UC8yA7zw7USNyS7zzzXzzzzzzzzXzzzzzzzzXzzzzzzzzbzzzzzzzzzzzzzzU"
undergroundSearch := "|<>*91$109.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzbzzzzzzzzzzztwTXzznzzzzzzzzzzzwyDVzzkzzzzzzzzzzzwD7kzzsTzzzzzzzzzzy7XsTzoDzzzzzzzzzzx3lw2DU71mC1YQDDAXs1sy01U20M60kA1XW0M0wT00k10A20M40ll0A0SDUA8kX6D6ASA8sX2AD3k74M03776C74QFl67VkXWA83XlX7X2A8sX3s0Fl049ls1Xk304QE1y0Msk60My0lw1k2CA1zUwwwHUQzYNz3wHDD4zzzzzzzzziDzzzzzzzzzzzzzzzzU7zzzzzzzzzzzzzzzzk7zzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzzzzzzs"
Failed := "|<>*43$224.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001zzzzy000Tk003z1zs000Tzzzzszzzs0000001zzzzzs00Ty003zwzz000DzzzzzTzzzk000000zzzzzz00Dzk01zzzzs007zzzzzzzzzz000000Tzzzzzs07zy00zzzzz003zzzzzzzzzzw000007U0000S03s7k0D0Dk3s00w00003s001zU00001s00007U0w0w03k1w0S00T00000y0003y00000w00000s0T0DU1s0S07U07U000070000Dk0000D00000D07U1s0S07U1s01s00001k0001y00003k00003k3s0T07U1s0S00S00000Q0000Dk0000w00000w0w03k1s0S07U07U0000700001w0000D00000C0D00y0S07U1s01s00001k0000DU0Dzzk00007zzU07zzU1s0Tzzy00000w00001zzzzzw00001zzs01zzs0S07zzzU0000D00000Dzzzzz03zzzzzw00Dzy07U1zzzs0Tzzzk0z001zzzzzk0zzzzzz003zzU1s0Tzzy07zzzw0Dz00Tzzzzw0DzzzzzU00Tzs0S07zzzU1zzzz03zs03zzzzz03zzzzzs007zy07U1zzzs0Tzzzk0zzU0zzzzzk0zzzzzw000zzU1s0Tzzy07zzzw0Dzs0Dzzzzw0Dzzzzz000Dzs0S07zzzU1zzzz03zz01zzzzz0000zzzU001zy07U1zzzs0007zk0zzs0Tzzzzk0007zzs000TzU1s0Tzzy0000zw0Dzy07zzzzw0001zzw0603zs0S07zzzU000Dz03zzU1zzzzz0000Dzz01U0zy07U1zzzs0001zk0zzs0Tzzzzk0003zzU0w07zU1s0Tzzy0000Tw0Dzz07zzzzw0000zzs0D01zs0S07zzzU0007z03zzk1zzzzz0000Tzw07s0Dy07U1zzzs0001zk0zzs0Tzzzzk0007zz01y03zU1s0Tzzy0000zw0Dzy07zzzzw0001zzU0000Ts0S07zzzU000Dz03zzU1zzzzz0001zzs00007y07U1zzzs000Dzk0zzs0Tzzzzk0zzzzy00000zU1s0Tzzy07zzzw0Dzw0Dzzzzw0Dzzzz00000Ds0S07zzzU1zzzz03zy03zzzzz03zzzzk00001y07U1zzzs0Tzzzk0zz00zzzzzk0zzzzs00000TU1s0Tzzy07zzzw0DzU0Tzzzzw0Dzzzy000007s0S07zzzU1zzzz03zU07zzzzz03zzzz000000y07U1zzzs0000Dk00003zzzzzk0zzzzk0Tzs0DU1s0Tzzy00000w00001zzzzzw0Dzzzs0Dzz01s0S00007U0000D00000Tzzzzz03zzzy07zzs0S07U0000s00001k0000Dzzzzzk0zzzz01zzy03U1s0000C00000Q00007zzzzzw0Dzzzk0zzzk0s0S00003U0000700003zzzzzz03zzzw0Dzzw0C07U0000s00001k0003zzzzzzk0zzzz07zzzU3U1s0000C00000w0001zzzzzzy0Tzzzs1zzzs1w0z00003k0000DU001zzzzzzzkDzzzzUzzzz1zUTs0001y00007w007zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Namek := "|<>*89$118.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwzzzzzzzzzzzzzzznzs1lzzzzztzlwTzzzzz7zU37zzzzzXz3kzzzzzwTy04TzzzzyDw73zzzzzlzssFzzzzzkDkQDzzzzz7zXl7lAXw60z0klA1XlAFyC4S0k3083w120k060k7s0Fk30A0kDk00300030TU376AMFXXz606AME6A3y0QMslk0CDwM0slXUskTsTllX74Tszlk1X6C1X0zXz30AQErUz7U0AMs0A1yDwC0ll0C3wT60lXW0l3szswHDD1wDlyQH6CQHCTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzDzzzzzzzzzzzzzzzzzzwzzzzzzzzzzzzzzzzzzznzzzzzzzzzzzzzzzzzzzDzzzzzzzzzzzzzzzzzzwzzzzzzzzzzzzzzzzzzzU"
double := "|<>*96$65.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwznzzzU7zzzszXzzz03zzzlz7zzy07zzzXyDzzwS7zzz4wTzzsyC7ba0sw7zlwM3740lU7zXs06C81X0Dz7k64QFV6ATyD0S8sX280zwQ4MFV6AMzzs0M1U20MErzk1s3U41kU7zUDsTWN7lkTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
spirit := "|<>*87$46.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyTzwzwzzUTzlzlbw0zzDzCDl7zzzzsz7zznzn0wDmD4X03k70QEA0DUA0l0l0zUlX4T6DzX6AFwMz6AMl7lXw0k34T63k30QFwMDUw3nDnkzzlzzzzzzz7zzzzzzwTzzzzzznzzzzzzzzzzzzzzzzzzzzs"
CheckPortalStatus(World) {
    global CurrentWorld
    CurrentWorld := World
 
    if (ok := FindText(&X, &Y, 1040-150000, 345-150000, 1040+150000, 345+150000, 0, 0, ThreeRewardsText)) {
        LoveRewards()
    } else if (ok := FindText(&X, &Y, 669-150000, 247-150000, 669+150000, 247+150000, 0, 0, Failed)) {
        LovePortalPickAgain()
    } else {
        return
    }
}

LoveRewards() {
    ; Define portal positions
    portals := [
        {x: 722, y: 500},  ; Left portal
        {x: 960, y: 500},  ; Middle portal
        {x: 1194, y: 499}  ; Right portal
    ]

    ; Check each portal for the desired world types in priority order
    for portal in portals {
        ; Move to the portal to reveal its details
        BetterMouseMove(portal.x, portal.y)
        Sleep(500)
        

        if (ok:=FindText(&X, &Y, 1081-150000, 618-150000, 1081+150000, 618+150000, 0, 0, Namek)) {        ; Check for Namek (highest priority)
   
            BetterClick(portal.x, portal.y + 120)  ; Click the select button below the portal
            Sleep(2000)
            Yesbutton()
            return
        }
        
        ; Check for double (second priority)
        if (ok:=FindText(&X, &Y, 1307-150000, 607-150000, 1307+150000, 607+150000, 0, 0, double)) {
    
            BetterClick(portal.x, portal.y + 120)  ; Click the select button below the portal
            Sleep(2000)
            Yesbutton()
            return
        }
        
        ; Check for Spirit (lowest priority)
        if (ok:=FindText(&X, &Y, 1295-150000, 618-150000, 1295+150000, 618+150000, 0, 0, spirit)) {
      
            BetterClick(portal.x, portal.y + 120)
            Sleep(2000)
            Yesbutton()
            return
        }
        
        if (A_Index < portals.Length) {
            BetterClick(portal.x, portal.y)
            Sleep(2000)
        }
    }
    
    ; If we've checked all portals and found nothing, click the last one anyway

    BetterClick(portals[3].x, portals[3].y + 120)
    Sleep(2000)
    Yesbutton()
}
Yesbutton() {
    loop {
        if (ok := FindText(&X, &Y, 841-150000, 568-150000, 841+150000, 568+150000, 0, 0, yes)) {
            BetterClick(X, Y)
            Sleep(500)
            CancelButton()
            Sleep(1000)
            break
        } else {
            if (ok := FindText(&X, &Y, 853-150000, 556-150000, 853+150000, 556+150000, 0, 0, darkerYes)) {
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
            LovePortalPickAgain()
            break
        } 
    }
}




LovePortalPickAgain() {

    if (Playerhost1 == "true") {
        baseX := 531
        baseY := 432
        colSpacing := 160
        rowSpacing := 150


        MouseMove(546, 813)
        Sleep(1000)
        BetterClick(432, 813) ; clicks portals button
        Sleep(1000)
        BetterClick(679, 323) ; clicks search button
        Sleep(1000)

        ; Enter search text
        text := "love"
        for each, char in StrSplit(text) {
            Send(char)
            Sleep(100)
        }
        Sleep(1000)

        scrollCount := 0
        maxScrolls := 5
        portalFound := false


        while (scrollCount <= maxScrolls && !portalFound) {
           
            for row in Range(0, 2) {
                for col in Range(0, 5) {
                    ; Move to each portal position
                    SmoothMouseMove(baseX + (col * colSpacing), baseY + (row * rowSpacing))
                    Sleep(800)
                    
                    if (FindText(&X, &Y, 697-150000, 603-150000, 697+150000, 603+150000, 0, 0, Namek)) {
                        portalFound := true
                    } 
                    else if (FindText(&X, &Y, 1163-150000, 644-150000, 1163+150000, 644+150000, 0, 0, spiritSearch)) {
                        portalFound := true
                    }
                    
                    if (portalFound) {
                        MouseGetPos(&mouseX, &mouseY)
                        BetterClick(mouseX, mouseY)
                        Sleep(1000)
                        
                        if (FindText(&X, &Y, 838-150000, 568-150000, 838+150000, 568+150000, 0, 0, yesagain)) {
                            BetterClick(X, Y)
                            Sleep(2000)
                            HostAwaitingVote(selectedPosition, PlayerHost, CurrentWorld)
                            return  
                        } else {
                            ; If confirmation not found, portal wasn't actually valid
                            portalFound := false
                        }
                    }
                }
                
                if (portalFound) {
                    break
                }
            }
            
            if (!portalFound) {
                SmoothMouseMove(baseX, baseY + (2 * rowSpacing))
                Sleep(200)
                Send("{WheelDown}")
                Sleep(1000)
                scrollCount++
            }
        }
    }
}

Range(start, end) {
    result := []
    Loop (end - start + 1) {
        result.Push(start + A_Index - 1)
    }
    return result
}