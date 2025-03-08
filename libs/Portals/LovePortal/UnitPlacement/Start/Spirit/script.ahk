#Requires AutoHotkey v2.0
#Include ../../../../../Modules.ahk

#Include ../../../../../FindText.ahk

#Include ../../../Portal_Modules/UnitManager/Placement.ahk
#Include ../../../Portal_Modules/UnitManager/upgrading.ahk
#Include ../../../Portal_Modules/CollectRewards.ahk
global WorldRightNOW := "Spirit"
hostingplayer := "yes"


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

