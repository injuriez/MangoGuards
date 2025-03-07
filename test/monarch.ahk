#Requires AutoHotkey v2.0
#Include ../libs/FindText.ahk

BetterClick(x, y) {
  MouseMove(x, y)
  Sleep(10)
  MouseMove(1, 0, , "R")
  Sleep(20)
  MouseClick("Left", -1, 0, , , , "R")
  Sleep(50)
}



BetterMouseMove(targetX, targetY, speed := 2) {
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

Namek := "|<>*94$124.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzDzzzzzzzzzzzzzzwzzy0QTzzzzyTwT7zzzzzlzzs0lzzzzzszkwDzzzzz7zzU17zzzzzXz1kzzzzzwTzyC4Tzzzzw3w73zzzzzlzzswFwH8z1UDkAAH0MwH4TzXV7UA0k20z0EUA01UA1zy04Q0k30A3w000k000k7zs0llX64MszlU1X641X0zzU76CAQ03Xz60CAMsCA7zy7wQMll0yDwQ0MlXUMkDzszkk3749sDls036C030TzXz3UAQE3Uz7lUAMsUAEzyDyD4nnkT3wTb4lXb4nbzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"
double := "|<>*96$65.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwznzzzU7zzzszXzzz03zzzlz7zzy07zzzXyDzzwS7zzz4wTzzsyC7ba0sw7zlwM3740lU7zXs06C81X0Dz7k64QFV6ATyD0S8sX280zwQ4MFV6AMzzs0M1U20MErzk1s3U41kU7zUDsTWN7lkTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
spirit := "|<>*87$46.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyTzwzwzzUTzlzlbw0zzDzCDl7zzzzsz7zznzn0wDmD4X03k70QEA0DUA0l0l0zUlX4T6DzX6AFwMz6AMl7lXw0k34T63k30QFwMDUw3nDnkzzlzzzzzzz7zzzzzzwTzzzzzznzzzzzzzzzzzzzzzzzzzzs"
LoveRewards(hosting) {
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
                    if (FindText(&X, &Y, 1335-150000, 591-150000, 1335+150000, 591+150000, 0, 0, Namek)) {

                        BetterClick(portal.x, portal.y + 120)
                        Sleep(2000)
                
                        return true
                    }
                case "double":
                    if (FindText(&X, &Y, 1307-150000, 607-150000, 1307+150000, 607+150000, 0, 0, double)) {
                        BetterClick(portal.x, portal.y + 120)
                        Sleep(2000)
                     
                        return true
                    }
                case "Spirit":
                    if (FindText(&X, &Y, 1295-150000, 618-150000, 1295+150000, 618+150000, 0, 0, spirit)) {
                        BetterClick(portal.x, portal.y + 120)
                        Sleep(2000)
                   
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
        if (!CheckWorldType("double")) {
         
               CheckWorldType("Spirit")

        }
    }
}

F1::LoveRewards(0)
F2::ExitApp