#Requires AutoHotkey v2.0
#Include ../../../../../Modules.ahk
#Include ../../../../../FindText.ahk
#Include ../../../Portal_Modules/UnitManager/Placement.ahk
#Include ../../../Portal_Modules/UnitManager/upgrading.ahk
#Include ../../../Portal_Modules/CollectRewards.ahk
global WorldRightNOW := "Spirit"
hostingplayer := "yes"
UnitPlaced :=
    "|<>*87$115.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzszzzyDy7zzzzzzzzzzzsDzzy3z3zzzzzzzzzzzw7zzz1zUzzzzzzzzzzzy3zzzUzkTzzzzzzzzzzz1zzzkTsDzzzzzzzzzzzUzzzsDw7zzzzzzzzzzzkTtzw7y323zUVkES13w0DU7y3z1U0TU0M0C01s07U1z1zUk07U0A0600s03U0TUzkM03U060700Q01U07kTsA00k830n00A00kC3sDwC3kMD1UzUw63kMD1w7w71sADUkTky31sA00y1y3Uw63kMDsD1Uw600zUy1kA31kA7w70kS31zzk41s03U063y00M01Uzzw00w01s031zU0C00s07z00y01y01Uzk07U0Q03zk0z01zU0kTw03s0D01zw1zUnzzkQTzVXy6Ds1zzzzkTzzsDzzzzzzzzzzzzzsDzssDzzzzzzzzzzzzzw7zs07zzzzzzzzzzzzzy3zw07zzzzzzzzzzzzzz1zz07zzzzzzzzzzzzzzlzzsDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"
; if (ok:=FindText(&X, &Y, 368-150000, 386-150000, 368+150000, 386+150000, 0, 0, Text))
;     {
;       ; FindText().Click(X, Y, "L")
;     }

unitManager3(Playerhost1) {
    global hostingplayer
    hostingplayer := Playerhost1

    ; example
    SpeedWagons(754,347)
    Gojo(1214, 546)
    SpeedWagons2(690, 213)
    SpeedWagons3(835, 205)
    Gojo2(1391, 540)
    Aizen1(1001, 684)
    Aizen2(1153, 590)
    ; Gojo3()
    Taka(903, 273)
    RandomUnit(1290, 573)
    Fuboko1(1064, 632)
    UpgradeUnits(754,347, "max") ; upgrade first speed wagon
    UpgradeUnits(690, 213, "max") ; upgrade second speed wagon
    UpgradeUnits(1290, 573, "3") ; op unit
    UpgradeUnits(835, 205, "max") ; upgrade third speed wagon
    UpgradeUnits(903, 273, "max") ; upgrade taka
    UpgradeUnits(1001, 684, "max") ; upgrade aizen
    UpgradeUnits(1153, 590, "levelsix") ; upgrade aizen 2
   
    UpgradeUnits(1214, 546, "GojoAOE") ; upgrade gojo 1

    UpgradeUnits(1391, 540, "GojoAOE") ; upgrade gojo 2

    loop { 
        CheckPortalStatus(WorldRightNOW)
        Sleep(100)
    }

}

