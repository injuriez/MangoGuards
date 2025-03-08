#Requires AutoHotkey v2.0

#Include ../../../../Modules.ahk
#Include ../../../../FindText.ahk
#Include ../CollectRewards.ahk
UnitPlaced :=
        "|<>*87$115.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzszzzyDy7zzzzzzzzzzzsDzzy3z3zzzzzzzzzzzw7zzz1zUzzzzzzzzzzzy3zzzUzkTzzzzzzzzzzz1zzzkTsDzzzzzzzzzzzUzzzsDw7zzzzzzzzzzzkTtzw7y323zUVkES13w0DU7y3z1U0TU0M0C01s07U1z1zUk07U0A0600s03U0TUzkM03U060700Q01U07kTsA00k830n00A00kC3sDwC3kMD1UzUw63kMD1w7w71sADUkTky31sA00y1y3Uw63kMDsD1Uw600zUy1kA31kA7w70kS31zzk41s03U063y00M01Uzzw00w01s031zU0C00s07z00y01y01Uzk07U0Q03zk0z01zU0kTw03s0D01zw1zUnzzkQTzVXy6Ds1zzzzkTzzsDzzzzzzzzzzzzzsDzssDzzzzzzzzzzzzzw7zs07zzzzzzzzzzzzzy3zw07zzzzzzzzzzzzzz1zz07zzzzzzzzzzzzzzlzzsDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"
Fuboko1(x, y) {
    loop {
        Send("{4}")
        Sleep(500)
        BetterClick(x, y)
        
        if (ok := FindText(&X, &Y, 368 - 150000, 386 - 150000, 368 + 150000, 386 + 150000, 0, 0, UnitPlaced)) {
            break
        } else {
            CheckPortalStatus(WorldRightNOW)
            Sleep(100)
        }
    }
}
;1281, 461
Fuboko2(x, y) {
    loop {
        Send("{4}")
        Sleep(500)
        BetterClick(x, y)
     
        
        if (ok := FindText(&X, &Y, 368 - 150000, 386 - 150000, 368 + 150000, 386 + 150000, 0, 0, UnitPlaced)) {
            break
        } else {
            CheckPortalStatus(WorldRightNOW)
            Sleep(100)
        }
    }

}
Aizen1(x, y) {
   
    loop {
        Send("{1}")
        Sleep(500)
        BetterClick(x, y)
        Sleep(500)
        
        if (ok := FindText(&X, &Y, 368 - 150000, 386 - 150000, 368 + 150000, 386 + 150000, 0, 0, UnitPlaced)) {
            break
        } else {
            CheckPortalStatus(WorldRightNOW)
            Sleep(100)
        }
    }

}
Aizen2(x, y) {
    loop {
        Send("{1}")
        Sleep(500)
        BetterClick(x, y)
        
        Sleep(500)
        if (ok := FindText(&X, &Y, 368 - 150000, 386 - 150000, 368 + 150000, 386 + 150000, 0, 0, UnitPlaced)) {
            break
        } else {
            CheckPortalStatus(WorldRightNOW)
            Sleep(100)
        }
    }

}
RandomUnit(x, y) { ; This is the only slot that supports monarch and other units
  
    loop {
        Send("{2}")
        Sleep(500)
        BetterClick(x, y)
        Sleep(500)
        
        if (ok := FindText(&X, &Y, 368 - 150000, 386 - 150000, 368 + 150000, 386 + 150000, 0, 0, UnitPlaced)) {
            break
        } else {
            CheckPortalStatus(WorldRightNOW)
            Sleep(100)
        }
    }
}

Taka(x, y) {
    loop {
        Send("{5}")
        Sleep(500)
        BetterClick(x, y)

        Sleep(500)
        if (ok := FindText(&X, &Y, 368 - 150000, 386 - 150000, 368 + 150000, 386 + 150000, 0, 0, UnitPlaced)) {
            break
        } else {
            CheckPortalStatus(WorldRightNOW)
            Sleep(100)
        }
    }
}
SpeedWagons(x, y) {
    loop {
        Send("{6}")
        Sleep(500)
        BetterClick(x, y)
        Sleep(500)
 
        if (ok := FindText(&X, &Y, 368 - 150000, 386 - 150000, 368 + 150000, 386 + 150000, 0, 0, UnitPlaced)) {
            break
        } else {
            CheckPortalStatus(WorldRightNOW)
            Sleep(100)
        }
    }
}

SpeedWagons2(x, y) {
    loop {
        Send("{6}")
        Sleep(500)
        BetterClick(x, y)
        Sleep(500)

        Sleep(500)
        if (ok := FindText(&X, &Y, 368 - 150000, 386 - 150000, 368 + 150000, 386 + 150000, 0, 0, UnitPlaced)) {
            break
        } else {
            CheckPortalStatus(WorldRightNOW)
            Sleep(100)
        }
    }
}

SpeedWagons3(x, y) {
    loop {
        Send("{6}")
        Sleep(500)
        BetterClick(x, y)
        Sleep(500)
        if (ok := FindText(&X, &Y, 368 - 150000, 386 - 150000, 368 + 150000, 386 + 150000, 0, 0, UnitPlaced)) {
            break
        } else {
            CheckPortalStatus(WorldRightNOW)
            Sleep(100)
        }
    }
}

Gojo(x, y) {
    loop {
        Send("{3}")
        Sleep(500)
        BetterClick(x, y)
        Sleep(500)
        
        if (ok := FindText(&X, &Y, 368 - 150000, 386 - 150000, 368 + 150000, 386 + 150000, 0, 0, UnitPlaced)) {
            break
        } else {
            CheckPortalStatus(WorldRightNOW)
            Sleep(100)
        }
    }
}

Gojo2(x, y) {
    loop {
        Send("{3}")
        Sleep(500)
        BetterClick(x, y)
   
        Sleep(500)
        if (ok := FindText(&X, &Y, 368 - 150000, 386 - 150000, 368 + 150000, 386 + 150000, 0, 0, UnitPlaced)) {
            break
        } else {
            CheckPortalStatus(WorldRightNOW)
            Sleep(100)
        }
    }

}
