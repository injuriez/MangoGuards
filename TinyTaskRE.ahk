#Requires Autohotkey v2
#Include libs/Portals/WinterPortals/WinterPortal.ahk
#Include libs/Portals/WinterPortals/LovePortal.ahk


; Global Variables
global presents := 0
global MacroSelected := {Enabled: false, Name: ""}
global CountdownText := "" 
global connection := ""
global text := ""  ; Add this line
global hometab := "" 
global myGui := ""
global SelectedWorld := 1
global worldSelect := ""
global hosting := false
; GUI Creation
CreateGui() {
    myGui := Gui("+AlwaysOnTop")
    myGui.SetFont("s8 w600", "Karla")

    
    
    ; Left Panel
    CreateLeftPanel(myGui)
    
    ; Main Header
    CreateHeader(myGui)
    
    ; Stats Panel
    CreateStatsPanel(myGui)
    
    ; Tab Control
    CreateTabControl(myGui)
    
    ; Footer
    CreateFooter(myGui)
    
    ; Window Settings
    myGui.Title := "MangoGuards"
    myGui.Show("w426 h378")
    
    return myGui
}

CreateLeftPanel(myGui) {
    global CountdownText  ; Reference the global variable
    CountdownText := myGui.Add("GroupBox", "x16 y230 w120 h80", "0")

    ButtonAnimeVanguards := myGui.Add("Button", "x8 y64 w145 h23", "Anime Vanguards")
    ButtonMacroStats := myGui.Add("Button", "x8 y96 w145 h23", "Macro Stats")
    ButtonUpdates := myGui.Add("Button", "x8 y128 w145 h23", "Updates!")

    
    ; Add button events
    ButtonAnimeVanguards.OnEvent("Click", Home)
    ButtonMacroStats.OnEvent("Click", stats)
    ButtonUpdates.OnEvent("Click", updates)

    myGui.Add("Picture", "x8 y8 w24 h20", A_ScriptDir "\.\libs\photos\K.png")
    myGui.Add("Picture", "x8 y32 w25 h20", A_ScriptDir "\.\libs\photos\M.png")
    myGui.Add("Text", "x40 y8 w77 h23 +0x200", "Start")
    myGui.Add("Text", "x40 y32 w77 h23 +0x200", "Stop")
}

CreateHeader(myGui) {
    global text
    text := myGui.Add("Text", "x218 y10 w279 h40 +0x200", "ANIME MACROGUARDS")
    text.SetFont("s12 w600", "Karla")
    myGui.Add("Picture", "x168 y8 w46 h46 0x6 +Border", A_ScriptDir "\.\libs\photos\Monarch.png")
}

CreateStatsPanel(myGui) {

    CountdownText := myGui.Add("GroupBox", "x16 y230 w120 h80", "0")
    myGui.Add("Text", "x24 y248 w105 h23 +0x200", "Gems - 0")
    myGui.Add("Text", "x24 y272 w105 h23 +0x200", "Presents - 0")

}
CreateTabControl(myGui) {
    global hometab, SelectedWorld, worldSelect
    
    hometab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +AltSubmit", ["Raids", "Portals", "Gems", "Others"])
    
    ; Raids Tab
    hometab.UseTab(1)
    myGui.Add("Button", "x178 y94 w100 h23", "Start Raid")
    myGui.Add("ComboBox", "x178 y124 w100", ["Raid 1", "Raid 2", "Raid 3"])
    
    ; Portals Tab
    hometab.UseTab(2)
    WinterPortalBtn := myGui.Add("Button", "x178 y94 w100 h23", "Winter Portal")
    WinterPortalBtn.OnEvent("Click", SetWinterPortal)

    ValentinePortal := myGui.Add("Button", "x178 y120 w100 h23", "Love Portal")
    ValentinePortal.OnEvent("Click", SetValentinePortal)

    myGui.Add("GroupBox", "x178 y154 w205 h60", "Portal Settings")
    
    ; Selection ListBox
    worldSelect := myGui.Add("ListBox", "x186 y170 w100 h40", ["Namek", "Shibuya"])
    worldSelect.OnEvent("Change", OnWorldSelect)
    SelectedWorld := "Namek"  ; Default selection

    ; Hosting Switch
    hometab.UseTab(2)
    hostingSwitch := myGui.Add("CheckBox", "x300 y180 w80 h23", "Hosting")
    hostingSwitch.OnEvent("Click", ToggleHosting)

    ; Gems Tab
    hometab.UseTab(3)
    myGui.Add("Button", "x178 y94 w100 h23", "Farm Gems")
    myGui.Add("Text", "x178 y124", "Total Gems: 0")
    
    hometab.UseTab()  ; End tab controls
}

OnWorldSelect(*) {
    global SelectedWorld, worldSelect
    SelectedWorld := worldSelect.Text  ; Update selected world
    OutputDebug("Selected World: " SelectedWorld "`n")
}
toggleHosting(*) {
    global hosting, connection
    
    hosting := !hosting
}
CreateFooter(myGui) {
    global connection
    
    myGui.Add("Text", "x8 y328 w138 h2 0x10")
    myGui.Add("Text", "x48 y336 w108 h17", "TinyTask")
    myGui.Add("Picture", "x8 y336 w35 h38 0x6 +Border", A_ScriptDir "\.\libs\photos\TinyTask.png")
    connection := myGui.Add("Text", "x48 y352 w102 h18", "[DISCONNECTED]")
}


SetWinterPortal(*) {
    global MacroSelected, myGui, SelectedWorld
    
    MacroSelected.Name := "WinterPortal"
    myGui.Title := "MangoGuards [Winter Portal - " SelectedWorld "]"  ; Show selected world
}

SetValentinePortal(*) {
    global MacroSelected, myGui, SelectedWorld
    
    MacroSelected.Name := "ValentinePortal"
    myGui.Title := "MangoGuards [Valentine Portal - " SelectedWorld "]"  ; Show selected world
}
; Event Handlers
start(*) {
    global MacroSelected, SelectedWorld, hosting
    
    MacroSelected.Enabled := true
    if MacroSelected.Name == "WinterPortal" {
        WinterPortal(SelectedWorld)  ; Pass the world name
    } else if MacroSelected.Name == "ValentinePortal" {
        LovePortal(hosting)  ; Pass the world name
    } else {
        MsgBox("No macro selected!")
    }
}


stop(*) {
    MacroSelected.Enabled := false
}

Home(*) {
    text.Text := "Anime Macroguards"
    hometab.Visible := true
}

stats(*) {
    text.Text := "Macro Stats"
    hometab.Visible := false
}

updates(*) {
    text.Text := "Updates!!"
    hometab.Visible := false
}



; Hotkeys
Hotkey "k", start
Hotkey "m", stop
Hotkey "9", (*) => ExitApp()
Hotkey "8", (*) => Reload()

; Initialize GUI
myGui := CreateGui()
myGui.OnEvent('Close', (*) => ExitApp())



