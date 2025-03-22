#Requires AutoHotkey v2.0

#Include ../../../FindText.ahk
#MaxThreads 255

Cooldown1:="|<>*24$146.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwzzzzzzVzz3zzzzzzzzzzzzzs1zzzzzsTzkzzzzzzzzzwDzzs07zzzzy7zwDzzzzzzzzz3zzw01zzzzzVzz3zzzzzzzzzkzzy00TzzzzsTzkzzzzzzzzzwDzzUSDzzzzy7zwDzzzzzzzzz3zzkTzw1zUDVz03s3swS647zkzzw7zy0Dk1sTU0w0Q73VU0zwDzz3zz01s0C7k0C03VUsM07z3zzkzzU0A01Vs0300M84600zkzzwDzsC31kMS30kQ6213UMDwDzz3zy7kky67VsADVk00sD3z3zzkTzVwADVVsS33sQ00C7kzkzzw3zsT33sMS7Uky7U07VwDwDzzUS63UkQ63UEA71s41sT3z3zzw01U0A01UA0300T1Uy7kzkzzz00Q07U0s300s0DkMDVwDwDzzw0DU3w0T0s0D07wD7sT3z3zzzkDy3zkTsTV7w7zXlz7kzszzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
Harvest:="|<>*29$45.jDzzzzzstzzzzzn7Dzzzzy8t00QUkU0801U2I008780En710w876Mt07XUUkjA5yS674"
Range:="|<>*31$83.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs0Dzzzzzzzzzzzk0DzzzzzzzzzzzU0Dzzzzzzzzzzz00Dzzzzzzzzzzy3kTzzzzzzzzzzwDkw4A8Dw4TUDzsTVk0M0Dk0S0Dzky300k0D00s0DzUs401U0A01U0Dz00MA30kMA31kTy00kw63kkw63Uzw01VsADVVsA03zs033kMT33kM0Dzky610ky600kTzzVw401VwC01U0zz3sA033sQ03U0zy7sQ067kw07U1zyDlyASDVzMDU7zzzzzzzzzzkzzzzzzzzzzzzX1zzzzzzzzzzzy03zzzzzzzzzzzw0Dzzzzzzzzzzzw0zzzzzzzzzzzzzjzzzs"
Damage1:="|<>*15$124.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU0zzzzzzzzzzzzzzzsTzy01zzzzzzzzzzzzzzzVzzs03zzzzzzzzzzzzzzy3zzU07zzzzzzzzzzzzzzsTzy3kDzzzzzzzzzzzzzzVzzsTUz13231z13s8z0Ty7zzVz1s0A003s0D01s0zsTzy7w700k00700s0701zVzzsTkM03000M0300M03y7zzVz1UkA611UkA61UsDsTzy7w67UkMC67Ukw63UzVzzsTkMS33UsMS33kM07y7zzVy3VsAC3VVsAD1U0zsTzy3UC10ksC610k063zzVzzs01s033ksM03U0M6Dy7zzU0Dk0AD3Vk0C01k0TsTzy01zU0kwC7U0y07U1zVzzw0zzX7XlwTX7zkz0Dz7zzzzzzzzzzzzzzz3zzzzzzzzzzzzzzzzzzwMDzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzy07zzzzzzzzzzzzzzzzzzy1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Strong:="|<>*24$36.Xzzzzz1bzzzzDbzzzzD1331k1V2H1UtrStRiRrSvRg9nS3RUU"
Slayer:="|<>*17$85.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwTkzzzzzzzzzzzk3sTzzzzzzzzzzk0QDzzzzzzzzzzk0C7zzzzzzzzzzs0D3zzzzzzzzzzw7DVzzzzzzzzzzy3zkzUV7wS0w8Dz0zsTU01w60C07zk1wDU0ES60303zs0C7U08C200U3zz073kM6311kETzzs1VsS311Us8TzzzUkwD1k0k0ADzzbkMS7Uw0s0C7zzUsA70US0Q7z3zzk0C0U0DUS1XVzzs070M07kDU0kzzy07kC03wDs0MTzzkDwDlXw7y0SDzzzzzzzzy7zzzzzzzzzzzzz3zzzzzzzzzzzzz1zzzzzzzzzzzzzVzzzzzzzzzzzzzkzzzzzw"
PressIt:="|<>*30$72.zzzzzzzzzzzzz01zzzzzzzzzz00zzzzzzzzzz00Tzzzzzzzzz00Dzzzzzzzzz3sDzzzzzzzzz3wA8D0TUDUDz3wA0C0D0707z3sA0A060607z1kA0M067C7Dz00Q7sC23y3zz00QDsC20C0Dz00wDs070707z03wDs0DU7U7z3zwDsDzw3w3z3zwDs0C6263z3zwDw060607z3zwDy060607zXzyDz0D0D0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Damage:="|<>*15$102.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw07zzzzzzzzzzzzzzw03zzzzzzzzzzzzzzw01zzzzzzzzzzzzzzw00zzzzzzzzzzzzzzw7UTzzzzzzzzzzzzzwDkTUVV1UzUVw4TUDwDsD01U00T01s0D07wDsC01U00C01k0C03wDsA01U00A01U0A01wDsA61Uk8A61UkA71wDsAD1UkQAD1VsA71wDsAD1VkQAD1VsA03wDkQD1VkQAD1VsA07w70Q21VkQA21U0A7zw00w01VsQA01k0A37w01y01VsQC01k0C03w03z01VsQD01w0D03y0TzlXlsyDlXzsTU7zzzzzzzzzzzzzsTzzzzzzzzzzzzzzskTzzzzzzzzzzzzzzk0zzzzzzzzzzzzzzzk0zzzzzzzzzzzzzzzw3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Cooldown:="|<>*60$125.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzznzzzzzy7zwDzzzzzzzzzw0zzzzzwDzsTzzzzzzzzzU0TzzzzsTzkzzzzzzzzzy00zzzzzkzzVzzzzzzzzzs01zzzzzVzz3zzzzzzzzzkD7zzzzz3zy7zzzzzzzzz1zzk7y0y7w0DUDXlsMETy3zz07s0wDk0S0C3Vkk0TwDzw07U0sT00s0C63VU0TsTzk0600kw01U0A42300TkzzUsA71VsA31kM84C1UzVzz3sMT33kw67ks00Q7Vz1zy7kky67VsADVk00sT3y1zwDVVwAD3kMT3k03ky7y1sMC31kMC10kQ7UE7VwDy00k0600k601U0DUkT3sTw01k0S03UA03U0z1Uy7kzy07k1y0DUQ07U3y7XwDVzz0zsDz1zVyATkTyD7wT3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
Champion:="|<>*16$60.trzzzzvzzzULzzzzvzzzCrzzzzzzzzDkQA8kvVUkTkMA0kP9UrTrPharPQilDr/BaGPQiQUL8BaEP1iIkrQhakvXikU"
Dodge:="|<>*31$72.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzznzzzzzzUDzzzVzzzzzzU3zzzVzzzzzzU1zzzVzzzzzzV0zzzVzzzzzzXkw7s1k7UTzzXsM1k1U70DzzXsE1U1060DzzXsEkV126CDzzXs1kXU740DzzXklkXV740DzzXUkkV106DzzzU1k1U1060DzzU3s1k1U70DzzU7w7s3t7UTzzzzzzzzj7zzzzzzzzzzU7zzzzzzzzzz0DzzzzzzzzzzUTzzzU"
UncommonLoot:="|<>*30$139.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwDwDzzzzzzzzzzzzzzzzzzzy7y7zzzzzzzzzzzzzzzzzzzz3z3zzzzzzzzzzzzzzzzzzzzVzVzzzzzzzzzzzzzzzzzzzzkzkzzzzzzzzzzzzzzzzzzzzsTsMETs3w1w8C7V1kzUDV1zwDwA07s0w0S001k00DU3k0Ty7y601s0Q07000M003U0s07z3z300M0A01U00A001U0A01zVzVUMA7C3UkM4630UkQ61UzkTkkS67z3sMA731UsMT31sTsDkMT33zVwAC3VVkQADVVwDy7sADVVzky671kksC67kky7z0sC7kk8sC33UsMQ731kMT3zU073sM0A01VkQAC3VU0ADVzs07VwC0701ksC671ks0C7kzy07ky7U3k1sQ733UsS0D3sTzkDwT3w7y1wD7VVswDkDlwDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"
slayer2 := "|<>*17$103.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzszVzzzzzzzzzzzzzzU7kzzzzzzzzzzsTzzU0sTzzzzzzzzzwDzzU0QDzzzzzzzzzy7zzk0S7zzzzzzzzzz3zzsCT3zzzzzzzzzzVzzw7zVz12Dsw1sETkzzy1zkz003sA0Q0DsTzzU3sT00UwA0607wDzzk0QD00EQ40107y7zzy0C7UkA623UUzz3zzzk33kw6231kEzzVzzzz1VsS3U1U0MTzkzzzDUkwD1s1k0QDzsTzz1kMC10w0sDy7zwDzzU0Q100T0w373zy7zzk0C0k0DUT01Vzz3zzw0DUQ07sTk0kzzVzzzUTsTX7sDw0wTzszzzzzzzzzwDzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzy3zzzzzzzzzzzzzzzz3zzzzzzzzzzzzzzzzVzzzzzzzzzzzzzzzztzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
CommonLoot:="|<>*36$113.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU7zzzzzzzzzzzzzzzzw03zzzzzzzzzzzzzzzzk07zzzzzzzzzzzzzzzz00Dzzzzzzzzzzzzzzzy1szzzzzzzzzzzzzzzzsDzy0y473kUsTk7kUzzkTzs0w003U00T07U0zzVzzU0s003000Q0700zz3zy00k006000k0600zy7zw71Uk8A611UsA71zwDzsT31UsMA733sMD3zsDzky671kksC67kky7zkDzVwAC3VVkQADVVwDzkD31kMQ733UsMC33sTzk0600ksC671kk067kzzU0C03VkQAC3Vk0QDVzzk0y0D3UsMQ73k1sT3zzs3z0y7XkkwS7s7sy7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
Speed:="|<>*25$35.lzzzzt1zzzzkTzzzzYS31Uk8A6H9US9UYHAiGNwyF1UkMA37TksQg"
global X1 := 214
global Y1 := 227
global X2 := 1500
global Y2 := 600
BetterClick(x, y) {
    MouseMove(x, y)
    Sleep(10)
    MouseMove(1, 0, , "R")
    Sleep(20)
    MouseClick("Left", -1, 0, , , , "R")
    Sleep(50)
}
AntRaids() {
    

    


    RunWait(A_ScriptDir . "\..\CardPickerModule.ahk")
    Sleep(2000)
    ; Starts TinyTask
    Send("{F8 down}")
    Sleep(100)
    Send("{F8 up}")
    ; While TinyTask is running, the script will search for the alt cards
    loop {
        Sleep(900)
        status()
        Sleep(500)
        AltCards()
      
    }


    
}




AltCards() {
    priorityList := []
    try {
        priorityFile := FileOpen(A_ScriptDir "\..\..\..\Settings\MangoSettings\CardPriority.txt", "r")
        if (priorityFile) {
            while !priorityFile.AtEOF {
                line := priorityFile.ReadLine()
                if (line != "")
                    priorityList.Push(Trim(line))
            }
            priorityFile.Close()
        }
    } catch {
        MsgBox("Error reading priority file")
    }
    
    foundCards := []
    
    ; Check each card to see if it is on screen and store its coordinates
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Cooldown)) {
        foundCards.Push({name: "Cooldown", x: X, y: Y})
    } else if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Cooldown1)) {
        foundCards.Push({name: "Cooldown", x: X, y: Y})
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Range)) {
        foundCards.Push({name: "Range", x: X, y: Y})
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Slayer)) {
        foundCards.Push({name: "Slayer", x: X, y: Y})
    } else if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, slayer2)) {
        foundCards.Push({name: "Slayer", x: X, y: Y})
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Harvest)) {
        foundCards.Push({name: "Harvest", x: X, y: Y})
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Strong)) {
        foundCards.Push({name: "Strong", x: X, y: Y})
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, PressIt)) {
        foundCards.Push({name: "PressIt", x: X, y: Y})
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Damage)) {
        foundCards.Push({name: "Damage", x: X, y: Y})
    } else if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Damage1)) {
        foundCards.Push({name: "Damage", x: X, y: Y})
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Champion)) {
        foundCards.Push({name: "Champion", x: X, y: Y})
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Dodge)) {
        foundCards.Push({name: "Dodge", x: X, y: Y})
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, UncommonLoot)) {
        foundCards.Push({name: "UncommonLoot", x: X, y: Y})
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, CommonLoot)) {
        foundCards.Push({name: "CommonLoot", x: X, y: Y})
    }
    if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Speed)) {
        foundCards.Push({name: "Speed", x: X, y: Y})
    }
    if (foundCards.Length == 0) {
        status()
        return
    }
    
    ; Iterate through the priority list and click the first found card that matches
    for cardName in priorityList {
        for card in foundCards {
            if (card.name = cardName) {
                BetterClick(card.x, card.y)
                return
            }
        }
    }
    
}
status() {
    Failed:="|<>*86$159.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz3zzzzzzzzzzzzzzzzzzzzzzzzzkDzzzzzU07zzzzzzzzzzzzzzzzy1zzzzzs00DzzzzzzzzzzzzzzzzkDzzzzz000zzzzzzzzzzzzzzzzy1zzzzzs003zzzzzzzzzzzzzzzzkDzzzzz000Dzzzzzzzzzzzzzzzy1zzzzzs001zzzzzzzzzzzzzzzzkDzzzzz0TU7zzzzzzzzzzzzzzzy1zzzzzs3y0zU7wDszXzUsS3UzUkDs0zzz0Tk7k0D0y3s7k21k03k01w03zzs3y0w00s7UT0w00A00Q00D00Dzz0Tk70030w1k7001U03001s01zzs3w0k00M30C1k00A00s00D00Tzz000C0M1UM0UC001U06001sDrzzs001U7UA1041U60A0xk20D0zzzz000Q1w1U000Q1w1UDw1w1s0Dzzs003U00C0003UTUA1zUDUD00Tzz000w003k000w3w1UDw3y1w01zzs003U00T0007UTUA1zUDUDk0Dzz000Q00Ds000w1w1UDw1w1zU0zzs3w1UDzz020DU20A1zk20DzU7zz0TUC0zDw0k1y001UDy001sT0zzs3y0k00zU70Tk00A1zs00C007zz0Tk7003y0s3z001UDz001k01zzw3z0w00TkD0Tw00A1zw00C00DzzUTs7k07z1w7zk21kDzk01s03zzy7zXz01zsTlzzUsS3zzUsTk1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
    if (ok:=FindText(&X, &Y, 669-150000, 588-150000, 669+150000, 588+150000, 0, 0, Failed)) {
        Send("{F8 down}") 
        Sleep(100)
        Send("{F8 up}")
        BetterClick(1167, 819) 
        Sleep(5000)
        AntRaids()
        return
    } 
    

}
AntRaids()
F2::QUITAPP()

QUITAPP() {
    sessionui := WinExist("Window")
    if (sessionui) {
       WinClose("Window")
    }
    ExitApp
}