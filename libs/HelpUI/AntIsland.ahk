
#Requires Autohotkey v2
;AutoGUI 2.5.8 creator: Alguimist autohotkey.com/boards/viewtopic.php?f=64&t=89901
;AHKv2converter creator: github.com/mmikeww/AHK-v2-script-converter
;Easy_AutoGUI_for_AHKv2 github.com/samfisherirl/Easy-Auto-GUI-for-AHK-v2
HELPUI() {
avImagePath := A_ScriptDir . "\Images\av.png"
robloxImagePath := A_ScriptDir . "\Images\Roblox.png"
myGui := Gui()
myGui.SetFont("s17 Bold")
myGui.Add("Text", "x8 y-8 w347 h81 +0x200", "ANT ISLAND TUTORIAL")
myGui.SetFont("s15")
myGui.Add("Text", "x8 y48 w204 h109 +0x200", "ROBLOX SETTINGS")
myGui.Add("Text", "x15 y140 w0 h0", "STEP 1: SET UP TINYTASK")
myGui.Add("Text", "x10 y377 w699 h2 +0x10")
myGui.SetFont("s13 Bold")
myGui.Add("Text", "x16 y400 w120 h23 +0x200", "Guide")
myGui.Add("GroupBox", "x8 y376 w702 h233 +Left")
myGui.SetFont("s9 Bold")
myGui.Add("Text", "x16 y424 w134 h23 +0x200", "step 1: setup tinytask")
myGui.Add("Picture", "x16 y129 w695 h131", avImagePath)
myGui.Add("Picture", "x16 y263 w695 h109", robloxImagePath)
myGui.SetFont("s6")
myGui.Add("Text", "x16 y448 w168 h23 +0x200", "Open TinyTask")
myGui.Add("Text", "x16 y472 w160 h23 +0x200", "Set The playback key to f8")
myGui.Add("Text", "x16 y496 w165 h23 +0x200", "Set continous playback ON")
myGui.SetFont("s8 Bold")
myGui.Add("Text", "x16 y520 w162 h23 +0x200", "Step 2: Ant island setup")
myGui.SetFont("s6")
myGui.Add("Text", "x16 y544 w162 h23 +0x200", "Press Ant island in mangoguards")
myGui.Add("Text", "x16 y568 w191 h23 +0x200", "Setup your settings then press apply")
myGui.Add("Text", "x200 y392 w3 h198 +0x1 +0x10")
myGui.SetFont("s9 Bold")
myGui.Add("Text", "x208 y424 w238 h23 +0x200", "Step 3: Starting Ant island")
myGui.SetFont("s6")
myGui.Add("Text", "x208 y448 w144 h23 +0x200", "Load into ant island")
myGui.Add("Text", "x208 y472 w197 h23 +0x200", "Find a good position to start your tinytask")
myGui.Add("Text", "x208 y496 w120 h23 +0x200", "Now restart the match")
myGui.Add("Text", "x208 y520 w229 h23 +0x200", "Once the starter cards are on screen press f1")
myGui.OnEvent('Close', (*) => ExitApp())
myGui.Title := "Ant island tutorial"
myGui.Show("w722 h632")
}
HELPUI()