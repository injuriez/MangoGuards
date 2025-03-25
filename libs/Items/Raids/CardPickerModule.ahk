#Requires AutoHotkey v2.0
#Include ../../FindText.ahk

NoTrait:="|<>*27$102.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy7zzsTsTzzz001zzzy7nzsDsTzzy001zzzy7Vzs7sTzzz001zzzy7Vzs3sTzzzz3zzzzzzVzs3sTzzzz3zzzzzzVzs1sT0Tzz3sES2660Ds0sS0Dzz3s0Q06407s0sQ07zz3s0M06407sEMM03zz3s0k06607sM8MC3zz3sDkM67VzsQ0MT3zz3sTkw67VzsQ0MT3zz3sTkw67VzsS0MT3zz3sTkw67VzsT0MC3zz3sTk867VzsTUM03zz3sTk067UDsTUQ07zz3sTs067UDsTkS0Dzz3sTw067kDsTsTUTzz3sTz2C7sDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
KingsBurden := "|<>*14$75.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzvVzzzzzzzzzVyADzzzzwTzzwDUVzzzzzVzzzVs4DzzzzwDzzwC1zzzzzzXzzzVUTzzzzzwTzzw87VV1zUXXUDzU1wA07s0AM0zw0TVU0S01m07zU7wA01U0Dktzw0TVUMA61y3zzU1wA7VVsDk1zw07VVwAD1z07zVUQADVVsDw0zwC1VVwA01zw3zVsAADVk0DkkTwD0VVwC01y07zVw4ADVs0Dk0zyDlVlwDv1z0DzzzzzzzzsDzzzzzzzzzy63zzzzzzzzzzk0Tzzzzzzzzzy07zzzzzzzzzzs1zzzzzzzzzzzszzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Exterminate:="|<>*30$170.zzzzzzzzzzzzzyzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzsTzzzzzzzzzzzzk03zzyTzzzzzzzy7zzzzznzzzzzzw00zzz3zzzzzzzzVzzzzzsTzzzzzz00DzzkzzzzzzzzsTzzzzy7zzzzzzk03zzwDzzzzzzzzzzzzzzVzzzzzzwDzzzz3zzzzzzzzzzzzzzsTzzzzzz3zwTX07k7V1231sMETs8M0y0y47zkTz3k00s0s0E00C603w040707U1zw07kM00A0604001VU0S0101U0s0Tz00w030200U3000MM0300M0E060Dzk0DU1wDUs8DkM4661UkM7Vw71Uzzw07w0z3sC27w63VVUwAD1sT3sMTzz3zzUTky01Vz3UsMMT33kS7ky67zzkzzk3wDU0sTksC667kkw7VwDVVzzw7zs0T3sDy7wC3VVVwA21sT1kMTzz00A03k61XVz3UsMMT300S0k067zzk031UQ1k0MTkwC667ks07UC03Vzzw00kwDUS067wD3VVVwD01w3k1sTzzU0CTby7k3lzXlwQQT7wMzkz1z7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Money:="|<>*34$183.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzsTz3zzzzzzzzzzzk3zzzzzzzzzzzzzz1zsDzzzzzzzzzzw07zzzzzzzzzzzzzs7y1zzzzzzzzzzzU0zzzzzzzzzzzzzz0TUDzzzzzzzzzzs0Dzzzzzzzzzzzzzs3s1zzzzzzzzzzz3nzzzzzzzzzzzzzz0D0DUDV1zUD7wTsDz3sMES2Dk7zzzzs0k1s0w07s0kT1z0zsT303U0w0Tzzzz000C03U0S031sTw0T3sM0M0701zzzzsE11U0A01U0MC3zU0sT30600k0Dzzzz308A71UMA71UkTz073sMDkM63UzzzzsQ31VwA7VUsA47zy0MT33y7UkQ7zzzz3UsADVVwA03k0zzy33sMTkw601zzzzsS71VwADVU0z0DzbkMC33y7Uk0Tzzzz3zsA71VwA7zs1zsC30UMTk063zzzzzsTz1U0ADVU0zUTz00w033z00k0Tzzzz3zsC03VwC03w3zs07U0MTs0701zzzzsTz1s0wDVs0TkzzU1y033zU0w0DzzzzXzwTkDlwDU7w7zz0TwMMTzg7k3zzzzzzzzzzzzzzzzUzzzzzzzzzzUzzzzzzzzzzzzzzzzzzsDzzzzzzzzsMDzzzzzzzzzzzzzzzzzz1zzzzzzzzz01zzzzzzzzzzzzzzzzzzsTzzzzzzzzs0Tzzzzzzzzzzzzzzzzzz3zzzzzzzzzU7zzzzzzzzzzzzzzzzzzwzzzzzzzzzzXzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
Lifeline:="|<>*24$105.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzsTUzzwD3zzzzzzzsTz3s7zzVsTzzzzzzz3zsS0zzwD3zzzzzzzsTz3k7zzVsTzzzzzzz3zzy7zzwDzzzzzzzzsTzzkzzzVzzzzzzzzz3zsM0S0wD323z0TzzsTz203U3VsM0Dk1zzz3zsE0M0AD300w07zzsTz30200VsM0300Tzz3zsS7kQ4D30kMC3zzsTz3ky3UVsMD31kTzz3zsS7k0AD33sM07zzsTz3ky03VsMT301zzz3zsS7kTw733sMDzzzs073ky1XUMMT30lzzz00MS7s0A133sQ07zzs033kzU1k8MT3k0zzzU0wSDy0T3XXwz0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
global X1 := 214
global Y1 := 227
global X2 := 1500
global Y2 := 600
Global FoundCorrectCard := false
MainCards() {
    global FoundCorrectCard
 
    filePath := A_ScriptDir "\..\..\..\Settings\MangoSettings\StarterCard.txt"
    if !FileExist(filePath) {
        MsgBox("Error: File not found - " filePath)
        return
    }

    ; Open the file and read the first line
    Setting := FileOpen(filePath, "r")
    if !IsObject(Setting) {
        MsgBox("Error: Unable to open file - " filePath)
        return
    }
    StarterCard := Setting.ReadLine()
    Setting.Close() ; Close the file after reading

    BetterClick(1591, 205) ; clicks the cancel button
    while (true) {
        if FoundCorrectCard {
            break
        }
        if StarterCard == "Exterminator" {
            if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Exterminate)) {
                MsgBox("Found Exterminator")
                FoundCorrectCard := true
                BetterClick(X, Y)
                Sleep(1000)
                BetterClick(957, 565) ; clicks the cancel button

                StartTinyTask()
                break
            } else {
                ResetStage()
                ; Added delay after ResetStage returns
                Sleep(500)
            }
        } else if StarterCard == "Kings Burden" {
            if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, KingsBurden)) {
                FoundCorrectCard := true
                BetterClick(X, Y)
                Sleep(1000)
                
                
              
                BetterClick(957, 565) ; clicks the cancel button
                StartTinyTask()
                break
            } else {
                ResetStage()
                ; Added delay after ResetStage returns
                Sleep(500)
            }
        } else if StarterCard == "Lifeline" {
            if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Lifeline)) {
                FoundCorrectCard := true
                BetterClick(X, Y) 
                Sleep(1000)
               
               
               
                BetterClick(957, 565) ; clicks the cancel button
                StartTinyTask()
                break
            } else {
                ResetStage()
                ; Added delay after ResetStage returns
                Sleep(500)
            }
        } else if StarterCard == "Money Surge" {
            if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Money)) {
                FoundCorrectCard := true
                BetterClick(X, Y)
                Sleep(1000)

              
            
                BetterClick(957, 565) ; clicks the cancel button
                StartTinyTask()
                break
            } else {
                ResetStage()
                ; Added delay after ResetStage returns
                Sleep(500)
            }


        } else if StarterCard == "no trait no problem" {
            if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, NoTrait)) {
                FoundCorrectCard := true
                BetterClick(X, Y) 
                Sleep(1000)
                BetterClick(957, 565) ; clicks the cancel button

                StartTinyTask()
                break
            } else {
                ResetStage()
                ; Added delay after ResetStage returns
                Sleep(500)
            }

        }



       
    }
}

StartTinyTask() {
    if FoundCorrectCard == true {
        Sleep(2000)
        Send("{F8 down}")
        Sleep(100)
        Send("{F8 up}")
        return

    } else {
        ResetStage()
        Sleep(500)
        MainCards()
    }
    

}

ResetStage() {
    BetterClick(671, 483) ; clicks a random card so it can reset stage\
    Sleep(2000)
    BetterClick(951, 568)
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
    Sleep(1000) ; Add delay to give game time to reset and show cards
}


BetterClick(x, y) {
    MouseMove(x, y)
    Sleep(10)
    MouseMove(1, 0, , "R")
    Sleep(20)
    MouseClick("Left", -1, 0, , , , "R")
    Sleep(50)
}

