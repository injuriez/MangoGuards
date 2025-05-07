#Requires AutoHotkey v2.0
#Include ../../FindText.ahk
#SingleInstance Force
NoTrait:="|<>*25$150.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy7zzUzzzzzzzzzzzzzzzzzzzzw3zzUTzzzzzzzzzw00zzzzzzzs3zz0Tzzzzzzzzzs00Dzzzzzzs3zz0Tzzzzzzzzzs007zzzzzzs3zz0Tzzzzzzzzzs003zzzzzzs3zz0Tzzzzzzzzzs001zzzzzzs3zz0Tzzzzzzzzzs001zzzzzzs3zz0Tzzzzzzzzzs3w1zzzzzzs3zz0Tzzzzzzzzzs3y0sC3y0Ts33z0Ty0TsC7sDzs3y0s01s07s00z0Ts07s81k3zs3y0k01k03s00T0Tk03k00U3zs3y0k01U01s00D0TU01k0001zs3w0k03001s0070T001k0001zs001k03000s0070T0A0k0000zs001k3q0S0s0k30S0S0k3040zs003k7y0z0M1s30S0y0k7UC0zs007k7y1z0M3w30S000k7UD0zs00Dk7y1z0M3w30S001k7UD0zs00Tk7y1z0M3w30S001k7UD0zs03zk7y0z0M1s30S007k7UD0zs3zzk7y0Q0s0k30S0zzk7UD0zs3zzk7z000s003U30T3k7UD0zs3zzk7z001s007U3003k7UD0zs3zzk7zU01s00DU3U01k7UD0zs3zzk7zk03s00TU3k01k7UD0zw3zzs7zs07w00zk3s03s7UT0zw7zzsDzy0Tw63zs3w07sDkTVzzzzzzzzzzzzzzzzzzvzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
KingsBurden := "|<>*14$133.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwDzzzzzzzzzzzzzzzzzzzzw3zzzzzzzzy00Dzzzzzzzzy1zzzzzzzzz001zzzzzzzzz0zzzzzzzzz000TzzzzzzzzUTzzzzzzzzU00DzzzzzzzzkDzzzzzzzzk003zzzzzzzzs7zzzzzzzzs001zzzzzzzzw3zzzzzzzzw1z0Tzzzzzzzy1zzzzzzzzy0zUC3z1sC3y30zs1zUsDzz0Tk70z0w00w00Tk0Dk01zzUDk70TUQ00Q00Dk03k00Tzk703UDkC00A007k00s007zs3U3k7s700C003k00Q003zw1k0s3w3U06001s1U6000zy0s0Q1y1k3r080s1s3060Tz0S060z0s3z0T0Q1w1UDUDzUDw30TUQ1zUDUC000k7s7zk7y1UDkC0zkDs7000s3w3zs3z0s7s70Ts3s3U00Q1y1zw1zUQ3s3UDw1w1k00y0z0zy0z0C0M1k7z080s3zz0TUTz0007000s3zU00S0zDUDkDzU007k00Q1zs00D003k7s7zk003s00C0zw007k00s3w3zs003y0070Tz003w00Q1y1zy003zU43kDzk01z00T0z0zz007zw73sDzy3Vzk0TUzkzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"
Exterminate:="|<>*29$235.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzsTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs7zzzzzzzzzzzzzzzzw000zzzzzzzzzzzzzzzzzs3zzzzzzzzzzzzzzzzy000TzzzkDzzzzzzzzzzzw1zzzzzzzy1zzzzzzzy000Dzzzs7zzzzzzzzzzzy0zzzzzzzz0zzzzzzzz0007zzzw3zzzzzzzzzzzzUzzzzzzzzUTzzzzzzzU003zzzy1zzzzzzzzzzzzxzzzzzzzzkDzzzzzzzk003zzzz0zzzzzzzzzzzzzzzzzzzzzs7zzzzzzzs3zzzzzzUTzzzzzzzzzzzzzzzzzzzzw3zzzzzzzw1zzwDyC00Tk3z1kQ73w7y3kQ7zy3Vk03z0Dy3Uy0zzw3y300DU0TU0620Q0z0s00zw0UM01y01z00D0Tzy0y0U03U07U020040T0M00Dw00A00S00T007U00z0C0E01U01k0100007UA003w00600C007U03k00TU20M00U00s00U0001k6001w003006003k01s00Ds00A00k30A00k0000s3000S001U07000s01w007y00DkDk3k60Ss1020Q1U30C080y1z0D0Q0xy003zU0Ds7s3s30Tw1s3UC0k7k70T0T0zUDk60zz003zs0Dw3w001UDy0w1s70M3w3UTUDUTkDs30TzUDzzy0Dy1y001k7z0S0w3UA1y1kDk7kDs7w1UDzk7zzy03z0z000s3zUD0S1k60z0s7s3s7w3y0k7zs3zzy00zUTU01w1zk7UT0s30TUQ1w1w3y0z0s3zw1zzy00DkDk7zy0zs3kDUQ1UDkC080y1z0C0Q1zy000S007s0Q1yT0Tw1s7kC0k7s7U00T03k00C0zz0006081w0C007UDy0w3s70M3w3k00DU1s00D0Tzk0030C0T03U01s7zUS1w3kC1y1w007s0S007kDzs001UDUDU1s00w3zkD0y1s70z0z003w0DU07s7zw000sDsDs1y00y3zsDUT0w7UzUTk21z0Ds0Dw7zz000yTyDzUzk0zVzy7sTkz3sTsTz7Vzw7z0Tz3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"
Money:="|<>*33$104.z01zzzzzzzzzzzzzzzU0Dzzzzzzzzzzzzzzk01zzzzzzzzzzzzzzs00Dzzzzzzzzzzzzzy007zzzzzzzzzzzzzzUC1zzzzzzzzzzzzzzk7szzzzzzzzzzzzzzw1zzkTsD1kTkMDy0TzUTzw3w3k03k03y01zs0zy0z0s00s00T00Dy00zUDkC00A007U01zk03s3w3U02001k00Tw00S0z0s01U00Q0k3zk03UDkC0Sk3060S0zz00M3w3UDw1w1UDUDzy060z0s3z0z0M003zzw1UDkC0zkDk6001zlzUM3w3UDw3w1U00TsDs70y0s3z0S0M00Tw1w1k30C0zk0060zzz000Q003UDy001k7lzk00DU00s3zk00Q00Dy003s00C0zw007U01zk01z003UDzU01w00Ty00zs10w3zy00TU0Dzs0zzUsT1zzzk7w07zzzzzzzzzzzzw1zzzzzzzzzzzzzzsy0zzzzzzzzzzzzzzw00Dzzzzzzzzzzzzzz007zzzzzzzzzzzzzzk01zzzzzzzzzzzzzzw00zzzzzzzzzzzzzzzU0Tzzzzzzzzzzzzzzy0TzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Lifeline:="|<>*22$138.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzsDz0zzzzUzUzzzzzzzzzzzzs7y0TzzzUTUTzzzzzzzz1zzk7w0Tzzz0T0Tzzzzzzzy0zzk7s0Tzzz0T0Tzzzzzzzy0zzk7k0Tzzz0T0Tzzzzzzzy0zzsDk0zzzz0TUzzzzzzzzy0zzyzk3zzzz0Tvzzzzzzzzy0zzzzkDzzzz0Tzzzzzzzzzy0zzzzkDzzzz0Tzzzzzzzzzy0zzsD00Ts0z0TUw71zzU3zy0zzs600TU0T0TUQ00Ty01zy0zzk600D00D0T0M00Dw00zy0zzk400C0070T0M007s00Ty0zzk600A0070T0M007k00Ty0zzk600Q0k30T0M003k30Dy0zzk7kDs1s30T0M0k3U7UDy0zzk7kDs3s30T0M3s3UDUDy0zzk7kDs0030T0M3w3U00Dy0zzk7kDs0070T0M3w3U00Ty0zzk7kDs0070T0M3w3U00Ty0zzk7kDs00T0T0M3w3U01zy0zzk7kDs3zz0T0M3w3UDzzy0zzk7kDw1yTU30M3w3k7tzy000k7kDw00DU30M3w3k00zz000s7kDy007U3UQ3w3s00Tz000s7kDz007U3UQ3w3w00Tz000sDkDzU0Dk3Uw7w3y00zzU01sDsTzs0Tw7Uy7y7zU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
global X1 := 214
global Y1 := 227
global X2 := 1500
global Y2 := 600

MainCards() {


    Setting := FileOpen(A_ScriptDir "\..\..\..\Settings\MangoSettings\StarterCard.txt", "r")
    StarterCard := Setting.ReadLine()
    BetterClick(1591, 205) ; clicks the cancel button
    while (true) {
    
        if StarterCard == "Exterminator" {
            if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Exterminate)) {
                BetterClick(X, Y)
                Sleep(1000)
          
                BetterClick(957, 565) ; clicks the cancel button
             
                break
              
            } else {
                ResetStage()
                ; Added delay after ResetStage returns
                Sleep(500)
            }
        } else if StarterCard == "Kings Burden" {
            if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, KingsBurden)) {
                BetterClick(X, Y)
                Sleep(1000)
                
              
                BetterClick(957, 565) ; clicks the cancel button
        
                break
            } else {
                ResetStage()
                ; Added delay after ResetStage returns
                Sleep(500)
            }
        } else if StarterCard == "Lifeline" {
            if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Lifeline)) {
                BetterClick(X, Y) 
                Sleep(1000)
               
               
                BetterClick(957, 565) ; clicks the cancel button
   
                break
            } else {
                ResetStage()
                ; Added delay after ResetStage returns
                Sleep(500)
            }
        } else if StarterCard == "Money Surge" {
            if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, Money)) {
                BetterClick(X, Y)
                Sleep(1000)
              
            
                BetterClick(957, 565) ; clicks the cancel button
       
                break
            } else {
                ResetStage()
                ; Added delay after ResetStage returns
                Sleep(500)
            }


        } else if StarterCard == "no trait no problem" {
            if (FindText(&X, &Y, X1, Y1, X2, Y2, 0, 0, NoTrait)) {
                BetterClick(X, Y) 
                Sleep(1000)
              
           
                BetterClick(957, 565) ; clicks the cancel button
          
                break
            } else {
                ResetStage()
                ; Added delay after ResetStage returns
                Sleep(500)
            }

        }
       
    }
    return
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



