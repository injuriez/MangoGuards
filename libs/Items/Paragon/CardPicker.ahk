#Requires AutoHotkey v2.0
#Include ParagonCards.ahk ; This Holds All The Cards...
#Include ../../FindText.ahk ; This Holds The FindText Function...
#Include ../../COMPONENTS/Session.ahk

VotingUI:="|<>*93$69.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzznzyTzzzzzzzwDzVzzwDzzzz0zw7zzUzzzzw7z1zzw7zzzzUzsDzzUzzzzy3y3wzw7zvzzkTkQ0y07k3zz1w703U0Q0DzsDUk0A0300zzUsA00k0E07zw71UM70i1kTzkEQ7Uw7kS3zy23Uy7Uy00Tzs0w7kw7k07zz07Uw7Uy3zzzw1w00w7kTzzzUDk07U700zzy3y01y0s07zzkTs0Tk7U0zzz7zkDzVz0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"

CardPicker() {
    loop {
        if (FindText(&X, &Y, 724-150000, 476-150000, 724+150000, 476+150000, 0, 0, ChampionsDark)) {
            BetterClick(X, Y)
            Sleep(300)
        } else if (FindText(&X, &Y, ChampionsLight, 0, 0, A_ScreenWidth, A_ScreenHeight)) {
            BetterClick(X, Y)
            Sleep(300)
            break
        } else if (FindText(&X, &Y, 1184-150000, 475-150000, 1184+150000, 475+150000, 0, 0, Immunity)) {
            BetterClick(X, Y)
            Sleep(300)
        } else if (FindText(&X, &Y, 1193-150000, 478-150000, 1193+150000, 478+150000, 0, 0, Drowsy)) {
            BetterClick(X, Y)
            Sleep(300)
        } else if (FindText(&X, &Y, 1189-150000, 476-150000, 1189+150000, 476+150000, 0, 0, Revitalize)) {
            BetterClick(X, Y)
            Sleep(300)
        } else if (FindText(&X, &Y, 739-150000, 478-150000, 739+150000, 478+150000, 0, 0, Dodge)) {
            BetterClick(X, Y)
            Sleep(300)
        } else if (FindText(&X, &Y, 1188-150000, 475-150000, 1188+150000, 475+150000, 0, 0, Thrice)) {
            BetterClick(X, Y)
            Sleep(300)
        } else if (FindText(&X, &Y, 1187-150000, 478-150000, 1187+150000, 478+150000, 0, 0, Shielded)) {
            BetterClick(X, Y)
            Sleep(300)
        } else if (FindText(&X, &Y, 728-150000, 475-150000, 728+150000, 475+150000, 0, 0, Strong)) {
            BetterClick(X, Y)
            Sleep(300)
        } else if (FindText(&X, &Y, 921-150000, 106-150000, 921+150000, 106+150000, 0, 0, VotingUI)) {
            BetterClick(881, 177) ; Clicks yes
            Sleep(300)
            CheckTinyTask()
        }
    }
}

CheckTinyTask() {
    win := WinExist("TinyTask")
    if (win) {
        StartTinyTask1()
    } else {
        StartTinyTask1()
    }
}

StartTinyTask1() {
    CreateSessionUI("Paragon", "info", "Starting TinyTask...AGAIN")
    StartCountdown(20) ; 20 seconds
}


BetterClick(x, y) {
    MouseMove(x, y)
    Sleep(10)
    MouseMove(1, 0, , "R")
    Sleep(20)
    MouseClick("Left", -1, 0, , , , "R")
    Sleep(50)
}
StopApp() {
    ; Finds TinyTask and closes it
    win := WinGetProcessName("TinyTask")
    if (win) {
        WinClose("ahk_id " win)
    }
    ExitApp()
}
F1::CardPicker()
F2::ExitApp()