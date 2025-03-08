    #Requires AutoHotkey v2.0
    #Include ../../../../../Modules.ahk
  

    #Include ../../../Portal_Modules/UnitManager/Placement.ahk
    #Include ../../../Portal_Modules/UnitManager/upgrading.ahk
    #Include ../../../Portal_Modules/CollectRewards.ahk
    WorldRightNOW := "Namek"

    hostingplayer := "yes"

    unitManager(Playerhost1) {
        global hostingplayer
        hostingplayer := Playerhost1

        ; example
        SpeedWagons(1159, 610)
        Gojo(1178, 210)
        SpeedWagons2(1012, 613)
        SpeedWagons3(824, 714)
        Gojo2(1109, 205)
        Aizen1(1021, 241)
        Aizen2(810, 254)
        Taka(573, 849)
        RandomUnit(895, 215)
        Fuboko1(671, 221)
        Fuboko2(1281, 461)
        UpgradeUnits(1159, 610, "max") ; upgrade first speed wagon
        UpgradeUnits(1012, 613, "max") ; upgrade second speed wagon
        UpgradeUnits(895, 215, "3") ;

        ; RandomUnit2() ; Places down the second unit or checks if the first unit is a monarch
        UpgradeUnits(824, 714, "max") ; upgrade third speed wagon
        UpgradeUnits(573, 849, "max") ; upgrade taka
        UpgradeUnits(1021, 241, "max") ; upgrade aizen
        UpgradeUnits(810, 254, "levelsix") ; upgrade aizen 2

        UpgradeUnits(1178, 210, "GojoAOE") ; upgrade gojo 1

        UpgradeUnits(1109, 205, "GojoAOE") ; upgrade gojo 2

        ; UpgradeUnits(1013, 199, "GojoAOE") ; upgrade gojo 3
        MouseMove(0, 0)
        MsgBox("All units placed")
        loop {
            CheckPortalStatus(WorldRightNOW)
            Sleep(100)
        }
    }