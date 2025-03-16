#Requires AutoHotkey v2.0
#Include ../../FindText.ahk

UnitPlaced := "|<>*87$115.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzszzzyDy7zzzzzzzzzzzsDzzy3z3zzzzzzzzzzzw7zzz1zUzzzzzzzzzzzy3zzzUzkTzzzzzzzzzzz1zzzkTsDzzzzzzzzzzzUzzzsDw7zzzzzzzzzzzkTtzw7y323zUVkES13w0DU7y3z1U0TU0M0C01s07U1z1zUk07U0A0600s03U0TUzkM03U060700Q01U07kTsA00k830n00A00kC3sDwC3kMD1UzUw63kMD1w7w71sADUkTky31sA00y1y3Uw63kMDsD1Uw600zUy1kA31kA7w70kS31zzk41s03U063y00M01Uzzw00w01s031zU0C00s07z00y01y01Uzk07U0Q03zk0z01zU0kTw03s0D01zw1zUnzzkQTzVXy6Ds1zzzzkTzzsDzzzzzzzzzzzzzsDzssDzzzzzzzzzzzzzw7zs07zzzzzzzzzzzzzy3zw07zzzzzzzzzzzzzz1zz07zzzzzzzzzzzzzzlzzsDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"
Vote:= "<>*92$71.zzzzzzzzzzzzzzzzzzzzzzzzzbzwzzzzzzzzy7zkzzy7zzzzs7zUzzw7zzzzsDy3zzsDzzzzkTw7zzkTzzzzkTkTbzUzzTzzUzUs1w0DU7zzUy3U1k0C07zz1w601U0M07zz1kM01U0U0Dzy3UkA3UL0sDzy23Uw7Uy3kTzw471wD1w00zzw0S3sS3s03zzs0w7Uw7kTzzzs3s01sDUzzzzk7s03k3U0TzzkTk0Dk700zzzUzk0zUD01zzzXzs7zkzU7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
Round12:="|<>*134$29.zzzzzzzzzzzzzzzzTsTzwD0DzkQ0Dy0s0Ds1UETk31kzU67Uz0ADVzsMT3zkky7zVVwDz33sTy67UzwA73zsQ07zks0TzVs0zz7s7zzzzzzzzzzzzzzzzzzzz"
; developer notes
; Monarch is the top priority unit if the team has it [Will be placed down first]
; MoneyUnits are the units that will be placed down after Monarch [Will be placed down second]
; If the team has no Monarch, the 3/3 units will be placed down first
GemStart() {
 


    

    ; Wait for vote and place units
    loop {
        if (ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, Vote)) {
            BetterClick(881, 177) ; Clicks yes
            unitManager()
            break
        } else {
            GemStart()
        }
    }
}


unitManager() {
    Unit1(864, 595)
    Unit2(602, 374)
    Unit3(1271, 657)  
    Unit4(419, 598)  
    
    ; Use a counter and sleep between checks rather than an infinite loop
    loop {
        if (upgradeAll()) 
            break
        Sleep(5000)  
    }
}
upgradeAll() {
    ; open the unitmanager ui
    SendInput("{f}")
    Sleep(1000)
    BetterClick(1365, 416)
    Sleep(500)
    BetterClick(1575, 412)
    Sleep(500)
    BetterClick(1774, 408)
    Sleep(1000)
    BetterClick(1572, 744)
    return CheckRound12() 
}

CheckRound12() {
    if (ok:=FindText(&X, &Y, 747-150000, 62-150000, 747+150000, 62+150000, 0, 0, Round12)) {

        
        BetterClick(31, 1046)
        Sleep(100)
        BetterClick(1218, 503)
        Sleep(1000)
        BetterClick(857, 573)
        Sleep(600)
        BetterClick(951, 563)
        SendInput("{f}")
        Sleep(500)
        BetterClick(1334, 168)
        GemStart()
        return true
    } else {
        SendInput("{f}")
        Sleep(500)
        return false
    }
}

Unit1(x, y) {
    SendInput("{1}")
    BetterClick(x, y)
    Sleep(100)
    loop {
        if (ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, UnitPlaced)) {
            break
        } else {
            Unit1(x, y)
        }
    }
}

Unit2(x, y) {
    SendInput("{2}")
    BetterClick(x, y)
    Sleep(100)
    loop {
        if (ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, UnitPlaced)) {
            break
        } else {
            Unit2(x, y)
        }
    }
}
Unit3(x, y) {
    SendInput("{3}")
    BetterClick(x, y)
    Sleep(100)
    loop {
        if (ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, UnitPlaced)) {
            break
        } else {
            Unit3(x, y)
        }
    }
}
Unit4(x, y) {
    SendInput("{4}")
    BetterClick(x, y)
    Sleep(100)
    loop {
        if (ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, UnitPlaced)) {
            break
        } else {
            Unit4(x, y)
        }
    }
}