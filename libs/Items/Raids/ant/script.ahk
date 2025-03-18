#Requires AutoHotkey v2.0
#Include ../CardPickerModule.ahk
#Include ../../../Modules.ahk
Harvest:="|<>*29$45.jDzzzzzstzzzzzn7Dzzzzy8t00QUkU0801U2I008780En710w876Mt07XUUkjA5yS674"
MonarchCoins:="|<>*134$94.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzXzz3zXzzzzzzzzzyDzwDwDzzzzzzzzzszzkTUzzzzzzzzzzXzz0w3zzzzzzzzzyDzw1kDUy8TsXW7UsVzk60s1s0y060M1U3z00303U1k0M10607wM2A460301Vg0M0TlUMlsMQAS67kzVkz73X7VXklsMz7yD3wSSAS6D33VXwDswDlzskEMwA06Dk1Xkz7zXU3Xks0MzU6D3wTyC0SD3U1Xy0MwDlzsy3syTXCDy3XtzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Range:="|<>*31$83.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs0Dzzzzzzzzzzzk0DzzzzzzzzzzzU0Dzzzzzzzzzzz00Dzzzzzzzzzzy3kTzzzzzzzzzzwDkw4A8Dw4TUDzsTVk0M0Dk0S0Dzky300k0D00s0DzUs401U0A01U0Dz00MA30kMA31kTy00kw63kkw63Uzw01VsADVVsA03zs033kMT33kM0Dzky610ky600kTzzVw401VwC01U0zz3sA033sQ03U0zy7sQ067kw07U1zyDlyASDVzMDU7zzzzzzzzzzkzzzzzzzzzzzzX1zzzzzzzzzzzy03zzzzzzzzzzzw0Dzzzzzzzzzzzw0zzzzzzzzzzzzzjzzzs"

Strong:="|<>*24$36.Xzzzzz1bzzzzDbzzzzD1331k1V2H1UtrStRiRrSvRg9nS3RUU"

Slayer:="|<>*35$85.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzXy7zzzzzzzzzzy0T3zzzzzzzzzzy03Vzzzzzzzzzzy01kzzzzzzzzzzz01sTzzzzzzzzzzUtwDzzzzzzzzzzkTy7w48zXk7V1zs7z3w00DUk1k0zy0DVw023kk0M0Tz01kw011kE040Tzs0sS30kM8C23zzz0AD3kM8A713zzzw67VsC0601Vzzwy33kw7U701kzzw71Us43k3UzsTzy01k401w3kAQDzz00s300y1w067zzk0y1k0TVz033zzy1zVyATUzk3lzzzzzzzzzkzzzzzzzzzzzzzsTzzzzzzzzzzzzsTzzzzzzzzzzzzwDzzzzzzzzzzzzy7zzzzzzzzzzzzzbzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"

PressIt:="|<>*30$72.zzzzzzzzzzzzz01zzzzzzzzzz00zzzzzzzzzz00Tzzzzzzzzz00Dzzzzzzzzz3sDzzzzzzzzz3wA8D0TUDUDz3wA0C0D0707z3sA0A060607z1kA0M067C7Dz00Q7sC23y3zz00QDsC20C0Dz00wDs070707z03wDs0DU7U7z3zwDsDzw3w3z3zwDs0C6263z3zwDw060607z3zwDy060607zXzyDz0D0D0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"

Damage:="|<>*15$107.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk0TzzzzzzzzzzzzzzzU0Tzzzzzzzzzzzzzzz00Tzzzzzzzzzzzzzzy00Tzzzzzzzzzzzzzzw7UTzzzzzzzzzzzzzzsTUz13231z13s8z0TzkzUw06001w07U0w0TzVz1k0A001k0C01k0Tz3y300M00300M0300Ty7w630kM4630kM63UzwDsAD1UkQAD1VsA71zsTkMS33UsMS33kM07zkz1kw671kkw67Uk0TzUs3UEAC3VUEA01Uzzz00D00MS7300Q030lzy00z00kwC700s0701zw03z01VsQD01w0D03zw0zzX7XlwTX7zkz0DzzzzzzzzzzzzzzVzzzzzzzzzzzzzzzz63zzzzzzzzzzzzzzzw0Dzzzzzzzzzzzzzzzs0Tzzzzzzzzzzzzzzzw3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"

Cooldown:="|<>*24$130.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyTzzzzzkzzVzzzzzzzzzzz0Dzzzzz3zy7zzzzzzzzzzk0DzzzzwDzsTzzzzzzzzzy00zzzzzkzzVzzzzzzzzzzk03zzzzz3zy7zzzzzzzzzz0wTzzzzwDzsTzzzzzzzzzsDzy0zk7kzU1w1wSD323zzUzzk1y0D3w07U3UsQA07zy7zy03k0QDU0Q0731kk0DzsTzk0600kw01U0A42300TzVzz1kMC33kM63UkE8Q31zy7zwDVVwAD3kMT3U01kS7zsDzky67kkwD1VwC0073sTzUTz3sMT33kw67kw00wDVzz0wA71UsA70UMC3k83ky7zy00k0600k601U0DUkT3sTzs03U0w070M0701y31wDVzzs0T07s0y1k0S0DsSDky7zzs7z1zsDwDkXy3zlszXsTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"

Champion:="|<>*16$60.trzzzzvzzzULzzzzvzzzCrzzzzzzzzDkQA8kvVUkTkMA0kP9UrTrPharPQilDr/BaGPQiQUL8BaEP1iIkrQhakvXikU"

Dodge:="|<>*27$36.Uzznzz0TzXzz4CzXzz78A21170421071UUE0610UE10M4211UwC311U"

UncommonLoot:="|<>*30$139.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwDwDzzzzzzzzzzzzzzzzzzzy7y7zzzzzzzzzzzzzzzzzzzz3z3zzzzzzzzzzzzzzzzzzzzVzVzzzzzzzzzzzzzzzzzzzzkzkzzzzzzzzzzzzzzzzzzzzsTsMETs3w1w8C7V1kzUDV1zwDwA07s0w0S001k00DU3k0Ty7y601s0Q07000M003U0s07z3z300M0A01U00A001U0A01zVzVUMA7C3UkM4630UkQ61UzkTkkS67z3sMA731UsMT31sTsDkMT33zVwAC3VVkQADVVwDy7sADVVzky671kksC67kky7z0sC7kk8sC33UsMQ731kMT3zU073sM0A01VkQAC3VU0ADVzs07VwC0701ksC671ks0C7kzy07ky7U3k1sQ733UsS0D3sTzkDwT3w7y1wD7VVswDkDlwDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"

CommonLoot:="|<>*36$113.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU7zzzzzzzzzzzzzzzzw03zzzzzzzzzzzzzzzzk07zzzzzzzzzzzzzzzz00Dzzzzzzzzzzzzzzzy1szzzzzzzzzzzzzzzzsDzy0y473kUsTk7kUzzkTzs0w003U00T07U0zzVzzU0s003000Q0700zz3zy00k006000k0600zy7zw71Uk8A611UsA71zwDzsT31UsMA733sMD3zsDzky671kksC67kky7zkDzVwAC3VVkQADVVwDzkD31kMQ733UsMC33sTzk0600ksC671kk067kzzU0C03VkQAC3Vk0QDVzzk0y0D3UsMQ73k1sT3zzs3z0y7XkkwS7s7sy7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

Speed:="|<>*25$35.lzzzzt1zzzzkTzzzzYS31Uk8A6H9US9UYHAiGNwyF1UkMA37TksQg"

AntRaids() {
    

    


    MainCards() ; picks the three main cards
    Sleep(2000)
    ; Starts TinyTask
    Send("{F8 down}")
    Sleep(100)
    Send("{F8 up}")
    ; While TinyTask is running, the script will search for the alt cards
    loop {
        Sleep(5000)
        AltCards()
    }


    
}





AltCards() {

    
   
    if (FindText(&X, &Y, 1258-150000, 455-150000, 1258+150000, 455+150000, 0, 0, Cooldown)) {
        BetterClick(X, Y) 
    }
    if (FindText(&X, &Y, 641-150000, 457-150000, 641+150000, 457+150000, 0, 0, Range)) {
        BetterClick(X, Y) 
    }
    if (FindText(&X, &Y, 950-150000, 457-150000, 950+150000, 457+150000, 0, 0, Slayer)) {
        BetterClick(X, Y) 
    }
    if (FindText(&X, &Y, 960-150000, 540-150000, 960+150000, 540+150000, 0, 0, Harvest)) {
        BetterClick(X, Y) 
    }
    if (FindText(&X, &Y, 960-150000, 540-150000, 960+150000, 540+150000, 0, 0, Strong)) {
        BetterClick(X, Y) 
    }
    if (FindText(&X, &Y, 946-150000, 458-150000, 946+150000, 458+150000, 0, 0, PressIt)) {
        BetterClick(X, Y) 
    }
    if (FindText(&X, &Y, 644-150000, 457-150000, 644+150000, 457+150000, 0, 0, Damage)) {
        BetterClick(X, Y) 
    }
    if (FindText(&X, &Y, 960-150000, 540-150000, 960+150000, 540+150000, 0, 0, Champion)) {
        BetterClick(X, Y)
    }
    if (FindText(&X, &Y, 960-150000, 540-150000, 960+150000, 540+150000, 0, 0, Dodge)) {
        BetterClick(X, Y) 
    }
    if (FindText(&X, &Y, 1235-150000, 457-150000, 1235+150000, 457+150000, 0, 0)) {
        BetterClick(X, Y) 
    }
    if (FindText(&X, &Y, 619-150000, 455-150000, 619+150000, 455+150000, 0, 0, CommonLoot)) {
        BetterClick(X, Y) 
    }
    if (FindText(&X, &Y, 960-150000, 540-150000, 960+150000, 540+150000, 0, 0, Speed)) {
        BetterClick(X, Y) 
    }

    status()
    return
}


status() {
    Failed:="|<>*118$101.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003zU00000000000000zzw00001U00000003k1y0000Ts0000000600C0001ts0000000M00C00030k0000000k00C00061U0000001U00C000A300000003000A000M600000006000MDz1kDXxzDU7kA1y0NzzjUTzzzzUTsM3y0rU3s01kM73Vksk6A1w03k01U04330lUAQ3k03U020087C1X0Tk700300400E6M360z0A00600800U7k6A000s1U400k03UD0MM001U7UD0zU7zUC0kk0070T0S1z0Tv0M3VU00C000w360l70E63000Q003s6A1U600Q6000s006kAM30600kA001k00xUTk60A01UM3w1UDzn0TUA0A060k7s3U7Va070M0Q0A1UAs3003g060k0M0k30Mk7003Q0A1U0s1U60lkD006M0M300k70C1VUT00Qs0s601UA0A73Vr01kw3kQ060s0Tw3z7zzUzzzk0A1U0Dk3s3zw0Tsz00s30000000y0000001UA0000000000000070M00000000000000A1k00000000000000M3000000000000000kC000000000000001kM000000000000001zk000000000000001z0000000000000000M0000000000000000004"
    if (ok:=FindText(&X, &Y, 1134-150000, 840-150000, 1134+150000, 840+150000, 0, 0, Failed)) {
        Send("{F8 down}") 
        Sleep(100)
        Send("{F8 up}")
        BetterClick(1167, 819) 
        Sleep(5000)
        AntRaids()
        return
    } else  if (ok:=FindText(&X, &Y, 1159-150000, 448-150000, 1159+150000, 448+150000, 0, 0, MonarchCoins)) {
        Send("{F8 down}") 
        Sleep(100)
        Send("{F8 up}")
        BetterClick(929, 525) 
        
        BetterClick(929, 525) 
        BetterClick(929, 525) 
        BetterClick(929, 525)
        BetterClick(929, 525) 
        Sleep(5000)
        BetterClick(1167, 819)
        Sleep(1000)
        AntRaids()
        return
    } else {
        return
    }

}
AntRaids()
F2::ExitApp