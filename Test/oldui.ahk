
#Requires Autohotkey v2
;AutoGUI 2.5.8 creator: Alguimist autohotkey.com/boards/viewtopic.php?f=64&t=89901
;AHKv2converter creator: github.com/mmikeww/AHK-v2-script-converter
;Easy_AutoGUI_for_AHKv2 github.com/samfisherirl/Easy-Auto-GUI-for-AHK-v2

myGui := Gui()
ButtonAnimeVanguards := myGui.Add("Button", "x8 y64 w145 h23 Background0x4a5565", "Anime Vanguards")
ButtonMacroStats := myGui.Add("Button", "x8 y96 w145 h23", "Macro Stats")
ButtonUpdates := myGui.Add("Button", "x8 y128 w145 h23", "Updates!")
text := myGui.Add("Text", "x218 y10 w279 h40 +0x200", "ANIME MACROGUARDS")
myGui.Add("Picture", "x168 y10 w42 h42 0x6 +Border", "C:\Users\Peyto\Downloads\GUI_ChBox-nav_-_Traits.png")
myGui.Add("Text", "x168 y56 w292 h2 0x10")
myGui.Add("Text", "x160 y6 w2 h370")
myGui.Add("Text", "x8 y328 w142 h2 0x10")
myGui.Add("Text", "x48 y336 w108 h17", "TinyTask")
myGui.Add("Picture", "x8 y336 w31 h34 0x6 +Border", "C:\Users\Peyto\Downloads\icon_32hi.png")
myGui.Add("Text", "x48 y352 w102 h18", "[CONNECTED]")
myGui.Add("Text", "x8 y56 w148 h2 0x10")
hometab := myGui.Add("Tab3", "x168 y64 w225 h160 +0x8 +AltSubmit", ["Raids", "Portals", "Gems", "others"])
hometab.UseTab()
ButtonAnimeVanguards.OnEvent("Click", Home)
ButtonMacroStats.OnEvent("Click", stats)
ButtonUpdates.OnEvent("Click", updates)
myGui.OnEvent('Close', (*) => ExitApp())
myGui.Title := "MacroGuards"
myGui.Show("w426 h378")

OnEventHandler(*)

{

	
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
    text.Text := "Updates!"
    hometab.Visible := false
}