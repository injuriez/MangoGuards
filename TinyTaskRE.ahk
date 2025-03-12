#Requires Autohotkey v2
#Include libs/Portals/WinterPortals/WinterPortal.ahk
#Include libs/Items/GemFarm/script.ahk
#Include libs/Items/GreenEssence/script.ahk
#Include libs/COMPONENTS/Session.ahk
#Include libs/PC_SETTINGS/resolution.ahk
#Include libs/PC_SETTINGS/Window.ahk
#Include libs/Legend/Bleach/AllStages.ahk

global presents := 0
global MacroSelected := {Enabled: false, Name: ""}
global CountdownText := "" 
global connection := ""
global text := ""
global hometab := "" 
global winterTab := ""
global loveTab := ""
global myGui := ""
global DisplaySessions 


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
global Team := {
    Slot1: {
        Placement: 0,
        Monarch: false,
        MoneyUnit: false

    },
    Slot2: {
        Placement: 0,
        Monarch: false,
        MoneyUnit: false

    },
    Slot3: {
        Placement: 0,
        Monarch: false,
        MoneyUnit: false

    },
    Slot4: {
        Placement: 0,
        Monarch: false,
        MoneyUnit: false
    },
    Slot5: {
        Placement: 0,
        Monarch: false,
        MoneyUnit: false
    },
    Slot6: {
        Placement: 0,
        Monarch: false,
        MoneyUnit: false
    }
    
}
global Legends_data := {
    World: "Bleach"
}

CreateGui() {
    myGui := Gui("+AlwaysOnTop")
    myGui.SetFont("s8 w600", "Karla")


    CreateLeftPanel(myGui)

    CreateHeader(myGui)
    

    CreateStatsPanel(myGui)
    
   
    CreateTabControl(myGui)
 

    ; CreateFooter(myGui)
    
  
    myGui.Title := "MangoGuards"
    myGui.Show("w426 h378")
    TeamTab.Visible := false
    
    return myGui
}

CreateLeftPanel(myGui) {
    global CountdownText  
    CountdownText := myGui.Add("GroupBox", "x16 y230 w120 h80", "Logs")

    ButtonAnimeVanguards := myGui.Add("Button", "x8 y64 w145 h23", "Anime Vanguards")
    ButtonMacroStats := myGui.Add("Button", "x8 y96 w145 h23", "Stats")

    TeamSetUp := myGui.Add("Button", "x8 y128 w145 h23", "Team Setup")
    Settings := myGui.Add("Button", "x8 y160 w145 h23", "Settings")


    
    ; Add button events
    TeamSetUp.OnEvent("Click", TeamCreate)
    ButtonAnimeVanguards.OnEvent("Click", Home)
    ButtonMacroStats.OnEvent("Click", stats)
    Settings.OnEvent("Click", SettingFUNC)

    myGui.Add("Text", "x8 y8 w24 h20 +0x200", "K - ")
    myGui.Add("Text", "x8 y32 w25 h20 +0x200", "F2 - ")
    myGui.Add("Text", "x30 y8 w77 h23 +0x200", "Start")
    myGui.Add("Text", "x35 y32 w77 h23 +0x200", "Stop")
    myGui.Add("Text", "x160 y8 w2 h363 +0x1 +0x10")
}

CreateHeader(myGui) {
    global text
    text := myGui.Add("Text", "x218 y10 w279 h40 +0x200", "ANIME MACROGUARDS")
    text.SetFont("s12 w600", "Karla")
    myGui.Add("Picture", "x168 y8 w46 h46 0x6 ", A_ScriptDir "\.\libs\photos\Monarch.png")
}

CreateStatsPanel(myGui) {
    
    ; Create a multi-line, read-only text box with vertical scrollbar for logs
    ActivityLog := myGui.Add("Text", "x830 y140 w238 h260 r7 cffffff +BackgroundTrans +Center", "Macro Launched")
    ; Initialize with empty text or welcome message
}

; Function to add log entries

CreateSettingsPanel(myGui) {
    myGui.Add("Text", "x168 y64 w225 h160 +0x8", "dsa")
}
CreateTabControl(myGui) {
    global hometab, winterTab, loveTab
    global WinterPortal_data, LovePortal_data, Legends_data, TeamTab
    
    hometab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +AltSubmit", ["Portals", "Legend", "Items"])
    

    hometab.UseTab(1)
    WinterPortalBtn := myGui.Add("Button", "x178 y94 w100 h23", "Winter Portal")
    WinterPortalBtn.OnEvent("Click", ShowWinterPortalTab)

    ValentinePortal := myGui.Add("Button", "  x178 y120 w100 h23 ", "Love Portal")
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
    loveTab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +Hidden ", ["Love Portal Settings"])
    loveTab.UseTab(1)
    LovePortal_data.hostingSwitch := myGui.Add("CheckBox", "x186 y94 w80 h23", "Hosting")
    myGui.Add("Text", "x270 y74 w100 h23", "Position")
    LovePortal_data.positionSelect := myGui.Add("ListBox", "x270 y94 w100 h40", ["Start", "Middle", "End"])
    backBtn2 := myGui.Add("Button", "x180 y190 w100 h23", "Back")
    backBtn2.OnEvent("Click", ShowPortalsTab)
    applyBTN2 := myGui.Add("Button", "x280 y190 w100 h23", "Apply")
    applyBTN2.OnEvent("Click", ApplyLovePortalSettings)
    
    ; Legend Tab
    hometab.UseTab(2)
    bleachBtn := myGui.Add("Button", "x178 y94 w100 h23", "Bleach Secret")
    bleachBtn.OnEvent("Click", SetBleachWorld)
    
    hometab.UseTab(3)

    GemBtn := myGui.Add("Button", "x178 y94 w100 h23", "GEM Farm")
    GreenEssenceBTN := myGui.Add("Button", "Disabled x178 y120 w100 h23", "Green Essence")
    GemBtn.OnEvent("Click", GemFarm)
    ; GreenEssenceBTN.OnEvent("Click", GreenEssenceFarm)

     
    ; 
    TeamTab := myGui.Add("Tab3", " Disabled x168 y64 w225 h220 +0x8 +AltSubmit", ["Team Setup"])
    TeamTab.UseTab(1)
    
    ; Column headers
    myGui.Add("Text", "x178 y74 w100 h20", "Unit Slots")
    myGui.Add("Text", "x280 y74 w100 h20", "Placement")
    
    ; Slot layout with combo boxes in a grid formation
    slotBaseY := 94
    slotSpacing := 30
    
    ; Slot 1
    myGui.Add("Text", "x178 y" slotBaseY " w100 h23", "Slot 1")
    Team.Slot1.PlacementBox := myGui.Add("DropDownList", "x280 y" slotBaseY " w100", ["Monarch", "3/3", "4/4", "SprintWagon", "Taka"])
    Team.Slot1.PlacementBox.OnEvent("Change", UpdateTeamSlot.Bind("Slot1"))
    Team.Slot1.PlacementBox.Choose(Team.Slot1.Placement)
    
    ; Slot 2
    myGui.Add("Text", "x178 y" (slotBaseY + slotSpacing) " w100 h23", "Slot 2")
    Team.Slot2.PlacementBox := myGui.Add("DropDownList", "x280 y" (slotBaseY + slotSpacing) " w100", ["Monarch", "3/3", "4/4", "SprintWagon", "Taka"])
    Team.Slot2.PlacementBox.OnEvent("Change", UpdateTeamSlot.Bind("Slot2"))  ; Changed from Team.Slot1 to Team.Slot2
    Team.Slot2.PlacementBox.Choose(Team.Slot2.Placement)

    
    ; Slot 3
    myGui.Add("Text", "x178 y" (slotBaseY + slotSpacing*2) " w100 h23", "Slot 3")
    Team.Slot3.PlacementBox := myGui.Add("DropDownList", "x280 y" (slotBaseY + slotSpacing*2) " w100", ["Monarch", "3/3", "4/4", "SprintWagon", "Taka"])
    Team.Slot3.PlacementBox.OnEvent("Change", UpdateTeamSlot.Bind("Slot3"))  ; Changed from Team.Slot1 to Team.Slot3
    Team.Slot3.PlacementBox.Choose(Team.Slot3.Placement)

    
    ; Slot 4
    myGui.Add("Text", "x178 y" (slotBaseY + slotSpacing*3) " w100 h23", "Slot 4")
    Team.Slot4.PlacementBox := myGui.Add("DropDownList", "x280 y" (slotBaseY + slotSpacing*3) " w100", ["Monarch", "3/3", "4/4", "SprintWagon", "Taka"])
    Team.Slot4.PlacementBox.OnEvent("Change", UpdateTeamSlot.Bind("Slot4"))  ; Changed from Team.Slot1 to Team.Slot4
    Team.Slot4.PlacementBox.Choose(Team.Slot4.Placement)

    
    ; Slot 5
    myGui.Add("Text", "x178 y" (slotBaseY + slotSpacing*4) " w100 h23", "Slot 5")
    Team.Slot5.PlacementBox := myGui.Add("DropDownList", "x280 y" (slotBaseY + slotSpacing*4) " w100", ["Monarch", "3/3", "4/4", "SprintWagon", "Taka"])
    Team.Slot5.PlacementBox.OnEvent("Change", UpdateTeamSlot.Bind("Slot5"))  ; Changed from Team.Slot1 to Team.Slot5
    Team.Slot5.PlacementBox.Choose(Team.Slot5.Placement)

    
    ; Slot 6
    myGui.Add("Text", "x178 y" (slotBaseY + slotSpacing*5) " w100 h23", "Slot 6")
    Team.Slot6.PlacementBox := myGui.Add("DropDownList", "x280 y" (slotBaseY + slotSpacing*5) " w100", ["Monarch", "3/3", "4/4", "SprintWagon", "Taka"])
    Team.Slot6.PlacementBox.OnEvent("Change", UpdateTeamSlot.Bind("Slot6"))  ; Changed from Team.Slot1 to Team.Slot6
    Team.Slot6.PlacementBox.Choose(Team.Slot6.Placement)



}
UpdateTeamSlot(slotName, *) {
    global Team
    
    slot := Team.%slotName%
    selection := slot.PlacementBox.Text
    
    if (selection = "Monarch") {
        slot.Placement := 1
        slot.Monarch := true
    } else if (selection = "3/3") {
        slot.Placement := 3
        slot.Monarch := false
    } else if (selection = "4/4") {
        slot.Placement := 4
        slot.Monarch := false
    } else if (selection = "SprintWagon") {
        slot.Placement := 3
        slot.Monarch := false
        slot.MoneyUnit := true
    } else if (selection = "Taka") {
        slot.Placement := 1
        slot.Monarch := false
        slot.MoneyUnit := true

    }
    
    ; Optional: Debug message to confirm update
    ; MsgBox(slotName " updated to: " selection " (Placement: " slot.Placement ", Monarch: " slot.Monarch ")")
}
ApplyWinterPortalSettings(*) {
    global WinterPortal_data, myGui, MacroSelected
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
                WinterPortal(WinterPortal_data.World) 
            } else if MacroSelected.Name == "ValentinePortal" {
               
                LovePortalFile()
            } else if MacroSelected.Name == "Bleach" {
                LegendStart()
            } else if MacroSelected.Name == "Gems" {
                CreateSessionUI("Gem / Stat Farm")
                BetterClick(985, 517) ; focuses back on roblox
                BetterClick(985, 517) ; focuses back on roblox
                Sleep(1000)

                GemStart()
            } else if MacroSelected.Name == "Green Essence" {
                ; GreenEssenceFarm()
                MsgBox("Green Essence Farm not implemented")
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
    TeamTab.Visible := false
}

stats(*) {
    text.Text := "Mango Stats"
    hometab.Visible := false
    TeamTab.Visible := false
}

SettingFUNC(*) {
    global SettingsGUI, Webhookbox, DisplaySessions ; Declare globally

    hometab.Visible := true
    SettingsGUI := Gui("+AlwaysOnTop")
    SettingsGUI.SetFont("s8 w600", "Karla")
    SettingsGUI.Add("Text", "x10 y8", "Webhook")
    Webhookbox := SettingsGUI.Add("Edit", "x10 y25 w200", "")
    
    SaveBtn := SettingsGUI.Add("Button", "x10 y60 w100 h30", "Save")
    SaveBtn.OnEvent("Click", SaveSettings)

    SettingsGUI.Add("Text", "x10 y100", "Sessions")
    DisplaySessions := SettingsGUI.Add("CheckBox", "x10 y120 w150 h30", "Display Session UI")
    DisplaySessions.OnEvent("Click", (*) => SessionUIsave())
    SettingsGUI.OnEvent("Close", CloseSettings)
    SettingsGUI.Title := "Settings"
    SettingsGUI.Show()
}

SaveSettings(*) {
    global Webhookbox
    TXTFILE := FileOpen(A_ScriptDir "\.\libs\settings\webhookURL.txt", "w")
    TXTFILE.Write(Webhookbox.Text)
    TXTFILE.Close()
}
TeamCreate(*) {
    text.Text := "Team Setup"
    hometab.Visible := false
    TeamTab.Visible := true





}
CloseSettings(*) {
    global SettingsGUI
    SettingsGUI.Destroy()
}
SessionUIsave(*) {
    global DisplaySessions
    TXTFILE := FileOpen(A_ScriptDir "\.\libs\settings\SessionUI", "w")
    TXTFILE.Write(DisplaySessions.Value)
    TXTFILE.Close()
}


; Hotkeys
Hotkey "k", start
Hotkey "F2", KILLNOW

KILLNOW(*) {
    ; Check if CloseSessionUI function exists before calling it
    CloseSessionUI()
    ExitApp()
}

; Initialize GUI
myGui := CreateGui()
myGui.OnEvent('Close', (*) => ExitApp())



