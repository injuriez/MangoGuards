#Requires AutoHotkey v2.0

global X1 := 5 ; left of the box
global Y1 := 150 ; top of the box
global X2 := 500  ; right of the box
global Y2 := 800 ; bottom of the box

 ;Width = X2 - X1
;Height = Y2 - Y1
; Calculate the width and height of the search area
width := X2 - X1
height := Y2 - Y1

; Create a GUI to display the global variables and visualize the search area
myGui := Gui("+AlwaysOnTop", "Variables Preview")
myGui.Add("Text", "x10 y10 w200 h20", "X1: " X1)
myGui.Add("Text", "x10 y40 w200 h20", "Y1: " Y1)
myGui.Add("Text", "x10 y70 w200 h20", "X2: " X2)
myGui.Add("Text", "x10 y100 w200 h20", "Y2: " Y2)
myGui.Add("Text", "x10 y130 w200 h20", "Width: " width)
myGui.Add("Text", "x10 y160 w200 h20", "Height: " height)
okButton := myGui.Add("Button", "x10 y190 w80 h30", "OK")
okButton.OnEvent("Click", OkButtonClicked)
myGui.Show("w" (width + 20) " h" (height + 60))

; Draw a rectangle around the search area
DrawRectangle(X1, Y1, width, height)

OkButtonClicked(*)
{
    myGui.Destroy()
    ; Remove the rectangle when the GUI is closed
    RemoveRectangle()
}

DrawRectangle(x, y, w, h)
{
    global overlayGui
    overlayGui := Gui("+AlwaysOnTop -Caption +ToolWindow +E0x20", "Overlay")
    overlayGui.BackColor := "Red"
    overlayGui.Show("x" x " y" y " w" w " h" h)
}

RemoveRectangle()
{
    global overlayGui
    if (overlayGui)
    {
        overlayGui.Destroy()
    }
}
F2::Reload