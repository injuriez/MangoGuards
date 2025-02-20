#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\libs\FindText.ahk
Namek:="|<>*99$125.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzwTzz0CDzzzzz7yDXzzzzzszzy0ATzzzzyDwD7zzzzzlzzw0MzzzzzwTsSDzzzzzXzzsslwH8z1kDkQQH8lwH6zzllXk60Q10TUMk601k68zzX370A0k20z0F0A010A1zz06CAMlX77y82AMVWAM7zy0QMslk0CDwM0slX0skTzw7sslXWDwTsk8lX68lUTzszkk374BsTlkE36AE30TzlzVk6C81kTXkk6AMk68TzbzXlAww7kzDnlAtnlAtzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
yes:="|<>*120$71.0D1vkS0000000S1zUQ0000000w3y0zy0Ts001s3w3zz7zw001s7kDzzTzy003s70Tkzz3y003k61w0Tk0w003k87k0T00s007k0D00S03k007U0w00M07U007U3k30kTS000DU7UT1UDw000D0T0w3U1w000D1y00701s3zzy3w00T01zzzzw7s01zU3zzzzsDkDzxs7zzzzkTk67ksDzzzzUzU0700Tzzzz1zU0C00zzzzy3zU0Q03zzzzw7zU1y0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
cancel:="|<>*134$121.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007U00000s000000000000Dw00007zk00000000000Dz0000Dzy0000000000073U000TkTU000000000030k000T01s00000000001UM000S00S00000000001kA000C00700000000000s6000C003bztyy03z0DyQ3000C001zzzzzk7zsTzy1U0070Tlzzzzzy7zyTXz0k003UTzz0UsM7bU7y0DUM003USDz00M01rU0y03kA001kC3z00A00TU0S00s6000sC0700600DU0C00Q3000Q703U03003U060s61U00C3U3UA1UC1k770y30k0070s7kD0kDUs7zUS1UM03zUTzsDkM7kQ7zk00kDzzzk7zw7sA3s63zs00s7zzzw1zC1s61w30zw01w3zzzy0C30030y1UAC1zy1zzzzU00k01UT0s03UCD0Dzzzs00M00kDUQ01k03k3zzzy00C00M7kD00w01s1zzzzU0DU0A3sDk0z00w0zzzzw0TwCD3y7y1zk0zUzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
shibuya:="<>*96$67.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz7nzAzzzzzzz0szWDzzzzzz0ATn7zzzzzzXCDzXzzzzzzlz0wkDDAwQHsDU683XUCA1y1k340ll640zUMlWAMsV6ATyAQF74QM2CDb6C8X2AC3X7k374E3071k3s1XW83k3lw1y3nnAXwHsz4zzzzzzzzszzzzzzzzzzwTzzzzzzzzzwTzzzzzzzzzzDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
create:="<>*160$182.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz07zzzzzzzzzzzzzzzzzzzzzzzzzzzz00Dzzzzzzzzzzzz3zzzzzzzzzzzzzz001zzzzzzzzzzzzUTzzzzzzzzzzzzz000Dzzzzzzzzzzzs7zzzzzzzzzzzzzU001zzzzzzzzzzzy1zzzzzzzzzzzzzk000zzzzzzzzzzzzUTzzzzzzzzzzzzw000Dzzzzzzzzzzzs7zzzzzzzzzzzzy07y7zzzzzzzzzzzy1zzzzzzzzzzzzz07znzjkzy0zzzzzz0Dzy0zzzzzzzzzk3zzz0k3y01zy0kC007y01zzzzzzzzw1zzzk00y00Dz001U00y00Dzzzzzzzz0Tzzw00D001z000M00D001zzzzzzzzUDzzz003U00Tk006003U00Tzzzzzzzs3zzzk01s003s001U01s003zzzzzzzy0zzzw00Q0Q0w000M00Q0Q0zzzzzzzzUDzzz0Dz0DUD0607k3z0DUDzzzzzzzs3zzzk7zk7w3k7s1y1zk7w3zzzzzzzy0Tzzw1zs1y0s1y0TUTs1y0zzzzzzzzk7zzz0Ty000C0zk7s7y000Dzzzzzzzw1zzzk7zU003UDw1y1zU003zzzzzzzz0Dzzw1zs001s3y0TUTs001zzzzzzzzs1zwT0Ty0Tzz0TU7s7y0Tzzzzzzzzzy07w7k7zk7zzk3k1y0zk7zzzzzzzzzzk000w1zw0zrw000TU1w0zrzzzzzzzzy00070Tz000zU007s0D000zzzzzzzzzU001k7zs007s001y01s007zzzzzzzzy000w1zz001z000Tk0T001zzzzzzzzzk00T0Tzs00Ts007w0Ds00Tzzzzzzzzz00DkDzz007zU43zk3z007zzzzzzzzzw0Ty7zzw07zy7lzz1zw07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
darkerYes:="|<>*85$102.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000D01k0000000000000zk7w0000000000001zkDz0000000000003xsTT0000000000003kwS7U000000000007UQw3U0000000000070Ss3k000000000007UDs3zs0zs00000003UDk7zz3zy00000003k7k7zzbzz00000001s3UDsDzkTU0000001s30T03y03k0000000w10S01w01k0000000S00w00w03k0000000S01s00M03k0000000D01s00M7bU00000007U3k7UM3zU00000007U7kDUQ0DU00000003k7k00Q03k0000zzzzkDk00S01zzzzzzzzzkDk00z01zzzzzzzzzkDkDzzk1zzzzzzzzzkDk7zwT1zzzzzzzzzkDs00s21zzzzzzzzzkDs00s01zzzzzzzzzkDw00s01zzzzzzzzzkDy00w03zzzzzzzzzsDzU1y07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
darkerCancel:="|<>*104$132.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000Dk00000Dw0000000000000Tw00000zzU000000000000ww00003zzs000000000000sC0000Dk1w000000000000kC0000T00S000000000000kC0000w00C000000000000kC0000s00C000000000000kC0001k00C7zwzTU0Ts1zskC0003k1UCTzzzzs1zy7zykC0003U7wRzzzzzy7wzDkzkC0003UTzzs47UUTDU7y07kC00070SDzU07007S03w03kC00070s3b007003w01s01kC00070s0C007003s01k01kC00070k0C007001s01k20kC00070s0Q0U70A1k33UD0kC00070s0Q3s70S1kDrUT0kC00070s7w3s70z0kDzU00kC00zz0Tzw3s70z0kDzU00kDzzzzUTzw3s70z0kDzU01kDzzzzU7wQ1k70z0k7bUTzkDzzzzk00A0070z0k03UDzk3zzzzk00C0070z0s01k03k1zzzzs00D0070z0w01k01s1zzzzw00D0070z0w01s01s1zzzzz00Tk070z0z03w01w1zzzzzk1zsA7VzVzkDz03y1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
global running := false
Hotkey("k", StartMacro)
Hotkey("m", StopMacro)
BetterClick(x, y) {
    MouseMove(x, y)
    Sleep 10
    MouseMove(1, 0, , "R")
    Sleep 20
    MouseClick("Left", -1, 0, , , , "R")
    Sleep 50
}

; Correct way to bind functions to hotkeys


StartMacro(*) {
    global running
    running := true
    ; Move mouse to starting position
    x_offset := 0  ; Initialize x_offset
    MouseMove(749 + x_offset, 500)
    loop {
        if (!running) {
            break
        }
        if (FindText(&X, &Y, 697-150000, 603-150000, 697+150000, 603+150000, 0, 0, Namek)) {
            MouseGetPos(&mouseX, &mouseY)
            BetterClick(mouseX, mouseY + 90)
            Sleep(2000)
            ; find the yes button

            Yesbutton()
            break
        } else if (FindText(&X, &Y, 697-150000, 603-150000, 697+150000, 603+150000, 0, 0, shibuya)) {
            MouseGetPos(&mouseX, &mouseY)
            BetterClick(mouseX, mouseY + 90)
            Sleep(2000)
            ; find the yes button
            Yesbutton()
            break
        } else {
            BetterClick(749 + x_offset, 500)  ; Click the starting position
            Sleep(2000)
        }
        x_offset += 170  ; Increase x_offset by 170 for next loop
    }
}

StopMacro(*) {
    global running
    running := false
}

Yesbutton() {
    loop {
        if (ok:=FindText(&X, &Y, 846-150000, 557-150000, 846+150000, 557+150000, 0, 0, yes)) {
            BetterClick(X, Y)
            Sleep(500)
            CancelButton()
            Sleep(1000)
            break
        } else {
            if (ok:=FindText(&X, &Y, 853-150000, 556-150000, 853+150000, 556+150000, 0, 0, darkerYes)) {
                BetterClick(X, Y)
                Sleep(2000)
                CancelButton()
                Sleep(1000)
                break
            }
        }
    }
}
CancelButton() {
    loop {
        if (ok:=FindText(&X, &Y, 962-150000, 556-150000, 962+150000, 556+150000, 0, 0, cancel)) {
            BetterClick(X, Y)
            Sleep(2000)
            Sleep(500)
            break
        } else {
            if (ok:=FindText(&X, &Y, 961-150000, 556-150000, 961+150000, 556+150000, 0, 0, darkerCancel)) {
                BetterClick(X, Y)
                Sleep(2000)
                Sleep(500)
                BetterClick(X, Y)
                Sleep(500)
                BetterClick(X, Y)
                Sleep(500)
                BetterClick(X, Y)
                Sleep(500)
                BetterClick(X, Y)
                Sleep(1000)
                

                break
            }
             
        }
    }
}

1::ExitApp
2::Reload
