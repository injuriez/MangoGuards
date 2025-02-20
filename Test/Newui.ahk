#Requires AutoHotkey v2
;AutoGUI 2.5.8 creator: Alguimist autohotkey.com/boards/viewtopic.php?f=64&t=89901
;AHKv2converter creator: github.com/mmikeww/AHK-v2-script-converter
;Easy_AutoGUI_for_AHKv2 github.com/samfisherirl/Easy-Auto-GUI-for-AHK-v2

myGui := Gui()
myGui.SetFont("cwhite")
myGui.BackColor := "040414"
myGui.SetFont("s10", "karla")
ButtonAnimeVanguards := myGui.Add("Button", "x8 y64 w145 h23 Background0x4a5565", "Anime Vanguards")
myGui.SetFont("cwhite")
myGui.SetFont("s8 Norm", "Karla")
ButtonMacroStats := myGui.Add("Button", "x8 y96 w145 h23 Background0x4a5565", "Macro Stats")
myGui.SetFont("cwhite")
myGui.SetFont("s10 Norm", "Karla")
ButtonUpdates := myGui.Add("Button", "x8 y128 w145 h23 +Default -Theme Background0x4a5565", "Updates!")
myGui.SetFont("cwhite")
myGui.SetFont("s13 Bold", "Karla")
myGui.Add("Text", "x218 y10 w279 h40 +0x200", "ANIME MACROGUARDS")
myGui.Add("Picture", "x168 y10 w40 h40", "C:\Users\Peyto\Downloads\GUI_ChBox-nav_-_Traits.png")

myGui.SetFont("cwhite")
myGui.Add("Text", "x168 y56 w294 h2 Background0x363a3d")  ; Separator color
myGui.Add("Text", "x160 y6 w2 h370 Background0x363a3d")   ; Separator color
myGui.Add("Text", "x8 y328 w144 h2 Background0x363a3d")   ; Separator color
myGui.Add("Text", "x48 y336 w108 h17 +0x200", "TinyTask")
myGui.Add("Picture", "x8 y336 w29 h32", "C:\Users\Peyto\Downloads\icon_32hi.png")
myGui.SetFont("s8 w600", "scr")
myGui.Add("Text", "x48 y352 w102 h18 +0x200", "[CONNECTED]")
myGui.SetFont("cwhite")
myGui.Add("Text", "x8 y56 w150 h2 Background0x363a3d")    ; Separator color
ButtonAnimeVanguards.OnEvent("Click", OnEventHandler)
ButtonMacroStats.OnEvent("Click", OnEventHandler)
ButtonUpdates.OnEvent("Click", OnEventHandler)
myGui.OnEvent('Close', (*) => ExitApp())
myGui.Title := "MacroGuards"
myGui.Show("w426 h378")

OnEventHandler(*)
{
    ToolTip("Click! This is a sample action.`n"
    . "Active GUI element values include:`n"  
    . "ButtonAnimeVanguards => " ButtonAnimeVanguards.Text "`n" 
    . "ButtonMacroStats => " ButtonMacroStats.Text "`n" 
    . "ButtonUpdates => " ButtonUpdates.Text "`n", 77, 277)
    SetTimer () => ToolTip(), -3000 ; tooltip timer
}