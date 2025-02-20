
#Requires Autohotkey v2
#Include libs/Portals/WinterPortals/script.ahk
myGui := Gui("+AlwaysOnTop")
ButtonAnimeVanguards := myGui.Add("Button", "x8 y64 w145 h23", "Anime Vanguards")
ButtonMacroStats := myGui.Add("Button", "x8 y96 w145 h23", "Macro Stats")
ButtonUpdates := myGui.Add("Button", "x8 y128 w145 h23", "Updates!")
myGui.SetFont("s8 w600", "Karla")
text := myGui.Add("Text", "x218 y10 w279 h40 +0x200 ", "ANIME MACROGUARDS")
text.SetFont("s12 w600", "Karla")
myGui.Add("Picture", "x168 y8 w46 h46 0x6 +Border", "C:\Users\Peyto\Downloads\GUI_ChBox-nav_-_Traits.png")
myGui.Add("Text", "x168 y56 w288 h2 0x10")
myGui.Add("Text", "x160 y6 w2 h370")
myGui.Add("Text", "x8 y328 w138 h2 0x10")
myGui.Add("Text", "x48 y336 w108 h17", "TinyTask")
myGui.Add("Picture", "x8 y336 w35 h38 0x6 +Border", "C:\Users\Peyto\Downloads\icon_32hi.png")
connection := myGui.Add("Text", "x48 y352 w102 h18", "[DISCONNECTED]")
myGui.Add("Text", "x8 y56 w144 h2 0x10")
CountdownText := myGui.Add("GroupBox", "x16 y230 w120 h80", "0")
myGui.Add("Text", "x24 y248 w105 h23 +0x200", "Gems - 0")
myGui.Add("Text", "x24 y272 w105 h23 +0x200", "Presents - 0")
myGui.Add("Text", "x40 y32 w77 h23 +0x200", "Stop")
myGui.Add("Text", "x40 y8 w77 h23 +0x200", "Start")
myGui.Add("Picture", "x8 y8 w24 h20", A_ScriptDir "\.\libs\photos\K.png")
myGui.Add("Picture", "x8 y32 w25 h20", A_ScriptDir "\.\libs\photos\M.png")
myGui.Add("Text", "x160 y8 w2 h366 +0x1 +0x10")
hometab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +AltSubmit", ["Raids", "Portals", "Gems", "others"])
hometab.UseTab()
ButtonAnimeVanguards.OnEvent("Click", Home)
ButtonMacroStats.OnEvent("Click", stats)
ButtonUpdates.OnEvent("Click", updates)
myGui.OnEvent('Close', (*) => ExitApp())
myGui.Title := "MacroGuards"
myGui.Show("w426 h378")
MacroSelected := {Enabled: false, Name: "WinterPortal"}
; hotkey
Hotkey "k", start    
Hotkey "m", stop


start(*) {
    MacroSelected.Enabled := true
    if MacroSelected.Name == "WinterPortal" {
        WinterPortal()
    } else {
        MsgBox("Macro not found")
    }

}

stop(*) {

}

OnEventHandler(*)

{

	
}

Home(*) {
    text.Text := "Anime Macroguards"
    hometab.Visible := true ; Macro tabs - Unhidden
}

stats(*) {
    text.Text := "Macro Stats" 
    hometab.Visible := false ; Macro tabs - hidden
}

updates(*) {
    text.Text := "Updates!"
    hometab.Visible := false ; Macro tabs - hidden
}

1::ExitApp
2::Reload