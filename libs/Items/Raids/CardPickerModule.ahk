#Requires AutoHotkey v2.0
#Include ../../FindText.ahk
#Include ../../Modules.ahk
KingsBurden := "|<>*14$170.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzvVzzzzzzzzzzzzzzzzzkzzzzzzz3wMTzzzzszzzU0zzzzzzwDzzzzzzky27zzzzy7zzs03zzzzzz3zzzzzzwD0VzzzzzVzzy00zzzzzzkzzzzzzz3UTzzzzzszzzU07zzzzzwDzzzzzzkkDzzzzzyDzzsT1zzzzzz3zzzzzzw87VV1zUXXUDy7sMT323k0y0w8Dzz03sM0Dk0Mk1zVw67kk0s0D0701zzk1y601s0780TsM3VwA0A03U0k0Dzw0zVU0A01y7Dy60sT30600k0A01zz07sM631UTUzzVk67kkTUkA710kTzk0y63kkw7s0zsT1VwADsS31kES7zw07VVwAD1z07y7sMT33y7Uk0ADVzz30sMT33kTs1zVy63UkzVsA073sTzks667kk07zkDsD1UEADs431zky7zwD1VVwC01y63y00Q033z00k0QDVzz3k8MT3U0TU1zU0D00kzk0C033sTzky267kw07s0Ts03s0ADy03k0ky7zyDlVlwDv1z0Dz03zX33zsFy0SDVzzzzzzzzzkTzzzzzzzzzzzzzzzzzzzzzzzzzsMDzzzzzzzzzzzzzzzzzzzzzzzzzy03zzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzw0zzzzzzzzzzzzzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzzU"
Exterminate:="|<>*30$170.zzzzzzzzzzzzzyzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzsTzzzzzzzzzzzzk03zzyTzzzzzzzy7zzzzznzzzzzzw00zzz3zzzzzzzzVzzzzzsTzzzzzz00DzzkzzzzzzzzsTzzzzy7zzzzzzk03zzwDzzzzzzzzzzzzzzVzzzzzzwDzzzz3zzzzzzzzzzzzzzsTzzzzzz3zwTX07k7V1231sMETs8M0y0y47zkTz3k00s0s0E00C603w040707U1zw07kM00A0604001VU0S0101U0s0Tz00w030200U3000MM0300M0E060Dzk0DU1wDUs8DkM4661UkM7Vw71Uzzw07w0z3sC27w63VVUwAD1sT3sMTzz3zzUTky01Vz3UsMMT33kS7ky67zzkzzk3wDU0sTksC667kkw7VwDVVzzw7zs0T3sDy7wC3VVVwA21sT1kMTzz00A03k61XVz3UsMMT300S0k067zzk031UQ1k0MTkwC667ks07UC03Vzzw00kwDUS067wD3VVVwD01w3k1sTzzU0CTby7k3lzXlwQQT7wMzkz1z7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"

MainCards() {
    while (true) {
        if (FindText(&X, &Y, 960-150000, 455-150000, 960+150000, 455+150000, 0, 0, Exterminate)) {
            BetterClick(X, Y) ; will select exterminate
            Sleep(2000)
            SmoothMouseMove(1343, 562, 2)
            SmoothMouseMove(957, 565, 2)
            BetterClick(957, 565) ; clicks the cancel button
            break
        } else {
            ResetStage()
            ; Added delay after ResetStage returns
            Sleep(2000)
        }
    }
}



ResetStage() {
    BetterClick(671, 483) ; clicks a random card so it can reset stage
    Sleep(2000)
    BetterClick(970, 570) ; clicks cancel
    Sleep(2000)
    BetterClick(879, 181) ; clicks vote yes 
    Sleep(7000)
    BetterClick(37, 1039) ; clicks settings icon
    Sleep(1000)
    BetterClick(1204, 504) ; clicks the restart match button
    Sleep(1000)
    BetterClick(834, 569) 
    Sleep(5000) ; Add delay to give game time to reset and show cards
}

