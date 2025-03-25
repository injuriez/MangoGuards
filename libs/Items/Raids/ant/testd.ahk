#Requires AutoHotkey v2.0

F1::QUITAPP()

QUITAPP() {
    sessionui := WinExist("Window")
    
    if ProcessExist("TinyTask.exe") {
        ProcessClose("TinyTask.exe")
    }
    if (sessionui) {
       WinClose("Window")
    }
    ExitApp
}