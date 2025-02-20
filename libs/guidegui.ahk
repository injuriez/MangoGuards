#Requires AutoHotkey v2.0
#MaxThreadsPerHotkey 2

; Function to open the guide
OpenGuide() {
    GuideGUI.Show("w800")
}

; Function to load built-in macros

GuideGUI := Gui("+AlwaysOnTop")
GuideGUI.SetFont("s10 bold", "Segoe UI")
GuideGUI.Title := "Auto Challenge Guide"

GuideGUI.BackColor := "0c000a"
GuideGUI.MarginX := 20
GuideGUI.MarginY := 20
GuideGUI.OnEvent("Close", (*) => GuideGUI.Hide())

; Add an image\

GuideGUI.SetFont("s16 bold", "Segoe UI")

GuideGUI.Add("Text", "x3 w800 cWhite +Center", "You must set your camera sensitivity in-game according to the text below")

GuideGUI.Add("Text", "x0 w800 cWhite +Center", "You must set your UI Scale to 1 in-game")

GuideGUI.Add("Text", "x0 w800 cWhite +Center", "You must have Vegeta equipped in slot 1 (evolved + high level preferred)")

GuideGUI.Add("Text", "x0 w800 cWhite +Center", "Your scale must be set to 100% (Windows settings > Display Settings > Scale")

GuideGUI.Add("Text", "x0 w800 cWhite +Center", "Press F2 to start the macro. Good luck!")

#Requires AutoHotkey v2.0
#MaxThreadsPerHotkey 2

; Function to open the guide
PSLinkGuide() {
    PSLinkGuideGUI.Show("w800")
}

; Function to load built-in macros

PSLinkGuideGUI := Gui("+AlwaysOnTop")
PSLinkGuideGUI.SetFont("s10 bold", "Segoe UI")
PSLinkGuideGUI.Title := "PS Link Guide"

PSLinkGuideGUI.BackColor := "0c000a"
PSLinkGuideGUI.MarginX := 20
PSLinkGuideGUI.MarginY := 20
PSLinkGuideGUI.OnEvent("Close", (*) => PSLinkGuideGUI.Hide())

; Add an image\

PSLinkGuideGUI.SetFont("s16 bold", "Segoe UI")

PSLinkGuideGUI.Add("Text", "x3 w800 cWhite +Center", "Copy your PS link from here")

PSLinkGuideGUI.Add("Text", "x0 w800 cWhite +Center", "Paste the link into your browser")

PSLinkGuideGUI.Add("Text", "x0 w800 cWhite +Center", "A different link will now appear, copy it and paste it into the PS link box!")
PSLinkGuideGUI.Add("Picture", "x20 w760  Center", "Lib\Images\pslink3.png") ; Update the path to your image
