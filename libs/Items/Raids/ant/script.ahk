#Requires AutoHotkey v2.0
#Include ../CardPickerModule.ahk
Harvest:="|<>*29$45.jDzzzzzstzzzzzn7Dzzzzy8t00QUkU0801U2I008780En710w876Mt07XUUkjA5yS674"

Range:="|<>*27$35.Uzzzzy0zzzzwFzzzysm01UEE4010U010kE0021UU2AU3846tUiMADzzzgzzzzz1zk"

Strong:="|<>*24$36.Xzzzzz1bzzzzDbzzzzD1331k1V2H1UtrStRiRrSvRg9nS3RUU"

Slayer:="|<>*25$36.Xjzzzz1jzzzzDjzzzzDj2Qkk1i1AYktiv9YrRinVbr1a3narXrfnkrzzzrzzU"

PressIt:="|<>*29$43.VzzzzzTUDzzzz4lbzzzzW8m2333k0111bbs01X0EkwH1lUwQS9Xss88D4/yy667r4"

Damage:="|<>*25$44.3zzzzzzkDzzzzzwnzzzzzzSMMFksQ7Y60MA6FtRgqvRYQrPBiqPkS6vQC6S"

Cooldown:="|<>*24$57.sTzwTbzzzy1zzXwzzzzXTzwTbzzzsz1UX0UaG1Ds40M402E0yA6286E2AbFUmN0m0tY11Ul0Ut7AsQSCACDBvY"

Champion:="|<>*16$60.trzzzzvzzzULzzzzvzzzCrzzzzzzzzDkQA8kvVUkTkMA0kP9UrTrPharPQilDr/BaGPQiQUL8BaEP1iIkrQhakvXikU"

Dodge:="|<>*27$36.Uzznzz0TzXzz4CzXzz78A21170421071UUE0610UE10M4211UwC311U"

UncommonLoot:="|<>*27$92.jDzzzzzzzzzjzzzlnzzzzzzzzzlzzzAQzzzzzzzzzwTzzl78622080kED7kM81m0UU000401lw202QX1lUa2MA6QSA6Ha8kQE9Ua21b7W14s6AUUWM9Y4Nk46333rAQBaKNViS1VksU"

CommonLoot:="|<>*30$78.sTzzzzzzyzzzvUDzzzzzzwTzznXTzzzzzzwTzzl7s80U310wT1UU7s000100QT0U07lUY2EA6QSA6HXF0a2M86QS84FU88a2N16Q11UksQAaGNVaS1VksU"

Speed:="|<>*25$35.lzzzzt1zzzzkTzzzzYS31Uk8A6H9US9UYHAiGNwyF1UkMA37TksQg"
global X1:= 214
global Y1:= 227
global X2:= 659
global Y2:= 431
AntRaids() {

    MainCards() ; picks the three main cards

    ; Starts TinyTask
    SendInput("{F8}")
    ; While TinyTask is running, the script will search for the alt cards
    loop {
        Sleep(5000)
        AltCards()
    }


    
}





AltCards() {

    
    ; Check for each card using the global coordinates
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Cooldown)) {
        BetterClick(X, Y) ; will select
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Range)) {
        BetterClick(X, Y) ; will select
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Slayer)) {
        BetterClick(X, Y) ; will select
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Harvest)) {
        BetterClick(X, Y) ; will select
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Strong)) {
        BetterClick(X, Y) ; will select
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, PressIt)) {
        BetterClick(X, Y) ; will select
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Damage)) {
        BetterClick(X, Y) ; will select
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Champion)) {
        BetterClick(X, Y) ; will select
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Dodge)) {
        BetterClick(X, Y) ; will select
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, UncommonLoot)) {
        BetterClick(X, Y) ; will select
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, CommonLoot)) {
        BetterClick(X, Y) ; will select
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Speed)) {
        BetterClick(X, Y) ; will select
    }
    ; checked all cards now lets check for if they lost or won the raid
    status()
    return
}


status() {
    Failed:="|<>*118$101.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003zU00000000000000zzw00001U00000003k1y0000Ts0000000600C0001ts0000000M00C00030k0000000k00C00061U0000001U00C000A300000003000A000M600000006000MDz1kDXxzDU7kA1y0NzzjUTzzzzUTsM3y0rU3s01kM73Vksk6A1w03k01U04330lUAQ3k03U020087C1X0Tk700300400E6M360z0A00600800U7k6A000s1U400k03UD0MM001U7UD0zU7zUC0kk0070T0S1z0Tv0M3VU00C000w360l70E63000Q003s6A1U600Q6000s006kAM30600kA001k00xUTk60A01UM3w1UDzn0TUA0A060k7s3U7Va070M0Q0A1UAs3003g060k0M0k30Mk7003Q0A1U0s1U60lkD006M0M300k70C1VUT00Qs0s601UA0A73Vr01kw3kQ060s0Tw3z7zzUzzzk0A1U0Dk3s3zw0Tsz00s30000000y0000001UA0000000000000070M00000000000000A1k00000000000000M3000000000000000kC000000000000001kM000000000000001zk000000000000001z0000000000000000M0000000000000000004"
    if (ok:=FindText(&X, &Y, 1134-150000, 840-150000, 1134+150000, 840+150000, 0, 0, Failed)) {
        SendInput("{F8}") ; stops tinytask
        BetterClick1(1167, 819) ; clicks reply

        AntRaids()
        return
    } else {
        return
    }

}