#Requires AutoHotkey v2.0
#Include ../../../../../Modules.ahk
#Include ../../../../../FindText.ahk
playerhosting := "no"
WorldRightNOW := "Namek"
unitManager22(hosting := "") {
    global playerhosting
    hosting := playerhosting

    ; example 
    SpeedWagons(1481, 552)
    SpeedWagons2(1430, 641)
    SpeedWagons3(824, 714)
    Gojo(948, 368)
    Gojo2(951, 770)

    Aizen1(1060, 452)
    Aizen2(1033, 702)
    Taka(757, 229)
    RandomUnit(1049, 769)
    Fuboko1(1319, 957)
    Fuboko2(1049, 150)
    
    UpgradeUnits(1481, 552, "max") ; upgrade first speed wagon
    UpgradeUnits(1430, 641, "max") ; upgrade second speed wagon
    UpgradeUnits(1049, 769, "3") ; op unit
    UpgradeUnits(824, 714, "max") ; upgrade third speed wagon
    UpgradeUnits(757, 229, "max") ; upgrade taka
    UpgradeUnits(1060, 452, "max") ; upgrade aizen
    UpgradeUnits(1033, 702, "levelsix") ; upgrade aizen 2
    UpgradeUnits(948, 368, "GojoAOE") ; upgrade gojo 1 
    UpgradeUnits(951, 770, "GojoAOE") ; upgrade gojo 2
    ; UpgradeUnits22(1013, 199, "GojoAOE") ; upgrade gojo 3

    loop { 
        CheckPortalStatus(WorldRightNOW)
        Sleep(100)
    }
}