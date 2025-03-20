#Requires Autohotkey v2
#Include libs/Items/GemFarm/script.ahk
#Include libs/Items/GreenEssence/script.ahk
#Include libs/PC_SETTINGS/resolution.ahk
#Include libs/PC_SETTINGS/Window.ahk
#Include libs/Legend/Bleach/AllStages.ahk

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

; Use these data objects to store both settings and UI references
global WinterPortal_data := {
    World: "Namek",
    worldSelect: "" ; Will store the ListBox reference
}

global LovePortal_data := {
    Hosting: false, 
    Position: "Start",
    hostingSwitch: "", ; Will store the CheckBox reference
    positionSelect: "" ; Will store the ListBox reference
}

global Legends_data := {
    World: "Bleach"
}

CreateGui() {
    myGui := Gui("+AlwaysOnTop")
    myGui.SetFont("s8 w600", "Karla")


    CreateLeftPanel(myGui)

    CreateHeader(myGui)
    

    ; CreateStatsPanel(myGui)
    
   
    CreateTabControl(myGui)
 

    ; CreateFooter(myGui)
    
  
    myGui.Title := "MangoGuards"
    myGui.Show("w426 h378")
   


    
    return myGui
}

CreateLeftPanel(myGui) {
    global CountdownText  
    CountdownText := myGui.Add("GroupBox", "x16 y230 w120 h80", "Logs")

    ButtonAnimeVanguards := myGui.Add("Button", "x8 y64 w145 h23", "Anime Vanguards")
    ButtonMacroStats := myGui.Add("Button", "x8 y96 w145 h23", "Stats")

    SettingsApply := myGui.Add("Button", "x8 y128 w145 h23 ", "Apply Settings")
    Settings := myGui.Add("Button", "x8 y160 w145 h23", "Settings")


    
    ; Add button events
    SettingsApply.OnEvent("Click", SettingsApplyFUNC)
    ButtonAnimeVanguards.OnEvent("Click", Home)
    ButtonMacroStats.OnEvent("Click", stats)
    Settings.OnEvent("Click", SettingFUNC)

    myGui.Add("Text", "x8 y8 w24 h20 +0x200", "F1 - ")
    myGui.Add("Text", "x8 y32 w25 h20 +0x200", "F2 - ")
    myGui.Add("Text", "x30 y8 w77 h23 +0x200", "Start")
    myGui.Add("Text", "x35 y32 w77 h23 +0x200", "Stop")
    myGui.Add("Text", "x160 y8 w2 h363 +0x1 +0x10")
}

CreateHeader(myGui) {
    global text
    text := myGui.Add("Text", "x218 y10 w279 h40 +0x200", "ANIME MANGOGUARDS")
    text.SetFont("s12 w600", "Karla")
    myGui.Add("Picture", "x168 y8 w46 h46 0x6 ", A_ScriptDir "\.\libs\photos\Monarch.png")
}


; Function to add log entries

CreateSettingsPanel(myGui) {
    myGui.Add("Text", "x168 y64 w225 h160 +0x8", "dsa")
}
CreateTabControl(myGui) {
    global hometab, winterTab, loveTab
    global WinterPortal_data, LovePortal_data, Legends_data, antTab, antRaidOptions, StarterCard
    
    hometab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +AltSubmit", ["Raids", "Portals", "Legend", "Items"])

    hometab.UseTab(1)
    AntBtn := myGui.Add("Button", "x178 y94 w100 h23", "Ant Raid")
    AntBtn.OnEvent("Click", ShowAntTab)
    antTab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +Hidden", ["Ant Raid Settings"])
    antTab.UseTab(1)
    myGui.Add("Text", "x180 y100 w100 h23 ", "Select Starter")
    antRaidOptions := myGui.Add("ListBox", "x180 y120 w100 h60", ["Kings Burden", "Lifeline", "Money Surge", "Exterminator", "no trait no problem"])
    applyBTN3 := myGui.Add("Button", "x280 y190 w100 h23", "Apply")
    backBtn2 := myGui.Add("Button", "x180 y190 w100 h23", "Back")

    AltCardPriority := myGui.Add("Button", "x280 y120 w100 h23", "Card Priority")
    AltCardPriority.OnEvent("Click", ShowAltCardPriority)

    applyBTN3.OnEvent("Click", ApplyAntRaidSettings)



    backBtn2.OnEvent("Click", ShowPortalsTab)


    hometab.UseTab(2)
    WinterPortalBtn := myGui.Add("Button", "x178 y94 w100 h23", "Winter Portal")
    WinterPortalBtn.OnEvent("Click", ShowWinterPortalTab)

    ValentinePortal := myGui.Add("Button", "x178 y120 w100 h23", "Love Portal")
    ValentinePortal.OnEvent("Click", ShowLovePortalTab)

    ; Winter Portal Tab
    winterTab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +Hidden", ["Winter Portal Settings"])
    winterTab.UseTab(1)
    WinterPortal_data.worldSelect := myGui.Add("ListBox", "x186 y94 w100 h40", ["Namek", "Shibuya"])
    backBtn1 := myGui.Add("Button", "x180 y190 w100 h23", "Back")
    ApplyBtn1 := myGui.Add("Button", "x280 y190 w100 h23", "Apply")
    ApplyBtn1.OnEvent("Click", ApplyWinterPortalSettings)
    backBtn1.OnEvent("Click", ShowPortalsTab)

    ; Love Portal Tab
    loveTab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +Hidden", ["Love Portal Settings"])
    loveTab.UseTab(1)
    LovePortal_data.hostingSwitch := myGui.Add("CheckBox", "x186 y94 w80 h23", "Hosting")
    myGui.Add("Text", "x270 y74 w100 h23", "Position")
    LovePortal_data.positionSelect := myGui.Add("ListBox", "x270 y94 w100 h40", ["Start", "Middle", "End"])
    backBtn2 := myGui.Add("Button", "x180 y190 w100 h23", "Back")
    backBtn2.OnEvent("Click", ShowPortalsTab)
    applyBTN2 := myGui.Add("Button", "x280 y190 w100 h23", "Apply")
    applyBTN2.OnEvent("Click", ApplyLovePortalSettings)

    ; Legend Tab
    hometab.UseTab(3)
    bleachBtn := myGui.Add("Button", "x178 y94 w100 h23", "Bleach Secret")
    bleachBtn.OnEvent("Click", SetBleachWorld)

    hometab.UseTab(4)
    GemBtn := myGui.Add("Button", "x178 y94 w100 h23", "GEM Farm")
    GreenEssenceBTN := myGui.Add("Button", "Disabled x178 y120 w100 h23", "Green Essence")
    GemBtn.OnEvent("Click", GemFarm)
    ; GreenEssenceBTN.OnEvent("Click", GreenEssenceFarm)
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
    antTab.Value := 1
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
    
    ; Call ApplyWinterPortalSettings to set initial values
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
    hometab.Value := 2  
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
    
    Legends_data.World := "Bleach"
    MacroSelected.Name := "Bleach"
    myGui.Title := "MangoGuards [Bleach]"
}
; Event Handlers
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
                Run(A_ScriptDir "\.\libs\Portals\WinterPortals\WinterPortal.ahk")
            } else if MacroSelected.Name == "ValentinePortal" {
                LovePortalFile()
            } else if MacroSelected.Name == "Bleach" {
                LegendStart()
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

                GemStart()
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
    ; this opens a ahk file
    Run(A_ScriptDir "\.\libs\Portals\LovePortal\host\LovePortalMAIN.ahk")
    ; close the main ui 
    ExitApp()
}

stop(*) {
    MacroSelected.Enabled := false
}

Home(*) {
    text.Text := "Anime Mangoguards"
    hometab.Visible := true
  
}

stats(*) {
    text.Text := "Mango Stats"
    hometab.Visible := false
 
}

SettingFUNC(*) {
    global SettingsGUI, Webhookbox

    hometab.Visible := true
    SettingsGUI := Gui("+AlwaysOnTop")
    SettingsGUI.SetFont("s8 w600", "Karla")
    SettingsGUI.Add("Text", "x10 y8", "Webhook")
    Webhookbox := SettingsGUI.Add("Edit", "x10 y25 w200", "")
    
    SaveBtn := SettingsGUI.Add("Button", "x10 y60 w100 h30", "Save")
    SaveBtn.OnEvent("Click", SaveSettings)


    SettingsGUI.OnEvent("Close", CloseSettings)
    SettingsGUI.Title := "Settings"
    SettingsGUI.Show()
}

SaveSettings(*) {
    global Webhookbox
    regrex := "https://discord\.com/api/webhooks/\d{17,19}/[a-zA-Z0-9_-]+"
    if !RegExMatch(Webhookbox.Text, regrex) {
        MsgBox("Invalid webhook URL")
        ; Add a red background to indicate error

        return
    }

    ; Reset styling if valid

    
    TXTFILE := FileOpen(A_ScriptDir "\.\libs\settings\webhookURL.txt", "w")
    TXTFILE.Write(Webhookbox.Text)
    TXTFILE.Close()
    MsgBox("Webhook URL saved")
}
SettingsApplyFUNC(*) {
    hometab.Visible := false
    MsgBox("[WARNING] This will change your display resolution and scale, press OK to continue")
    SetDisplayInfo()
    





}
CloseSettings(*) {
    global SettingsGUI
    SettingsGUI.Destroy()
}


Hotkey "F1", start
Hotkey "F3", KILLNOW

KILLNOW(*) {

    sessionui := WinExist("Window")
    if (sessionui) {
        WinClose("Window")
    }
    ExitApp()
}


myGui := CreateGui()
myGui.OnEvent('Close', (*) => ExitApp())



