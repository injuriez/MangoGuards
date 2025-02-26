#Requires AutoHotkey v2.0
#Include ../../Modules.ahk

class Cards {
    static revitalize := {
        id: "<>*45$99.<>*23$103.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzbzzzlnzzzzzw0zzzzlzzzsszzzzzy0DzzzsszzwQTzzzzz03zzzwwTzyCTzzzzzU1zzzzyDzz7zzzzzzlsQ3Dn60w1XX07UTzswA03kW0Q0FlU3U7zwQA0Fsl0A08sk1U3zy06C8MMsS44QTVllzz0706AQQT72CDVs0zzU3U30CCDXV77Vw0TzlklzkD77kUXXVyDzzswM1wDXUs0kFU30DzwS60S7lsC0M8k0k3zyDbUTbsyDnC4M0w3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy",
        priority: 5
    }
;     if (ok:=FindText(&X, &Y, 730-150000, 478-150000, 730+150000, 478+150000, 0, 0, Text))
;         {
;           ; FindText().Click(X, Y, "L")
;         }
    static champions := {
        id: "<>*10$109.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyTzzzzzzzbzzzzzzzsD7zzzzzzzlzzzzzzzk1Xzzzzzzzszzzzzzzk0lzzzzzzzwzzzzzzzkAMzzzzzzzzzzzzzzzsTwFz0MX3WD7UwFy1zwTy0T0400k3XU60C0zwDz070200M0lU3074Ty7zV1V124A8MkkV1VzzXzlkVkX36C4EsFkk7zkzssEsFVX72AQ8sQ1zsCAQA88klU3664QDUzy06C604MMk1X06C60TzU373U2AAM1lk3720Tzw3Xns37CAFsw7XnUDzzzzzzzzzyDzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzzzzXzzzzzzzz",
        prio: 1
    }
        ; if (ok:=FindText(&X, &Y, 1189-150000, 476-150000, 1189+150000, 476+150000, 0, 0, Text))
    ;     {
    ;       ; FindText().Click(X, Y, "L")
    ;     }
    static immunity := {
        id: "<>*17$97.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzszzzzzszzzzzzzzzwSzzzzwTzzzzzzzzyCDzzzyDzzzzzzzzzD7zzzz7zzzzzzzzzzXzzzzX4MQFVlsl7lU9wTzlU0600MsM0sU0SDzsk0300AQA0QE267zwMEVV26C646C737zyAMMlVX737377k3zz6AAMklXVXVXXw3zzX66AMMkUlklky1zzlX36AAM0MsMs7UzzslVX66C0AQAS3kzzwMttXbbVCDCDXsTzzzzzzzzzzzzzzwTzzzzzzzzzzzzzzwDzzzzzzzzzzzzzzyDzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy",
        prio: 2
    }
    ; if (ok:=FindText(&X, &Y, 960-150000, 477-150000, 960+150000, 477+150000, 0, 0, Text))
    ;     {
    ;       ; FindText().Click(X, Y, "L")
    ;     }
    static thirce := {
        id: "<>*15$73.zzzzzzzzzzzzzzzszzz7zzzzzU0ATzzXzzzzzk02Dzzlzzzzzw037zztzzzzzzsTXzzzzzzzzzwDl7l6D1w3zzy7s1s370Q0zzz3w0Q1X0A0TzzVy467lV6CDzzkz737slz07zzsTXVXwMzU3zzwDlklyA9lzzzy7ssMz60M1zzz3wQATXUC0TzznyDCDlsDUTzzzzzzzzzzzzzzzzzzzzzzzzzU",
        prio: 6
    }
    ; if (ok:=FindText(&X, &Y, 1190-150000, 478-150000, 1190+150000, 478+150000, 0, 0, Text))
    ;     {
    ;       ; FindText().Click(X, Y, "L")
    ;     }
    static exploding := {
        id: "|<>*27$102.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyDzzyNzzzzzzU1zzzyDzzw8zzzzzzU0zzzyDzzw8zzzzzzU0zzzyDzzw9zzzzzzU3zzzyDzzwDzzzzzzXzbX4SDUz08l7w1zzU7330CD0C08k1s1zzU3U306C0A08k1k1zzU3k726C6488kUkVzzU7sD72AC4Q8lkVlzzXzsD72CC4Q8lkllzzXzk706C6488lkk1zzU1U30620A08lkk1zzU03X0C30S08lks1zzU1bn6z3UzaMltylzzzzzz7zzzzzzzzzlzzzzzz7zzzzzzzzs1zzzzzz7zzzzzzzzs3zzzzzz7zzzzzzzzwDzzzzzzzzzzzzzzzzzzU",
        prio: 4
    }
    ; if (ok:=FindText(&X, &Y    ;     }-150000, 479-150000, 960+150000, 479+150000, 0, 0, Text))
    ;     {
    ;       ; FindText().Click(X, Y, "L")
    ;     }
    static voting := "|<>*92$71.zzzzzzzzzzzzzzzzzzzzzzzzzDztzzzzzzzzwDzVzzwDzzzzkDz1zzsDzzzzkTw7zzkTzzzzUzsDzzUzzzzzUzUzDz1zyzzz1z1k3s0T0Dzz1w703U0Q0Dzy3sA0300k0Dzy3Uk030100Tzw71UM70i1kTzw471sD1w7Uzzs8C3sS3s01zzs0w7kw7k07zzk1sD1sDUzzzzk7k03kT1zzzzUDk07U700zzzUzU0TUC01zzz1zU1z0S03zzz7zkDzVz0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
    static gems := "|<>*116$66.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzXzzzzzzzzzw0zzzzzzzzzs0Dzzzzzzzzk0TzzzzzzzzUwTzzzzzzzzVzz0wEky0zzVzy0A00Q0zzXkA0A00A0zzXUACA00ADzzXkACAAAA1zzVwA0AAAC0zzUwA0QAAD0Tzk0ADwAAAsTzs0A0AAAA0Tzw0S0AAAA0zzy0z0QQSC1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
    static RewardsText := "|<>*86$162.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzzzzzw3zzzzzz00Dzzzzzzzzzzzzzzzzw3zzzzzy003zzzzzzzzzzzzzzzzw3zzzzzy001zzzzzzzzzzzzzzzzw3zzzzzy000zzzzzzzzzzzzzzzzw3zzzzzy000Tzzzzzzzzzzzzzzzw3zzzzzy000Tzzzzzzzzzzzzzzzw3zzzzzy0z0Dzzzzzzzzzzzzzzzw3zzzzzy0zUDs1z3yDszsC7UsDsA3y0Dzzy0zUDU0S1w7kDU43U07U03s07zzy0zUD00C1s7kD003007003k03zzy0zUC0061s3UC003006003k03zzy0z0A0060k3UQ00300C003k07zzy000Q0k30k10Q00300A003kTjzzy000M1s30E10M1U30DQ0U3kDzzzy000s3s30000s3s30Ts3s3k0Tzzy000s003U000s7s30Ts3s3k07zzy001s007U001s7s30Ts7w3s03zzy000s007k001s7s30Ts3s3w03zzy000s00Tk001s3s30Ts3s3z01zzy0z0M3zzk0U3s0U30Tw0U3zs1zzy0z0Q1yTs1U3w0030Tw003ky1zzy0zUA00Ds1k7w0030Ty003U01zzy0zUC007w1k7y0030Ty003U03zzz0zkD007w3k7z0030Tz003U03zzz0zkDU0Dy3sDzU43UTzU03k07zzzVzszk0Ty7wTzsC7UzzsC7w0TzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
 }
 Countdown1(seconds, text) {
    global CountdownText
    if seconds == 0 {
        CountdownText.Text := text  ; Clear the countdown text
    } else {
        Loop (seconds) {
            CountdownText.Text := "Starting in " seconds - A_Index " seconds..."
            Sleep(1000)
        }
        CountdownText.Text := ""  ; Clear the countdown text
        StartTinyTask1()
    }
}

 
StartTinyTask1() {
    global connection
    ; Starts tiny task
    connection.Text := "[CONNECTED]"
    Send("{F8 down}")
    Sleep(100)
    Send("{F8 up}")
    Sleep(1000)
    Loop {
        if (ok := FindText(&X, &Y, 669-150000, 586-150000, 669+150000, 586+150000, 0, 0, Cards.RewardsText)) {
            Sleep(1000)
            Send("{F8 down}")
            Sleep(100)
            Send("{F8 up}")
            Sleep(500)
            BetterClick(1184, 840)
            Sleep(500)
            LegendStart()
            CountdownText.Text := ""
            break
        } else if (ok := FindText(&X, &Y, 1142-150000, 448-150000, 1142+150000, 448+150000, 0, 0, Cards.gems)) {
            Sleep(1000)
            Send("{F8 down}")
            Sleep(100)
            Send("{F8 up}")
            Sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(960, 600)
            sleep(500)
            BetterClick(1184, 840)
            Sleep(500)
            LegendStart()
            CountdownText.Text := ""
            break
        }

    }
}

 LegendStart() {
    loop {

        if (ok:=FindText(&X, &Y, 919-150000, 109-150000, 919+150000, 109+150000, 0, 0, Cards.voting))
            {
              Sleep(500)
              Countdown1(0, "Found Voting UI")
              Sleep(3000)
              PickCards()
              Sleep(1000)
              break
            }
    }
    
 }

 PickCards() {
    Countdown1(0, "Picking Cards...")
    cardsArray := [
        {name: "champions", id: Cards.champions.id, priority: Cards.champions.prio},
        {name: "immunity", id: Cards.immunity.id, priority: Cards.immunity.prio},
        {name: "exploding", id: Cards.exploding.id, priority: Cards.exploding.prio},
        {name: "revitalize", id: Cards.revitalize.id, priority: Cards.revitalize.priority},
        {name: "thirce", id: Cards.thirce.id, priority: Cards.thirce.prio}
    ]
    
    ; Sort cards by priority (lower number = higher priority)
    cardsArray := SortByPriority(cardsArray)
    
    ; Track selected cards
    selectedCards := 0
    maxSelections := 3
    
    ; Try to find each card in priority order
    for card in cardsArray {
        if (selectedCards >= maxSelections)
            break
            
        ; Search the entire screen for this card
        if (ok := FindText(&X, &Y, 0, 0, A_ScreenWidth, A_ScreenHeight, 0, 0, card.id)) {
            ; Card found, click it
            BetterClick(X, Y)
            Sleep(300)
            selectedCards++
            
            ; Log the selected card
            OutputDebug("Selected card: " card.name " (priority: " card.priority ")")
        }
    }
    
    ; If we haven't selected 3 cards, just click on any remaining visible cards
    if (selectedCards < maxSelections) {
        ; Define common card positions
        cardPositions := [
            {x: 735, y: 466},   ; Left position
            {x: 960, y: 473},   ; Middle position
            {x: 1190, y: 478}   ; Right position
        ]
        
        ; Click on remaining positions
        for pos in cardPositions {
            if (selectedCards >= maxSelections)
                break
                
            BetterClick(pos.x, pos.y)
            Sleep(300)
            selectedCards++
        }
    }
    
    ; Click the confirm button after selecting cards
    Sleep(500)
    BetterClick(962,571) ; Adjust this position if needed for the confirm button
    Sleep(500)
    StartTinyTask1()
    Sleep(500)
    

}


SortByPriority(array) {
    n := array.Length
    Loop n {
        idx1 := A_Index
        Loop (n - idx1) {
            idx2 := A_Index
            if (array[idx2].priority > array[idx2+1].priority) {
                temp := array[idx2]
                array[idx2] := array[idx2+1]
                array[idx2+1] := temp
            }
        }
    }
    return array
}