#Requires AutoHotkey v2.0


BetterClick(x, y) {
    MouseMove(x, y)
    sleep 10
    MouseMove(1, 0, , "R")
    sleep 20
    MouseClick("Left", -1, 0, , , , "R")
    Sleep(50)
}