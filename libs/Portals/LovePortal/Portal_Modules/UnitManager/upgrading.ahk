#Requires AutoHotkey v2.0
#Include ../../../../Modules.ahk
#Include ../../../../FindText.ahk
#Include ../CollectRewards.ahk

PortalPicker :=
    "<>*124$71.zzzzzzzzzzzzzzzzzzzzzzzzzz3zzzzzzzzzzy3zzzzzzzzz3w7zzzzzzzzy7sDzzzzzzzzwDkTzzzzzzzzsTUzzzzzzzzz071byATUTw3y0603s0Q0TU3s0A03k0k0S03k0M03U1U0Q03k0k07021UkA7sTUs63w7VUwDkz1sA7s0300TVy3kMDk0600z3w7UkTU0w07y3sD1Uz1zsDzw1kS31y01k0Ds1Uw63y03k0Ts31sA7y07k0zsD7swTy0Dk1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"

LEVELTHREE :=
    "|<>*90$44.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUDzzUDzk3s7k3zw0s0Q0zz0A03UDzkT00T3zwDk07kzz3wD1wDzkzXkT3zwDzU7kzz3zk3wDzkzw1z3zwDz0Dkzz3zs1wDzkzzkD3zwDVy3kzz3sDUwDzky1kT3zwDU07kzz3w03wDzkzU1z3zwDw0zkzz3zzzwDzkzzzz3zw1zzy0zz0DzzUDzk3zzs3zy0zzy0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
MaxUnit :=
    "|<>*91$86.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs3zzzzzzzzzzs3w0lzz3zlzwTyA0z08DzUzsTy3z10Dk21zsDy3z0zk83w7UDw3z0zs7s7kz3s3y0zk7z0w3wDky0T0Ds1zs61z3wDU3k3y0Dz00zkz3s0M0z03zk0DwDky040Dk0Ty07z3wDUU13s47zk3zkz3s80ky30zw0zwDky30QD0sDy07z3wDUs73k01z00zkz3sD3ks00Tk0DwDky3twC003s61z3wDUzz3000w3kDkz3sDzkkTs61y1wDky3zwA7z1UzkT3wDUzz33zkMTy7kz3wTzkszyDDznwDkzzzzzzzzzzzz3wDzzzzzzzzzzzkz0TzzzzzzzzzzUDk3zzzzzzzzzzs3w0zzzzzzzzzzy0zUDzzzzzzzzzzUDzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"
GojoAOE :=
    "|<>*91$45.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUDzz0Tzs1s3k3zz0C0C0Tzs1U0s3zz1s03sTzsT0UT3zz3sC3sTzsT3kT3zz3sC3sTzsT00T3zz3w03sTzsTk0T3zz3zU3sTzsTzkT3zz3zw7sTzsTz0z3zz3w0DsTzsT03z3zz3s0zsTzsT0Dz3zz3w7zsTzsTzzz3zz3zzzsTzs3zzs3zz0Dzz0Tzs1zzs3zzUDzz0Tzzzzzzzzzzzzzzzw"
Special :=
    "|<>*134$45.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzDbm07VzlwyE0E3y7bnsw0TUwyT7Xlw3bnswyD4QyT77tsVbnswyC0AQT7Xlk0V3sw8QT60z7k3nwsDtz1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
levelsix :=
    "|<>*90$41.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz0Tzy0zw0zsM1zs1y0E3zk3s0k7zUzU1wDz3y07sTy7s3zkzwDkTzVzsT0zz3zky0Dy7zVw07wDz3s07sTy7k07kzwDUEDVzsT1sT3zky3ky7zVw71wDz3w03sTy7s0DkzwDs0zVzsTs3z3zkzzzy7zVzzzwDz0Tzz0Ty0Tzy0zw0zzw1zw1zzs3zzzzzzzzzzzzzzzzzzzzzU"
MonarchUnit :=
    "|<>*139$24.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzy3zzw3zzs3zzk3zzU3zz03zy03zy03zy03zz03zzg3zzw3zzw3zzw3zzw3zzw3zzw3zzw3zzw3zzw3zzw3zzw3zzy3zzy7zzzzzzzzzzzzzzzzzzzzzU"
AizenLEVEL :=
    "|<>*90$49.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz0Tzzz0Tz0DlzX0DzU7kTUU7zk3kDUM3zsDk7UDVzwDk3U7kzy7k1U3sTz3k0U1wDzVw0M0y7zkz8CET3zsTw7sDVzwDy3w7kzy7z1y3sTz3zUz1wDzVzkTUy7zkzsDkT3zsTw7sDVzwDy3w7kzy7z1y3sTz3zUz1wDzVzszly7zkzzzzz3zsTzzzzVzw1zzzy0zy0Tzzz0Tz0DzzzUDzk7zzzk7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"
    ; CheckPortalStatus23() {
    ;     global PlayerHost
    ;     ; Add your logic here to check if the portal is lost or won
    ;     ; Return if the portal is lost or won
    ;     if (ok := FindText(&X, &Y, 1040-150000, 345-150000, 1040+150000, 345+150000, 0, 0, PortalPicker)) {
    ;         LoveRewards(PlayerHost)
    ;         return
    ;     } else if (ok := FindText(&X, &Y, 667-150000, 247-150000, 667+150000, 247+150000, 0, 0, Failed)) {
    ;         LovePortalPickAgain()
    ;         return
    ;     }
    ; }
UpgradeUnits(x, y, upgrade) {
  
    if (upgrade = "max") {
        
        BetterClick(x, y)
        Sleep(500)
        Send("{t down}")
        Sleep(200)
        Send("{t up}")
      
        KeyWait "t"
        Sleep(500)

        if (ok := FindText(&X, &Y, 472 - 150000, 388 - 150000, 472 + 150000, 388 + 150000, 0, 0, MaxUnit)) {
            CheckPortalStatus(WorldRightNOW)

        
            return
        } else {
            UpgradeUnits(x, y, upgrade)
        }
    } else if (upgrade = "GojoAOE") {
        
        BetterClick(x, y)
        Sleep(500)
        Send("{t down}")
        Sleep(200)
        Send("{t up}")
        CheckPortalStatus(WorldRightNOW)

  
        KeyWait "t"
        Sleep(500)

        if (ok := FindText(&X, &Y, 447 - 150000, 387 - 150000, 447 + 150000, 387 + 150000, 0, 0, GojoAOE)) {
            CheckPortalStatus(WorldRightNOW)

        
            BetterClick(672, 376) ; press the auto button
            sleep(500)
            return
        } else {
            UpgradeUnits(x, y, upgrade)
        }
    } else if (upgrade = "AizenLEVEL") {
        
        BetterClick(x, y)
        Sleep(500)
        Send("{t down}")
        Sleep(200)
        Send("{t up}")
        CheckPortalStatus(WorldRightNOW)

        KeyWait "t"
        Sleep(500)

        if (ok := FindText(&X, &Y, 449 - 150000, 388 - 150000, 449 + 150000, 388 + 150000, 0, 0, AizenLEVEL)) {
            return
        } else {
            UpgradeUnits(x, y, upgrade)
        }
    } else if (upgrade = "3") {
       
        BetterClick(x, y)
        Sleep(500)
        Send("{t down}")
        Sleep(200)
        Send("{t up}")
        CheckPortalStatus(WorldRightNOW)

        KeyWait "t"
        Sleep(500)

        if (ok := FindText(&X, &Y, 449 - 150000, 387 - 150000, 449 + 150000, 387 + 150000, 0, 0, LEVELTHREE)) {
            return
        } else {
            UpgradeUnits(x, y, upgrade)
        }
    } else if (upgrade = "levelsix") {
       
        
        BetterClick(x, y)
        Sleep(500)
        Send("{t down}")
        Sleep(200)
        Send("{t up}")
        CheckPortalStatus(WorldRightNOW)

        KeyWait "t"
        Sleep(500)

        if (ok := FindText(&X, &Y, 446 - 150000, 387 - 150000, 446 + 150000, 387 + 150000, 0, 0, levelsix)) {
            return
        } else {

            UpgradeUnits(x, y, upgrade)
        }
    }
   
}
