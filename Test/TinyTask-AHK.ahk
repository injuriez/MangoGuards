#Requires AutoHotkey v2.0
#Include  %A_ScriptDir%\libs\FindText.ahk
Failed:="|<>*46$214.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000Dzzzw000S0007k3s0001zzzzUDzz00000007zzzzy007y003ztzw000Tzzzzrzzzk000000zzzzzw01zy00Tzzzs007zzzzzzzzzk000007zzzzzk0Dzs03zzzzk00Tzzzzzzzzzk00000T0000DU0y7k0D0TUD003s0000y001zk00001s0000S07UDU0w0y0S00D00003s000zU0000D00000s0S0S07U3k1s00s000070000z00000w00003U3k0w0S0D07U07U0000Q0001y00003k0000C0D03k1s0w0S00S00001k0001w0000D00000s1s0DU7U3k1s01s0000700003s0000w00003U7U0S0S0D07U07U0000Q00007U0Dzzk0000Tzw01zzs0w0Tzzy00003k0000Dzzzzz00003zzk03zzU3k1zzzs0000T00000zzzzzw0Tzzzzy00Dzy0D07zzzU3zzzw0Ts01zzzzzk1zzzzzs00Tzs0w0Tzzy0Dzzzk1zs07zzzzz07zzzzz001zzU3k1zzzs0zzzz07zs0Dzzzzw0Tzzzzw003zy0D07zzzU3zzzw0Tzk0zzzzzk1zzzzzU00Dzs0w0Tzzy0Dzzzk1zz01zzzzz0003zzy000TzU3k1zzzs000Tz07zy07zzzzw0007zzk001zy0D07zzzU000zw0Tzw0Tzzzzk000Dzz0303zs0w0Tzzy0001zk1zzk1zzzzz0000zzw0A0DzU3k1zzzs0007z07zz07zzzzw0003zzU1s0Ty0D07zzzU000Tw0Tzw0Tzzzzk000Dzy07U1zs0w0Tzzy0001zk1zzk1zzzzz0000zzk0z03zU3k1zzzs0007z07zz07zzzzw0003zz03w0Dy0D07zzzU000Tw0Tzw0Tzzzzk000Tzs0000Ts0w0Tzzy0003zk1zzk1zzzzz000DzzU0001zU3k1zzzs0Tzzz07zy07zzzzw0Tzzzw00003y0D07zzzU3zzzw0Tzk0zzzzzk1zzzzk0000Ds0w0Tzzy0Dzzzk1zz03zzzzz07zzzy00000TU3k1zzzs0zzzz07zk0Dzzzzw0Tzzzs00001y0D07zzzU3zzzw0Ty01zzzzzk1zzzz000003s0w0Tzzy0Dzzzk1zU07zzzzz07zzzw00000DU3k1zzzs0000D00000zzzzzw0TzzzU1zzk0S0D0000TU0000w00007zzzzzk1zzzy07zzU1s0w0000S00001k0000zzzzzz07zzzk0zzy07U3k0001s0000700007zzzzzw0Tzzz03zzw0C0D00007U0000Q0000zzzzzzk1zzzw0Tzzk0s0w0000S00001k0007zzzzzz07zzzk1zzzU3U3k0001s000070000zzzzzzy0TzzzUDzzy0T0DU0007k0000y000Dzzzzzzw3zzzzUzzzw7y1z0000zU0007w00Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"
shibuya:="<>*96$67.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz7nzAzzzzzzz0szWDzzzzzz0ATn7zzzzzzXCDzXzzzzzzlz0wkDDAwQHsDU683XUCA1y1k340ll640zUMlWAMsV6ATyAQF74QM2CDb6C8X2AC3X7k374E3071k3s1XW83k3lw1y3nnAXwHsz4zzzzzzzzszzzzzzzzzzwTzzzzzzzzzwTzzzzzzzzzzDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"

LobbyCheck:="|<>*137$201.y07zzk1y0M0Dzzk000zy03070001zU00Tzk0zzy0DU000Tzs0007z0000s000Ds001zy07zzk1w0001zy0000zk00070001y0007zk0zzy0DU0007zU0007w0000s000DU000Ty07zzk1w0000zw0000z000070001s0003zk0zzy0DU0003z00007s0000s000C0000Dy07zzk1w0000Dk0000y000070001k0001zk0zzy0DU0001y00007k0000w000Q01w0Dy07zzk1w01s0Dk0C00w01k07y07zU0zk0zk0zzw0DU0zU0w07w07U0z00zk0zw0Dy07y07zzU1w07y07U1zU0w0Dw07y07zU1zk0zk0zzw0DU1zk0w0Dy07U1zk0zk0zw0000Dz03zzU1w0Dz07U1zk0s0Ty07y07z00001zs0Tzw0DU1zs0w0Ty0703zk0zk0zs0000Dz03zz01w0Dy07U1zk0w0Ty07y07zU0003zs0Dzs0TU0zk0w0Dy07U1zU0zk0zw0000zzU0zy03w03w07U0zU0w07w07y07zU1zzzzw03zU0TU0C01w03s07U0T00zk0zw0Dzzzzk07U07w0000Dk0000w00007y03zU0zzzzy00000zU0001y00007k0000zk00y03zVzzs0000Dw0000Ts0000y00007y007k0007zz00003zU0007z00007s0000zs00T0000Tzw0000Tw0001zw0000zU0007z003s0003zzk0007zU000Tzk0007y0000zw00TU000Tzz0001zw0007zz0000zs0007zU03y0003zzw000zzU101zzw0007zU080zy00zs000Tzzs00Dzw0C0zzzs0M1zy030Dzw07zU007zzzk07zzU1zzzzzkDkTzy3y3zzw1zzU03zzzzsTzzw0DzzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzVzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
usebutton:="|<>*103$62.000000000000000000000DU3k0000007y3z0000003zVzs000000sQQC000000A771U0000071lUQ000001kQM7zs3z00Q761zzXzw071lUTzzzzU1kQM70Dw0w0Q761U1w07U71lUE0S00s1kQM407U0C0Q7611zk61k71lUE3w3UQ1kQs60D0070A3y3U0k03k3Uz0w0A00s0s7kDk30zy0C007XUkDbU1k01k0C00s0S00w03U0C03k0T01w03U0S0Tw0zk1s03zzjzyzzw00TzUzz3zy001zU3z0Dy00000000000000000000008"
Namek:="|<>*99$125.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzwTzz0CDzzzzz7yDXzzzzzszzy0ATzzzzyDwD7zzzzzlzzw0MzzzzzwTsSDzzzzzXzzsslwH8z1kDkQQH8lwH6zzllXk60Q10TUMk601k68zzX370A0k20z0F0A010A1zz06CAMlX77y82AMVWAM7zy0QMslk0CDwM0slX0skTzw7sslXWDwTsk8lX68lUTzszkk374BsTlkE36AE30TzlzVk6C81kTXkk6AMk68TzbzXlAww7kzDnlAtnlAtzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
NamekLoading:="<>*135$304.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzy1zzzzzzzzzzzzzzzzzzzzzzzU000Tzzw3zzzzzzzzzzzzzzzzzs7zzzzzzzzzzzzzzzzzzzzzzw0000zzzkDzzzzzzzzzzzzzzy7zUTzzzzzzzzzsTzzzzzzzzzzzk0003zzz0zzzzzzzzzzzzzzzkDy1zzzzzzzzzz0zzzzzzzzzzzz0000Dzzw3zzzzzzzzzzzzzzz0Ts7zzzzzzzzzw1zzzzzzzzzzzw0000zzzkDzzzzzzzzzzzzzzw1zUzzzzzzzzzzk7zzzzzzzzzzzs000Dzzz0zzzzzzzzzzzzzzzk7zzzzzzzzzzzz0Tzzzzzzzzzzzzw3zzzzw3zzzzzzzzzzzzzzz0Tzzzzzzzzzzzw1zzzzzzzzzzzzzkDzzzzkDzzzzzzzzzzzzzzw1zzzzzzzzzzzzk7zzzzzzzzzzzzz0zzU3z0zy0Dw71zzU3zks700T3wD3zzUsDzw01zk1zzzzzzzzzw3zs03w3zU0Dk81zs07y10800s7UE3zs00zzU03w03zzzzzzzzzkDz007kDw00T003z007s00U03US003z001zy00DU03zzzzzzzzz0zs00D0zU00w007s00DU0200C1s00Ds007zs00w007zzzzzzzzw3z000w3w003k00DU00y00M00s7U00TU00TzU03k00TzzzzzzzzkDw003kDk00D000w001s01U03US000w001zy00C000zzzzzzzzz0zk7k70z0T0Q0E1k3U7U7D00S1s003k307zw01s1k3zzzzzzzzw3y0z0Q3s3w1k7k60z0S0zz0Ts7UDUC0y0Tzw1z0TUDzzzzzzzzkDs3w1kDUDk70z0M3y0s7zw1zUS1z0s3w1zzk7w1z0Tzzzzzzzz0zU00D0y000w3y1UDs3UTzk7y1s7w3UTk7zz0Tk7w1zzzzzzzzw3y000w3s003kDs60zUC1zz0Ts7UTkC0z0Tzw1z0Tk7zzzzzzzzkDs007kDU00T0T0M3y0s7zw1zUS1z0s3s1zzk7w1z0Tzzzzzzzz0zUDzz0y0zzw0s1U7k7UTzk7y1s7w3U707zz0Tk3s3zzzzzzzzw3z0Tzw1w1zzk00D0A0S1zz0Ts7UTkD000Tzw1zU60D1sD1zzzzkDw0Q7k1k1kT000w001s7zw07US1z0w001zzk0S000s30M3zzzz0zk00T03001w007s00DUTzs0S1s7w3s007zzU1w007UA1UDzzzw3zU00w0C003k00zU01y1zzU1s7UTkDk00Tzy07k00y0k60zzzzkDz003k0w00D007z007s7zz07US1z0zU01zzw0TU03s30M3zzzz0zy00TU3s01w20zz01zUTzy0S1s7w3z0E7zzs1zU0zUA1UDzzzy7zy03zUTs0DkDzzz0Tz3zzy3wDkzsTzz0TzzsDzUDz1sD1zzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzw3zzzzzzzzzzzzzzzzzzzzzzzzzzzzw3zzzzzzzzzzzzzzzzzwTUDzzzzzzzzzzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzk80zzzzzzzzzzzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzy003zzzzzzzzzzzzzzzzzzzzzzzzzzzzw3zzzzzzzzzzzzzzzzzs00TzzzzzzzzzzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzU03zzzzzzzzzzzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzz00Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzw3zzzzzzzzzzzzzzzzzz07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzwzzzzzzzzzzzzzzzzzzznzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
PortalPicker:="<>*129$70.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzbsTzzzzzzzzwDVzzzzzzzzzky7zzzzzzzzz3sTzzzzzzzzwDVzzzzzzzzz0647kUw1z0Ts080D03U3s0zU0U0Q0A0701z0200k1U0M07z3s631y3UUsDwDUwADsC23Uzky7kkzU0M07z3sT33y03U0zwDVwADsDy3zzk67kkzU0s0Dz0MT33z01k0Ty1VwADy07U1zw67kszw0z0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"
voteDectect:="<>*93$64.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwDzXzzzzzzzUzw7zzVzzzz1zkTzy7zzzw7y3zzsTzzzkTsDzzVzzzzUz1w7s0z0zy3w707U1k1zw7ks0A0603zkS3U0E0M07zUsQ01U10kTy31kS3Vw7Vzw4D3sC7k07zk0wDUsT00TzU7kS3Vw07zy0T0kC3kTzzw3y01s300zzkDs0DU603zzVzk1z0w0Dzz7zkDz3s0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"
create:="<>*160$182.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz07zzzzzzzzzzzzzzzzzzzzzzzzzzzz00Dzzzzzzzzzzzz3zzzzzzzzzzzzzz001zzzzzzzzzzzzUTzzzzzzzzzzzzz000Dzzzzzzzzzzzs7zzzzzzzzzzzzzU001zzzzzzzzzzzy1zzzzzzzzzzzzzk000zzzzzzzzzzzzUTzzzzzzzzzzzzw000Dzzzzzzzzzzzs7zzzzzzzzzzzzy07y7zzzzzzzzzzzy1zzzzzzzzzzzzz07znzjkzy0zzzzzz0Dzy0zzzzzzzzzk3zzz0k3y01zy0kC007y01zzzzzzzzw1zzzk00y00Dz001U00y00Dzzzzzzzz0Tzzw00D001z000M00D001zzzzzzzzUDzzz003U00Tk006003U00Tzzzzzzzs3zzzk01s003s001U01s003zzzzzzzy0zzzw00Q0Q0w000M00Q0Q0zzzzzzzzUDzzz0Dz0DUD0607k3z0DUDzzzzzzzs3zzzk7zk7w3k7s1y1zk7w3zzzzzzzy0Tzzw1zs1y0s1y0TUTs1y0zzzzzzzzk7zzz0Ty000C0zk7s7y000Dzzzzzzzw1zzzk7zU003UDw1y1zU003zzzzzzzz0Dzzw1zs001s3y0TUTs001zzzzzzzzs1zwT0Ty0Tzz0TU7s7y0Tzzzzzzzzzy07w7k7zk7zzk3k1y0zk7zzzzzzzzzzk000w1zw0zrw000TU1w0zrzzzzzzzzy00070Tz000zU007s0D000zzzzzzzzzU001k7zs007s001y01s007zzzzzzzzy000w1zz001z000Tk0T001zzzzzzzzzk00T0Tzs00Ts007w0Ds00Tzzzzzzzzz00DkDzz007zU43zk3z007zzzzzzzzzw0Ty7zzw07zy7lzz1zw07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
yes:="|<>*120$71.0D1vkS0000000S1zUQ0000000w3y0zy0Ts001s3w3zz7zw001s7kDzzTzy003s70Tkzz3y003k61w0Tk0w003k87k0T00s007k0D00S03k007U0w00M07U007U3k30kTS000DU7UT1UDw000D0T0w3U1w000D1y00701s3zzy3w00T01zzzzw7s01zU3zzzzsDkDzxs7zzzzkTk67ksDzzzzUzU0700Tzzzz1zU0C00zzzzy3zU0Q03zzzzw7zU1y0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
cancel:="|<>*134$121.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007U00000s000000000000Dw00007zk00000000000Dz0000Dzy0000000000073U000TkTU000000000030k000T01s00000000001UM000S00S00000000001kA000C00700000000000s6000C003bztyy03z0DyQ3000C001zzzzzk7zsTzy1U0070Tlzzzzzy7zyTXz0k003UTzz0UsM7bU7y0DUM003USDz00M01rU0y03kA001kC3z00A00TU0S00s6000sC0700600DU0C00Q3000Q703U03003U060s61U00C3U3UA1UC1k770y30k0070s7kD0kDUs7zUS1UM03zUTzsDkM7kQ7zk00kDzzzk7zw7sA3s63zs00s7zzzw1zC1s61w30zw01w3zzzy0C30030y1UAC1zy1zzzzU00k01UT0s03UCD0Dzzzs00M00kDUQ01k03k3zzzy00C00M7kD00w01s1zzzzU0DU0A3sDk0z00w0zzzzw0TwCD3y7y1zk0zUzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
darkerYes:="|<>*85$102.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000D01k0000000000000zk7w0000000000001zkDz0000000000003xsTT0000000000003kwS7U000000000007UQw3U0000000000070Ss3k000000000007UDs3zs0zs00000003UDk7zz3zy00000003k7k7zzbzz00000001s3UDsDzkTU0000001s30T03y03k0000000w10S01w01k0000000S00w00w03k0000000S01s00M03k0000000D01s00M7bU00000007U3k7UM3zU00000007U7kDUQ0DU00000003k7k00Q03k0000zzzzkDk00S01zzzzzzzzzkDk00z01zzzzzzzzzkDkDzzk1zzzzzzzzzkDk7zwT1zzzzzzzzzkDs00s21zzzzzzzzzkDs00s01zzzzzzzzzkDw00s01zzzzzzzzzkDy00w03zzzzzzzzzsDzU1y07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
darkerCancel:="|<>*104$132.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000Dk00000Dw0000000000000Tw00000zzU000000000000ww00003zzs000000000000sC0000Dk1w000000000000kC0000T00S000000000000kC0000w00C000000000000kC0000s00C000000000000kC0001k00C7zwzTU0Ts1zskC0003k1UCTzzzzs1zy7zykC0003U7wRzzzzzy7wzDkzkC0003UTzzs47UUTDU7y07kC00070SDzU07007S03w03kC00070s3b007003w01s01kC00070s0C007003s01k01kC00070k0C007001s01k20kC00070s0Q0U70A1k33UD0kC00070s0Q3s70S1kDrUT0kC00070s7w3s70z0kDzU00kC00zz0Tzw3s70z0kDzU00kDzzzzUTzw3s70z0kDzU01kDzzzzU7wQ1k70z0k7bUTzkDzzzzk00A0070z0k03UDzk3zzzzk00C0070z0s01k03k1zzzzs00D0070z0w01k01s1zzzzw00D0070z0w01s01s1zzzzz00Tk070z0z03w01w1zzzzzk1zsA7VzVzkDz03y1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
darkerCreate:="|<>*87$181.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007zk000000000000000000000000000Dzz0000000000000Dk000000000000zzzs000000000000zy000000000000zzzz000000000000zzU00000000001zw3zk00000000000Tzs00000000001zk0Dw00000000000Tzw00000000001zU01z00000000000DUT00000000001z000DU00000000007UDU0000000000z0003k00000000003k7k0000000000y0001ztzU7zs03yTls3y0TzU000000z0000zzzwTzz07zzzw1zlzzw000000T0000zzzzTzzkDzzzy0zxzzz000000T00y0TzzzzzzwDzzzz0Tzzzzk00000DU1zsTzzTzw3zDzzzzU7zzkDw000007U1zzzkA0zk0Tzs3UQ007z01z000007k1zzzk40TU03zk0UC001y00Dk00003s1zDzs007U00zk003000y003w00001s0y1zw007U00Dk001U00S000y00000w0y0DS003U007k000k00C000T00000S0T00D001U001s000M0060007k0000D0DU07U01k0s0s000A00303U3s00007U7k03k1ts0y0Q0007k17U3s1w00003k3s0zs1zs0z0A0T03w1zU3w0y00001s1y1zw0zw0TU60Tk1y0zk1y0T00000y0Trzy0Ty00030Ds0z0Ts000DU0000T0Dzzz0Dz0001U7y0TUDw0007k0000DU3zzzU7zU001k3y0Dk7y0007s00Tzzk0zzDk3zk001s0z07s3z0007zzzzzzw07y3s1zs0zzy0D03w0zU3zzzzzzzzy00E0w0zy0Tzz0001y0Ts1zzzzzzzzzU000S0Tz03sDU000z00w0DUzzzzzzzs00070Dzk007s000TU0D000Tzzzzzzy0003U7zs001y000Dk07U007zzzzzzzU003k3zy000z0007w03s003zzzzzzzw003s1zzU00Ts003z01y001zzzzzzzz003w1zzs00Ty083zk0zU01zzzzzzzzw0Dz1zzz00TzkS3zy0zw01zzzzzzzzzzzzzzzzy7zzzzzzzzzzsTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"
MainGUI := Gui("-Caption +AlwaysOnTop +ToolWindow", "Anime Vanguards Macro")
MainGUI.BackColor := "0x1E1E1E"
MainGUI.SetFont("s10", "Segoe UI")

; Make GUI movable
MainGUI.OnEvent("Close", (*) => ExitApp())
MainGUI.AddText("x10 y5 w200 Center cPurple", "Anime Macroguards [TINYTASK WRAPPER]")

; Countdown Timer Text
CountdownText := MainGUI.AddText("x10 y110 w210 Center cWhite", "")
Wins := MainGUI.AddText("x10 y130 w210 Center cWhite", "")
Loss := MainGUI.AddText("x10 y150 w210 Center cWhite", "")

; Buttons
StartBtn := MainGUI.AddButton("x10 y30 w95 h30", "Start")
StopBtn := MainGUI.AddButton("x125 y30 w95 h30", "Stop")
ExitBtn := MainGUI.AddButton("x10 y70 w210 h30", "Exit")

; Button Events
StartBtn.OnEvent("Click", StartMacro)
StopBtn.OnEvent("Click", StopMacro)
ExitBtn.OnEvent("Click", (*) => ExitApp())

; Hotkeys
Hotkey("k", StartMacro)
Hotkey("m", StopMacro)

BetterClick(x, y) {
    MouseMove(x, y)
    sleep 10
    MouseMove(1, 0, , "R")
    sleep 20
    MouseClick("Left", -1, 0, , , , "R")
    Sleep(50)
}
PortalWins:= 0
PortalLosses:= 0 

Countdown(seconds, text) {
    global CountdownText
    if seconds == 0 {
        CountdownText.Value := text  ; Clear the countdown text
    } else {
        Loop (seconds) {
            CountdownText.Value := "Starting in " seconds - A_Index " seconds..."
            Sleep(1000)
        }
        CountdownText.Value := ""  ; Clear the countdown text
        StartTinyTask()

    }
}

StartMacro(*) {

    ; Countdown(20)  ; 20-second countdown timer

    ; Check if in the lobby
    if (FindText(&X, &Y, 602-150000, 259-150000, 602+150000, 259+150000, 0, 0, LobbyCheck)) {
        BetterClick(1495, 227)  ; Close leaderboard
        Sleep(1000)
        Send("{Tab}")  ; Close chat/UI
        Sleep(100)
        Send("{j}")  ; Open item menu
        Sleep(2000)
        BetterClick(1180, 326 - 10)  ; Click search bar

        ; Type "Winter Portal" letter by letter
        text := "winter portal"
        for each, char in StrSplit(text) {
            Send(char)
            Sleep(100)
        }
        Sleep(1000)  ; Wait for items to load

        ; Get the position of the window
        WinGetPos(&winX, &winY, &winWidth, &winHeight, "A")

        ; Search for "Winter Portal" in inventory
        row := 0
        col := 0
        loop {
            MouseMove(570 + (col * 150), 447 + (row * 100))  ; Move to the current item
            Sleep(1000)

            if (FindText(&X, &Y, 697-150000, 603-150000, 697+150000, 603+150000, 0, 0, Namek)) {
                ; Adjust coordinates to be relative to the window
                MouseGetPos(&mouseX, &mouseY)
                BetterClick(mouseX, mouseY)
                ; Found Portal so lets press the use button after clicking
                ;clicks on the use button
                loop {
                    if (FindText(&X, &Y, 763-150000, 538-150000, 763+150000, 538+150000, 0, 0, usebutton)) {
                        ; Adjust coordinates to be relative to the window
                        BetterClick(X , Y - 30)
                        Sleep(2000)
                        ; finds and press the create button 
      

                        loop {
                            if (ok:=FindText(&X, &Y, 804-150000, 538-150000, 804+150000, 538+150000, 0, 0, create)) {
                                BetterClick(X, Y)
                                Sleep(100)
                                break
    
                            } else {
    
                                if (ok:=FindText(&X, &Y, 814-150000, 537-150000, 814+150000, 537+150000, 0, 0, darkerCreate)) {
                                    BetterClick(X, Y)
                                    Sleep(100)
                                    break
                                }
                            }
                        }
                            
                        
                        ; 
                        Sleep(35000)
        
                        Loop {
                            if (ok := FindText(&X, &Y, 183-150000, 794-150000, 183+150000, 794+150000, 0, 0, NamekLoading)) {
                                Countdown(0, "Loading into [planet namek]")
                                Sleep(2000)
                                findvoting()
                                Sleep(500)
                                break
                            }
                        }
    
    
                    }
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
}

StopMacro(*) {

}

; Show GUI
MainGUI.Show("w230 h150")

; Allow dragging
OnMessage(0x201, (*) => PostMessage(0xA1, 2, 0, MainGUI.Hwnd))

findvoting() {
    loop {
        if (ok:=FindText(&X, &Y, 923-150000, 129-150000, 923+150000, 129+150000, 0, 0, voteDectect))
            {
              ; if find voting ui then start countdown
              Countdown(0, "Found Voting UI")
              Sleep(5000)
              Countdown(20, "")
              
            }
    }
}


StartTinyTask() {
    ; Starts tiny task
    CountdownText.Value := "TinyTask [CONNECTED]"
    Send("{F8 down}")
    Sleep(100)
    Send("{F8 up}")
    Sleep(1000)
    loop {
        if (ok:=FindText(&X, &Y, 1033-150000, 345-150000, 1033+150000, 345+150000, 0, 0, PortalPicker))
            {
              Sleep(1000)
              Send("{F8 down}")
              Sleep(100)
              Send("{F8 up}")
              Sleep(500)
              CollectRewards()
              CountdownText.Value := ""
              break

            }
    }
}

CollectRewards() {
    global PortalWins, PortalLosses, Wins, Loss
    if (ok:=FindText(&X, &Y, 684-150000, 249-150000, 684+150000, 249+150000, 0, 0, Failed))
        {
          PortalLosses++
          Loss.Value := PortalLosses

          Sleep(2000)
          PickPortalsAGAIN()
        } 
        else {
            x_offset := 0  ; Initialize x_offset
            MouseMove(749 + x_offset, 500)
      
            loop {
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
      ; Move mouse to starting position
  
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
            BetterClick(X, Y - 20)
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
            PickPortalsAGAIN()
            break
        } else {
            if (ok:=FindText(&X, &Y, 961-150000, 556-150000, 961+150000, 556+150000, 0, 0, darkerCancel)) {
                BetterClick(X, Y - 20)
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
                PickPortalsAGAIN()
                

                break
            }
             
        }
    }
}

PickPortalsAGAIN() {
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
                    StartTinyTask()
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
