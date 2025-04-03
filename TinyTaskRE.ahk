#Requires Autohotkey v2

#Include libs/PC_SETTINGS/resolution.ahk
#Include libs/PC_SETTINGS/Window.ahk

#Include libs/PC_SETTINGS/Auto.ahk


global presents := 0
global MacroSelected := {Enabled: false, Name: ""}
global CountdownText := "" 
global connection := ""
global text := ""
global hometab := "" 
global winterTab := ""
global loveTab := ""
global myGui := ""
global antRaidOptions := ""
global StarterCard := ""
global TimeTotalValue := ""

global WinterPortal_data := {
    World: "Namek",
    worldSelect: "",
    Leeching: false
 

    
}

global LovePortal_data := {
    Hosting: false, 
    Position: "Start",
    hostingSwitch: "", ; Will store the CheckBox reference
    positionSelect: "" ; Will store the ListBox reference
}

global Legends_data := {
    World: "Bleach",
    Card: "Champions"
}

CreateGui() {
    myGui := Gui("+AlwaysOnTop")
    myGui.BackColor := "0x18181b"
    
    myGui.SetFont("s8 w600", "Karla")
    
    iconPath := A_ScriptDir "\libs\photos\mango.ico"
    
    if !FileExist(iconPath) {
        MsgBox("Error: Icon file not found at: " iconPath)
        return
    }
    
    hIcon := DllCall("LoadImage", "Ptr", 0, "Str", iconPath, "UInt", 1, "Int", 16, "Int", 16, "UInt", 0x10)
    if (hIcon) {
        SendMessage(0x80, 0, hIcon, , myGui.Hwnd)
        SendMessage(0x80, 1, hIcon, , myGui.Hwnd)
    } else {
        MsgBox("Failed to load icon.")
    }
    
    CreateLeftPanel(myGui)
    CreateHeader(myGui)
    CreateTabControl(myGui)
    statusBar := myGui.AddStatusBar()
    
    
    updateStatus := CheckForUpdates()
    if (updateStatus = "UPTODATE") {
        statusText := "[UPTODATE] - MangoGuards"
        statusColor := 0x18181b  
    } else if (updateStatus = "UPDATE") {
        statusText := "[UPDATE AVAILABLE] - MangoGuards"
        statusColor := 0x991B1B  
    } else {
        statusText := "[ERROR CHECKING UPDATE] - MangoGuards"
        statusColor := 0x18181b
    }
    
    statusBar.SetText(statusText)
    DllCall("SendMessage", "Ptr", statusBar.Hwnd, "UInt", 0x2001, "Ptr", 0, "Ptr", statusColor)
    
    myGui.Title := "MangoGuards"
    myGui.Show("w426 h378")
    
    return myGui
}

CheckForUpdates() {
    try {

        versionFilePath := A_ScriptDir "\version.txt"
        
        if (!FileExist(versionFilePath)) {
            FileAppend("1.0.0", versionFilePath) 
        }
        
        currentVersion := FileRead(versionFilePath)
        currentVersion := Trim(currentVersion)
        
        repoOwner := "injuriez"
        repoName := "MangoGuards"
        
  
        whr := ComObject("WinHttp.WinHttpRequest.5.1")

        url := "https://raw.githubusercontent.com/" repoOwner "/" repoName "/main/version.txt"
        whr.Open("GET", url, false)
        whr.SetRequestHeader("User-Agent", "MangoGuards Update Checker")
        

        url := url "?nocache=" A_TickCount
        whr.Open("GET", url, false)
        whr.Send()
        
        if (whr.Status = 200) {
            latestVersion := Trim(whr.ResponseText)
            
            
            if (CompareVersions(latestVersion, currentVersion) > 0) {
                return "UPDATE"
            } else {
                return "UPTODATE"
            }
        } else {
            return "ERROR"
        }
    } catch as e {
        ; Handle any errors
        return "ERROR"
    }
}

CompareVersions(v1, v2) {
    v1Parts := StrSplit(v1, ".")
    v2Parts := StrSplit(v2, ".")
    
    maxParts := Max(v1Parts.Length, v2Parts.Length)
    Loop maxParts {
        v1Num := (A_Index <= v1Parts.Length) ? Integer(v1Parts[A_Index]) : 0
        v2Num := (A_Index <= v2Parts.Length) ? Integer(v2Parts[A_Index]) : 0

        

        if (v1Num > v2Num) {
            return 1  
        } else if (v1Num < v2Num) {
            return -1 
        }
    }
    
    return 0
}


CreateLeftPanel(myGui) {
    global CountdownText

    ; Create a background for the GroupBox
    myGui.Add("Text", "x16 y230 w120 h80 Background0x18181b")

    CountdownText := myGui.Add("GroupBox", "x16 y230 w120 h80", "")
    CountdownText.SetFont("s8 w600 c0xFFFFFF", "Karla")

    ButtonAnimeVanguards := myGui.Add("Button", "x8 y64 w145 h23", "Anime Vanguards")
    ButtonMacroStats := myGui.Add("Button", "x8 y96 w145 h23", "Stats")
    Settings := myGui.Add("Button", "x8 y128 w145 h23", "Settings")

    ; Add button events
    ButtonAnimeVanguards.OnEvent("Click", Home)
    ButtonMacroStats.OnEvent("Click", stats)
    Settings.OnEvent("Click", SettingFUNC)

    f1Text := myGui.Add("Text", "x8 y8 w24 h20 +0x200", "F1 - ")
    f1Text.SetFont("c0xFFFFFF")

    f2Text := myGui.Add("Text", "x8 y32 w25 h20 +0x200", "F2 - ")
    f2Text.SetFont("c0xFFFFFF")

    startText := myGui.Add("Text", "x30 y8 w77 h23 +0x200", " Start")
    startText.SetFont("c0xFFFFFF")

    stopText := myGui.Add("Text", "x35 y32 w77 h23 +0x200", "Stop")
    stopText.SetFont("c0xFFFFFF")

    myGui.Add("Text", "x160 y8 w2 h363 +0x1 +0x10")
}
CreateHeader(myGui) {
    global text
    text := myGui.Add("Text", "x218 y10 w279 h40 +0x200", "MANGOGUARDS")
    text.SetFont("s12 w600 c0xFFFFFF", "Karla")
    myGui.Add("Picture", "x168 y8 w46 h46 0x6 ", A_ScriptDir "\.\libs\photos\mango.png")
}


; Function to add log entries

CreateSettingsPanel(myGui) {
    myGui.Add("Text", "x168 y64 w225 h160 +0x8", "dsa")
}

Help(mango) {
    if mango == "WinterPortal" {
        Run(A_ScriptDir "\.\libs\HelpUI\WinterPortal.ahk")
    } else if mango == "LovePortal" {
        Run(A_ScriptDir "\.\libs\HelpUI\LovePortal.ahk")
    } else if mango == "Legend" {
        Run(A_ScriptDir "\.\libs\HelpUI\Legend.ahk")
    } else if mango == "AntRaid" {
        Run(A_ScriptDir "\.\libs\HelpUI\AntIsland.ahk")
    } 
}
CreateTabControl(myGui) {
    global hometab, winterTab, loveTab, legendTab, StatsTab, TimeTotalValue, TotalRunsValue, TotalWinsValue
    global WinterPortal_data, LovePortal_data, Legends_data, antTab, antRaidOptions, StarterCard, LegendCards
    
    hometab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +AltSubmit", ["Raids", "Portals", "Legend", "Items"])
    hometab.SetFont("c0xFFFFFF")  ; Set text color to white
    hometab.UseTab(1)
    AntBtn := myGui.Add("Button", "x178 y94 w100 h23", "Ant Raid")
    AntBtn.OnEvent("Click", ShowAntTab)
    antTab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +Hidden", ["Ant Raid Settings"])
    antTab.SetFont("c0xFFFFFF")
    antTab.UseTab(1)
    text := myGui.Add("Text", "x180 y100 w100 h23 ", "Select Starter")
    text.SetFont("c0xFFFFFF")

    antRaidOptions := myGui.Add("ListBox", "x180 y120 w100 h60", ["Kings Burden", "Lifeline", "Money Surge", "Exterminator", "no trait no problem"])
    applyBTN3 := myGui.Add("Button", "x280 y190 w100 h23", "Apply")
    backBtn2 := myGui.Add("Button", "x180 y190 w100 h23", "Help")

    AltCardPriority := myGui.Add("Button", "x280 y120 w100 h23", "Card Priority")
    AltCardPriority.OnEvent("Click", ShowAltCardPriority)

    applyBTN3.OnEvent("Click", ApplyAntRaidSettings)
    backBtn2.OnEvent("Click", (*) => Help("AntRaid"))
    StatsTab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +Hidden", ["Stats"])
    StatsTab.SetFont("c0xFFFFFF")
    StatsTab.UseTab(1)
; Titles side by side
    TimeTotal := myGui.Add("Text", "x180 y100 w70 h23 ", "Total Time")
    TimeTotal.SetFont("c0xFFFFFF")

    TotalRuns := myGui.Add("Text", "x260 y100 w70 h23 ", "Total Runs")
    TotalRuns.SetFont("c0xFFFFFF")

    TotalWins := myGui.Add("Text", "x180 y150 w70 h23 ", "Total Wins")
    TotalWins.SetFont("c0xFFFFFF")



; Values aligned below their respective titles
    TimeTotalValue := myGui.Add("Text", "x180 y120 w70 h23 ", "0")

    TimeTotalValue.SetFont("c0xFFFFFF")

    TotalRunsValue := myGui.Add("Text", "x260 y120 w70 h23 ", "0")
    TotalRunsValue.SetFont("c0xFFFFFF")

    TotalWinsValue := myGui.Add("Text", "x180 y170 w70 h23 ", "0")
    TotalWinsValue.SetFont("c0xFFFFFF")

    hometab.UseTab(2)
    WinterPortalBtn := myGui.Add("Button", "x178 y94 w100 h23", "Winter Portal")
    WinterPortalBtn.OnEvent("Click", ShowWinterPortalTab)

    ValentinePortal := myGui.Add("Button", "x178 y120 w100 h23", "Love Portal")
    ValentinePortal.OnEvent("Click", ShowLovePortalTab)

    ; Winter Portal Tab
    winterTab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +Hidden", ["Winter Portal Settings"])
    winterTab.SetFont("c0xFFFFFF")
    winterTab.UseTab(1)
    WinterPortal_data.worldSelect := myGui.Add("ListBox", "x186 y94 w100 h40", ["Namek", "Shibuya"])
    LeechHeader := myGui.Add("Text", "x186 y130 w100 h23", "Leech")
    LeechHeader.SetFont("c0xFFFFFF")
    WinterPortal_data.Leeching := myGui.Add("CheckBox", "x186 y144 w100 h23", "")


    backBtn1 := myGui.Add("Button", "x180 y190 w100 h23", "Help")
    ApplyBtn1 := myGui.Add("Button", "x280 y190 w100 h23", "Apply")
    ApplyBtn1.OnEvent("Click", ApplyWinterPortalSettings)
    backBtn1.OnEvent("Click", WinterPortalHelp)

    ; Love Portal Tab
    loveTab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +Hidden", ["Love Portal Settings"])
    loveTab.SetFont("c0xFFFFFF")
    loveTab.UseTab(1)
    LovePortal_data.hostingSwitch := myGui.Add("CheckBox", "x186 y94 w80 h23", "Hosting")
    LovePortal_data.hostingSwitch.SetFont("c0xFFFFFF")
    possss := myGui.Add("Text", "x270 y74 w100 h23", "Position")

    possss.SetFont("c0xFFFFFF")
    LovePortal_data.positionSelect := myGui.Add("ListBox", "x270 y94 w100 h40", ["Start", "Middle", "End"])
    backBtn2 := myGui.Add("Button", "x180 y190 w100 h23", "Help")
    backBtn2.OnEvent("Click", LovePortalHelp)
    applyBTN2 := myGui.Add("Button", "x280 y190 w100 h23", "Apply")
    applyBTN2.OnEvent("Click", ApplyLovePortalSettings)

    ; Legend Tab
    hometab.UseTab(3)
    bleachBtn := myGui.Add("Button", "x178 y94 w100 h23", "Legend stage")
    bleachBtn.OnEvent("Click", SetBleachWorld)
    legendTab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +Hidden", ["Legend Settings"])
    legendTab.SetFont("c0xFFFFFF")
    legendTab.UseTab(1)
    cardd := myGui.Add("Text", "x180 y100 w100 h23 ", "Select Card")
    cardd.SetFont("c0xFFFFFF")
    LegendCards := myGui.Add("ListBox", "x180 y120 w100 h60 +0x200000", ["Champions", "Exploding", "Immunity", "Quake", "Revitalize", "Thrice"])
    applyBTN3 := myGui.Add("Button", "x280 y190 w100 h23", "Apply")
    
    applyBTN3.OnEvent("Click", ApplyLegendSettings)
    backBtn3 := myGui.Add("Button", "x180 y190 w100 h23", "Help")
    backBtn3.OnEvent("Click", (*) => Help("Legend"))
    hometab.UseTab(4)
    GemBtn := myGui.Add("Button", "x178 y94 w100 h23", "GEM Farm")
    GemBtn.OnEvent("Click", GemFarm)
    ; GreenEssenceBTN.OnEvent("Click", GreenEssenceFarm)



}
WinterPortalHelp(*) {
    Run(A_ScriptDir "\.\libs\HelpUI\WinterPortal.ahk")
    
}
LovePortalHelp(*) {
    MsgBox("Still needs working on")
    
}

ShowAltCardPriority(*) {
    global antRaidOptions, cardPriorityLists := []
    
    CardPriorityPicker := Gui("+AlwaysOnTop")
    CardPriorityPicker.SetFont("s8 w600", "Karla")
    CardPriorityPicker.Add("Text", "x10 y8 w200 h20", "Alt Card Priority Selection")
    Filepath := A_ScriptDir "\.\libs\Settings\MangoSettings\CardPriority.txt"

    cardOptions :=  ["Cooldown", "Range", "Slayer", "Harvest", "Strong", "PressIt", "Damage", "Champion", "UncommonLoot", "CommonLoot", "Speed"]
    
    yPos := 40
    loop 10 {
        priority := A_Index
        CardPriorityPicker.Add("Text", "x10 y" yPos " w80 h20", priority . " Priority:")
        cardPriorityLists.Push(CardPriorityPicker.Add("DropDownList", "x90 y" yPos-4 " w150", cardOptions))
        yPos += 30
    }
    
    for i, dropdown in cardPriorityLists {
        dropdown.Choose(i <= cardOptions.Length ? i : 1)
    }

    ApplyBtn := CardPriorityPicker.Add("Button", "x60 y" yPos " w80 h30", "Apply")
    CancelBtn := CardPriorityPicker.Add("Button", "x150 y" yPos " w80 h30", "Cancel")
    
  
    ApplyBtn.OnEvent("Click", SaveCardPriority)
    CancelBtn.OnEvent("Click", (*) => CardPriorityPicker.Destroy())
    

    CardPriorityPicker.OnEvent("Close", (*) => CardPriorityPicker.Destroy())
    CardPriorityPicker.Title := "Card Priority Settings"
    CardPriorityPicker.Show("w260 h" (yPos + 80))
    

    SaveCardPriority(*) {
        priorities := []
        for dropdown in cardPriorityLists {
            if dropdown.Text != ""
                priorities.Push(dropdown.Text)
        }
        

        priorityFile := FileOpen(A_ScriptDir "\.\libs\Settings\MangoSettings\CardPriority.txt", "w")
        if (priorityFile) {
            for priority in priorities {
                priorityFile.WriteLine(priority)
            }
            priorityFile.Close()
            MsgBox("Card priorities saved successfully")
        } else {
            MsgBox("Failed to save card priorities")
        }
        
        CardPriorityPicker.Destroy()
    }
}
ApplyAntRaidSettings(*) {
    global antRaidOptions, StarterCard
    StarterCard := antRaidOptions.Text
    if (StarterCard = "") {
        MsgBox("Please select a starter card")
        return
    }
    AntRaid(StarterCard)
}
ShowAntTab(*) {
    global hometab, antTab
    hometab.Visible := false
    antTab.Visible := true
    legendTab.Visible := false
    antTab.Value := 1
    StatsTab.Visible := false
}
AntRaid(CardSelected) {
    global MacroSelected, myGui
    StarterCard := CardSelected
    MangoSettings := FileOpen(A_ScriptDir "\.\libs\Settings\MangoSettings\StarterCard.txt", "w")
    MangoSettings.Write(StarterCard)
    MangoSettings.Close()

    hometab.Visible := false 
 
    myGui.Title := "MangoGuards [Ant Raid]"
    MacroSelected.Name := "AntRaid"
}
ApplyWinterPortalSettings(*) {
    global WinterPortal_data, myGui, MacroSelected
    mangosettings := FileOpen(A_ScriptDir "\.\libs\Settings\MangoSettings\map.txt", "w")
    mangoLeach := FileOpen(A_ScriptDir "\.\libs\Settings\MangoSettings\WinterPortal\leech.txt", "w")
    mangoLeach.Write(WinterPortal_data.Leeching.Value ? "true" : "false")
    mangoLeach.Close()
    mangosettings.Write(WinterPortal_data.worldSelect.Text)
    mangosettings.Close()
    WinterPortal_data.World := WinterPortal_data.worldSelect.Text
    MacroSelected.Name := "WinterPortal"
    myGui.Title := "MangoGuards [Winter Portal - " WinterPortal_data.World "]"

}

ApplyLovePortalSettings(*) {
    global LovePortal_data, myGui, MacroSelected
    LovePortal_data.Position := LovePortal_data.positionSelect.Text

    ; host
    HostSettings := FileOpen(A_ScriptDir "\.\libs\Settings\LovePortal\host.txt", "w")
    HostSettings.Write(LovePortal_data.hostingSwitch.Value ? "true" : "false")
    HostSettings.Close()

    ; World 
    PositionSettings := FileOpen(A_ScriptDir "\.\libs\Settings\LovePortal\position.txt", "w")
    PositionSettings.Write(LovePortal_data.positionSelect.Text)

    LovePortal_data.Hosting := LovePortal_data.hostingSwitch.Value ? "true" : "false"
    
    MacroSelected.Name := "ValentinePortal"
    myGui.Title := "MangoGuards [Valentine Portal] - " LovePortal_data.Position " - " (LovePortal_data.Hosting = "true" ? "Hosting" : "Not Hosting")
}


ShowWinterPortalTab(*) {
    global hometab, winterTab, WinterPortal_data
    hometab.Visible := false
    winterTab.Visible := true


    if (!WinterPortal_data.worldSelect.Text) {
        WinterPortal_data.worldSelect.Choose(1) 
        Sleep(50)
    }

    WinterPortal_data.World := WinterPortal_data.worldSelect.Text
    
    ApplyWinterPortalSettings()
}

ShowLovePortalTab(*) {
    global hometab, loveTab, LovePortal_data
    hometab.Visible := false
    loveTab.Visible := true
    
    if (!LovePortal_data.positionSelect.Text) {
        LovePortal_data.positionSelect.Choose(1)
    }
    
    LovePortal_data.hostingSwitch.Value := LovePortal_data.Hosting
    
    ApplyLovePortalSettings()
}

ShowPortalsTab(*) {
    global hometab, myGui
    winterTab.Visible := false
    loveTab.Visible := false
    hometab.Visible := true
    antTab.Visible := false
    legendTab.Visible := false
    hometab.Value := 2  
    StatsTab.Visible := false
}



; CreateFooter(myGui) {
;     global connection
    
;     myGui.Add("Text", "x8 y328 w138 h2 0x10")
;     myGui.Add("Text", "x48 y336 w108 h17", "TinyTask")
;     myGui.Add("Picture", "x8 y336 w35 h38 0x6 +Border", A_ScriptDir "\.\libs\photos\TinyTask.png")
;     connection := myGui.Add("Text", "x48 y352 w100 h18", "[DISCONNECTED]")
; }


GemFarm(*) {
    global MacroSelected, myGui, Legends_data
    
    MacroSelected.Name := "Gems"
    myGui.Title := "MangoGuards [Gems]"

    
}
; GreenEssenceFarm(*) {
;     global MacroSelected, myGui, Legends_data
;     MacroSelected.Name := "Gems"
;     myGui.Title := "MangoGuards [Green Essence]"
;     TeamJson := JSON.stringify(Team)
;     MsgBox(TeamJson)
  

    
; }

SetBleachWorld(*) {
    global MacroSelected, myGui, Legends_data
    legendTab.Visible := true
    hometab.Visible := false
    legendTab.Value := 1

    
    Legends_data.World := "Bleach"
    MacroSelected.Name := "Bleach"
    myGui.Title := "MangoGuards [Bleach]"
}
ApplyLegendSettings(*) {
    global Legends_data, LegendCards
    Legends_data.Card := LegendCards.Text
    LegendSettings := FileOpen(A_ScriptDir "\.\libs\Settings\LegendSettings\CardStarter.txt", "w")
    LegendSettings.Write(Legends_data.Card)
    LegendSettings.Close()
    MsgBox("Legend settings saved")
    

}
start(*) {
    global MacroSelected, WinterPortal_data, LovePortal_data, Legends_data
    GetDisplayInfo()
    fullscreen := IsRobloxFullscreen()

    if fullscreen == false {
        MsgBox("Set your roblox to full screen in roblox settings")
        return
    } else {
        if displayInfo.width < 1920 or displayInfo.height < 1080 or displayInfo.scaling != 100 or !fullscreen {
            MsgBox("Warning: your display resolution is " displayInfo.width "x" displayInfo.height " at " displayInfo.scaling "% scaling. please use resolution 1920x1080 at 100% scaling.")
            return
        } else {
            MacroSelected.Enabled := true
            if MacroSelected.Name == "WinterPortal" {
                sessionName := FileOpen(A_ScriptDir "\.\libs\Settings\MangoSettings\session\SessionName.txt", "w")
                sessionType := FileOpen(A_ScriptDir "\.\libs\Settings\MangoSettings\session\TypeSession.txt", "w")
                SessionRename := "Winter Portal"
                SessionTypeValue := "timer"
                sessionName.Write(SessionRename)
                sessionType.Write(SessionTypeValue)
                sessionName.Close()
                sessionType.Close()
                Run(A_ScriptDir "\.\libs\COMPONENTS\Session.ahk")
                BetterClick(985, 517) ; focuses back on roblox
                BetterClick(985, 517) ; focuses back on roblox
                Sleep(3000)

                if (WinterPortal_data.Leeching.Value) {
                    prompt := MsgBox("Leeching Mode is enabled. would you like to place units?", "Leech Mode", "YesNo")
                    if prompt == "Yes" {
                        Run(A_ScriptDir "\.\libs\Portals\WinterPortals\Leech\UnitPlacement.ahk")
                    } else {
                        Run(A_ScriptDir "\.\libs\Portals\WinterPortals\Leech\NoUnits.ahk")
                    }
                } else {
                    Run(A_ScriptDir "\.\libs\Portals\WinterPortals\WinterPortal.ahk")
                }

            } else if MacroSelected.Name == "ValentinePortal" {
                LovePortalFile()
            } else if MacroSelected.Name == "Bleach" {
                sessionName := FileOpen(A_ScriptDir "\.\libs\Settings\MangoSettings\session\SessionName.txt", "w")
                sessionType := FileOpen(A_ScriptDir "\.\libs\Settings\MangoSettings\session\TypeSession.txt", "w")
                SessionRename := "Legend Stage"
                SessionTypeValue := "timer"
                sessionName.Write(SessionRename)
                sessionType.Write(SessionTypeValue)
                sessionName.Close()
                sessionType.Close()
                Run(A_ScriptDir "\.\libs\COMPONENTS\Session.ahk")
                
                Sleep(3000)
                WinActive("Roblox")
               
                Sleep(1000)
                Run(A_ScriptDir "\.\libs\Legend\AllStages.ahk")
            } else if MacroSelected.Name == "Gems" {
                sessionName := FileOpen(A_ScriptDir "\.\libs\Settings\MangoSettings\session\SessionName.txt", "w")
                sessionType := FileOpen(A_ScriptDir "\.\libs\Settings\MangoSettings\session\TypeSession.txt", "w")
                SessionRename := "Gem Farm"
                SessionTypeValue := "timer"
                sessionName.Write(SessionRename)
                sessionType.Write(SessionTypeValue)
                sessionName.Close()
                sessionType.Close()
                Run(A_ScriptDir "\.\libs\COMPONENTS\Session.ahk")
                Sleep(3000)

                BetterClick(985, 517) ; focuses back on roblox
                BetterClick(985, 517) ; focuses back on roblox
                Sleep(1000)

                Run(A_ScriptDir "\.\libs\Items\GemFarm\script.ahk")
            } else if MacroSelected.Name == "Green Essence" {
                ; GreenEssenceFarm()
                MsgBox("Green Essence Farm not implemented")
            } else if MacroSelected.Name == "AntRaid" {
                sessionName := FileOpen(A_ScriptDir "\.\libs\Settings\MangoSettings\session\SessionName.txt", "w")
                sessionType := FileOpen(A_ScriptDir "\.\libs\Settings\MangoSettings\session\TypeSession.txt", "w")
                SessionRename := "ANT RAID"
                SessionTypeValue := "timer"
                sessionName.Write(SessionRename)
                sessionType.Write(SessionTypeValue)
                sessionName.Close()
                sessionType.Close()
                Run(A_ScriptDir "\.\libs\COMPONENTS\Session.ahk")
                Sleep(3000)

                WinActive("Roblox")
                Sleep(1000)

                Run(A_ScriptDir "\.\libs\Items\Raids\ant\script.ahk")

            } else {
                MsgBox("No macro selected")
            }  
        }
    }
}

LovePortalFile() {

    Run(A_ScriptDir "\.\libs\Portals\LovePortal\host\LovePortalMAIN.ahk")

    ExitApp()
}

stop(*) {
    MacroSelected.Enabled := false

}

Home(*) {
    text.Text := "Anime Mangoguards"
    winterTab.Visible := false
    hometab.Visible := true
    loveTab.Visible := false
    legendTab.Visible := false
    antTab.Visible := false
    StatsTab.Visible := false
  
}
LoadTimeStats() {
    global myGui, TimeTotalValue
    
    timeFilePath := A_ScriptDir . "\libs\Settings\MangoSettings\session\stats\TotalTimeUsage.txt"
    totalSeconds := 0
    
    if FileExist(timeFilePath) {
        try {
            timeFile := FileOpen(timeFilePath, "r")
            savedTime := timeFile.ReadLine()
            timeFile.Close()
            
            if IsInteger(savedTime)
                totalSeconds := Integer(savedTime)
        } catch {
            totalSeconds := 0
        }
    }
    

    hours := Floor(totalSeconds / 3600)
    minutes := Floor(Mod(totalSeconds, 3600) / 60)
    seconds := Mod(totalSeconds, 60)
    
    minStr := minutes < 10 ? "0" . minutes : minutes
    secStr := seconds < 10 ? "0" . seconds : seconds

    formattedTime := hours . ":" . minStr . ":" . secStr

    try {

        if (TimeTotalValue != "") {
            TimeTotalValue.Text := formattedTime
        } else if (myGui.HasProp("TimeTotalValue")) {
            myGui.TimeTotalValue.Text := formattedTime
        } else {
  
            myGui["TimeTotalValue"].Text := formattedTime
        }
    } catch {
 
        try {
            ControlSetText(formattedTime, "Static19", myGui)
        } catch {
            MsgBox("TimeTotalValue control not found. Time is: " . formattedTime)
        }
    }
}
stats(*) {
    text.Text := "Mango Stats"
    hometab.Visible := false
    winterTab.Visible := false
    loveTab.Visible := false
    legendTab.Visible := false
    antTab.Visible := false
    StatsTab.Visible := true
    LoadTimeStats()
    LoadWinsStats()

 
}

LoadWinsStats() {
    Wins := FileOpen(A_ScriptDir . "\libs\Settings\MangoSettings\session\stats\wins.txt", "r")
    Losses := FileOpen(A_ScriptDir . "\libs\Settings\MangoSettings\session\stats\TotalWins.txt", "r")

    winsValue := Wins.ReadLine()
    lossesValue := Losses.ReadLine()
    TotalWinsValue.Text := winsValue
    TotalRunsValue.Text := winsValue + lossesValue

    Wins.Close()
    Losses.Close()
}

SettingFUNC(*) {
    global SettingsGUI, Webhookbox
    
    SettingsGUI := Gui("+AlwaysOnTop")
    SettingsGUI.SetFont("s8 w600", "Karla")
    SettingsGUI.Add("Text", "x10 y8", "Webhook")


    webhookText := ""
    try {
        WebhookUrl := FileOpen(A_ScriptDir "\libs\Settings\webhookURL.txt", "r")
        if WebhookUrl {
            webhookText := WebhookUrl.ReadLine()
            WebhookUrl.Close()
        }
    } catch {
        
    }
    
 
    Webhookbox := SettingsGUI.Add("Edit", "x10 y25 w200 h20 -Wrap", webhookText)

    SaveBtn := SettingsGUI.Add("Button", "x10 y60 w100 h30", "Save")
    TestBtn := SettingsGUI.Add("Button", "x120 y60 w100 h30", "Test")
    SaveBtn.OnEvent("Click", SaveSettings)
    TestBtn.OnEvent("Click", TestWebhook)

    SettingsGUI.OnEvent("Close", CloseSettings)
    SettingsGUI.Title := "Settings"
    SettingsGUI.Show()
}
TestWebhook(*) {
    Run(A_ScriptDir "\.\libs\webhook.ahk")
}
SaveSettings(*) {
    global Webhookbox
    regrex := "https://discord\.com/api/webhooks/\d{17,19}/[a-zA-Z0-9_-]+"
    if !RegExMatch(Webhookbox.Text, regrex) {
        MsgBox("Invalid webhook URL")

        return
    }


    
    TXTFILE := FileOpen(A_ScriptDir "\.\libs\settings\webhookURL.txt", "w")
    TXTFILE.Write(Webhookbox.Text)
    TXTFILE.Close()
    MsgBox("Webhook URL saved")
}

CloseSettings(*) {
    global SettingsGUI
    SettingsGUI.Destroy()
}


Hotkey "F1", start
Hotkey "F3", KILLNOW
Hotkey "F4", (*) => Reload()
KILLNOW(*) {
    
    sessionui := WinExist("Window")
    if (sessionui) {
        WinClose("Window")
    }
    ExitApp()
}


myGui := CreateGui()
myGui.OnEvent('Close', (*) => ExitApp())



