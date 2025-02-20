
#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\libs\FindText.ahk
Namek:="|<>*99$125.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzwTzz0CDzzzzz7yDXzzzzzszzy0ATzzzzyDwD7zzzzzlzzw0MzzzzzwTsSDzzzzzXzzsslwH8z1kDkQQH8lwH6zzllXk60Q10TUMk601k68zzX370A0k20z0F0A010A1zz06CAMlX77y82AMVWAM7zy0QMslk0CDwM0slX0skTzw7sslXWDwTsk8lX68lUTzszkk374BsTlkE36AE30TzlzVk6C81kTXkk6AMk68TzbzXlAww7kzDnlAtnlAtzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
yes:="|<>*120$71.0D1vkS0000000S1zUQ0000000w3y0zy0Ts001s3w3zz7zw001s7kDzzTzy003s70Tkzz3y003k61w0Tk0w003k87k0T00s007k0D00S03k007U0w00M07U007U3k30kTS000DU7UT1UDw000D0T0w3U1w000D1y00701s3zzy3w00T01zzzzw7s01zU3zzzzsDkDzxs7zzzzkTk67ksDzzzzUzU0700Tzzzz1zU0C00zzzzy3zU0Q03zzzzw7zU1y0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"


Hotkey("k", PortalPickerIngame)
BetterClick(x, y) {
    MouseMove(x, y)
    Sleep 10
    MouseMove(1, 0, , "R")
    Sleep 20
    MouseClick("Left", -1, 0, , , , "R")
    Sleep 50
}




PortalPickerIngame(*) {
    MouseMove(546, 813)
    Sleep(1000)
    BetterClick(432, 813)
    row := 0
        col := 0
        loop {
            MouseMove(570 + (col * 150), 447 + (row * 100))  ; Move to the current item
            Sleep(1000)

            if (FindText(&X, &Y, 697-150000, 603-150000, 697+150000, 603+150000, 0, 0, Namek)) {
                ; Adjust coordinates to be relative to the window
                MouseGetPos(&mouseX, &mouseY)
                BetterClick(mouseX, mouseY)
                Sleep(1000)
                ;clicks on the use button
                if (FindText(&X, &Y, 846-150000, 557-150000, 846+150000, 557+150000, 0, 0, yes)) {
                    ; Adjust coordinates to be relative to the window
                    BetterClick(X , Y - 30)
                    Sleep(2000)

                }

            } else {
                ; Move to next item
                col++
                if (col >= 6) {
                    col := 0
                    row++
                }
                Sleep(100)
            }
        }

}


1::ExitApp
2::Reload