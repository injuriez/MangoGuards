#Requires Autohotkey v2
#Include libs/Portals/WinterPortals/WinterPortal.ahk
#Include libs/Portals/WinterPortals/LovePortal.ahk
#Include libs/PC_SETTINGS/resolution.ahk
#Include libs/PC_SETTINGS/Window.ahk

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
    CountdownText := myGui.Add("GroupBox", "x16 y230 w120 h80", "")

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

    myGui.Add("Text", "x24 y248 w105 h23 +0x200", "Gems - 0")
    myGui.Add("Text", "x24 y272 w105 h23 +0x200", "Presents - 0")

}
CreateTabControl(myGui) {
    global hometab, SelectedWorld, worldSelect, winterTab, loveTab
    
    hometab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +AltSubmit", ["Raids", "Portals", "Gems", "Others"])
    
    ; Raids Tab
    hometab.UseTab(1)
    myGui.Add("Button", "x178 y94 w100 h23", "Start Raid")
    myGui.Add("ComboBox", "x178 y124 w100", ["Raid 1", "Raid 2", "Raid 3"])
    
    ; Portals Tab
    hometab.UseTab(2)
    WinterPortalBtn := myGui.Add("Button", "x178 y94 w100 h23", "Winter Portal")
    WinterPortalBtn.OnEvent("Click", ShowWinterPortalTab)

    ValentinePortal := myGui.Add("Button", "x178 y120 w100 h23 Disabled", "Love Portal")
    ValentinePortal.OnEvent("Click", ShowLovePortalTab)

    ; Winter Portal Tab (Initially hidden)
    winterTab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +Hidden", ["Winter Portal Settings"])
    winterTab.UseTab(1)
    worldSelect := myGui.Add("ListBox", "x186 y94 w100 h40", ["Namek", "Shibuya"])
    SelectedWorld := worldSelect.Text  ; Initialize with first selected item
    worldSelect.OnEvent("Change", OnWorldSelect)
    backBtn1 := myGui.Add("Button", "x186 y140 w100 h23", "Back")
    backBtn1.OnEvent("Click", ShowPortalsTab)

    ; Love Portal Tab (Initially hidden)
    loveTab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +Hidden ", ["Love Portal Settings"])
    loveTab.UseTab(1)
    hostingSwitch := myGui.Add("CheckBox", "x186 y94 w80 h23", "Hosting")
    hostingSwitch.OnEvent("Click", ToggleHosting)
    backBtn2 := myGui.Add("Button", "x186 y140 w100 h23", "Back")
    backBtn2.OnEvent("Click", ShowPortalsTab)

    ; Gems Tab
    hometab.UseTab(3)
    myGui.Add("Button", "x178 y94 w100 h23", "Farm Gems")
    myGui.Add("Text", "x178 y124", "Total Gems: 0")
    
    hometab.UseTab()  ; End tab controls
}

ShowWinterPortalTab(*) {
    global hometab, winterTab, worldSelect, SelectedWorld
    hometab.Visible := false
    winterTab.Visible := true

    ; Ensure a selection is made if none exists
    if !SelectedWorld || SelectedWorld = ""
    {
        worldSelect.Choose(1) ; Select the first item in the ListBox
        Sleep 50  ; Small delay to ensure selection applies
    }

    ; Explicitly get the selected item after setting it
    SelectedWorld := worldSelect.Text
}



ShowLovePortalTab(*) {
    global hometab, myGui
    hometab.Visible := false
    loveTab.Visible := true
    SetValentinePortal()
}

ShowPortalsTab(*) {
    global hometab, myGui
    winterTab.Visible := false
    loveTab.Visible := false
    hometab.Visible := true
    hometab.Value := 2  ; Switch back to Portals tab
}

OnWorldSelect(*) {
    global SelectedWorld, worldSelect
    SelectedWorld := worldSelect.Text
    SetWinterPortal()
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
    global MacroSelected, myGui, SelectedWorld, worldSelect
    
    MacroSelected.Name := "WinterPortal"
    SelectedWorld := worldSelect.Text  ; Ensure SelectedWorld is updated
    myGui.Title := "MangoGuards [Winter Portal - " SelectedWorld "]"
}

SetValentinePortal(*) {
    global MacroSelected, myGui, SelectedWorld
    
    MacroSelected.Name := "ValentinePortal"
    myGui.Title := "MangoGuards [Valentine Portal - " SelectedWorld "]"  ; Show selected world
}
; Event Handlers
start(*) {
    global MacroSelected, SelectedWorld, hosting
    GetDisplayInfo()
    fullscreen := IsRobloxFullscreen()

    if fullscreen == false {
        MsgBox("Set your roblox to full screen in roblox settings")
        return
    } else {
        if displayInfo.width < 1920 or displayInfo.height < 1080 or displayInfo.scaling != 100  or !fullscreen {
            MsgBox("Warning: your display resolution is " displayInfo.width "x" displayInfo.height " at " displayInfo.scaling "% scaling. please use resolution 1920x1080 at 100% scaling.")
            return
        } else {
            MacroSelected.Enabled := true
        if MacroSelected.Name == "WinterPortal" {
            WinterPortal(SelectedWorld)  ; Pass the world name
        } else if MacroSelected.Name == "ValentinePortal" {
            LovePortal(hosting)  ; Pass the world name
        } else {
            MsgBox("No macro selected!")
        }
        
    }
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



