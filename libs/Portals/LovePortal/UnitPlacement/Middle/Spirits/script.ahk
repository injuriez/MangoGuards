#Requires AutoHotkey v2.0
#Include ../../../../../Modules.ahk

#Include ../../../../../FindText.ahk


#Include ../../../Portal_Modules/CollectRewards.ahk
hostingplayer := "yes"
WorldRightNOW := "Spirits"
unitManager25(Playerhost1) {
    global hostingplayer
    hostingplayer := Playerhost1

    ; example
    SpeedWagons(1095, 679)
    Gojo(1208, 464)
    SpeedWagons2(922, 686)
    SpeedWagons3(984, 828)
    Gojo2(1024, 282)
    Aizen1(935, 364)
    Aizen2(1072, 412)
    ; Gojo3(1013, 199)
    Taka(1178, 839)
    RandomUnit(978, 488)
    Fuboko1(1404, 642)
    Fuboko2(775, 691)
    
    UpgradeUnits(1095, 679, "max") ; upgrade first speed wagon
    UpgradeUnits(922, 686, "max") ; upgrade second speed wagon
    UpgradeUnits(978, 488, "3") ; op unit
    UpgradeUnits(984, 828, "max") ; upgrade third speed wagon
    UpgradeUnits(1178, 839, "max") ; upgrade taka
    UpgradeUnits(935, 364, "max") ; upgrade aizen
    UpgradeUnits(1072, 412, "levelsix") ; upgrade aizen 2
   
    UpgradeUnits(1208, 464, "GojoAOE") ; upgrade gojo 1
    UpgradeUnits(1024, 282, "GojoAOE") ; upgrade gojo 2

    loop { 
        CheckPortalStatus(WorldRightNOW)
        Sleep(100)
    }
}