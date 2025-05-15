#Requires AutoHotkey v2.0

#Include ../../../FindText.ahk
#Include ../CardPickerModule.ahk
#MaxThreads 255

Cooldown1:="|<>*23$180.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzkTzzsTzzzzzzzzzzzzzzw7zzzzzzzzkDzzkDzzzzzzzzzzzzzzU0zzzzzzzzUDzzkDzzzzzzzzzzzzzy00DzzzzzzzUDzzkDzzzzzzzzzzzzzw007zzzzzzzUDzzkDzzzzzzzzzzzzzs003zzzzzzzUDzzkDzzzzzzzzzzzzzk007zzzzzzzUDzzkDzzzzzzzzzzzzzU007zzzzzzzUDzzkDzzzzzzzzzzzzz07wDzzzzzzzUDzzkDzzzzzzzzzzzzz0DyTy0Tzs1zUDzUkDy0TsTlz7kQ7zz0Tzzs07zU0TUDy00Ds07kDUy1k01zy0zzzk03z00DUDw00Dk03kD0w1U00zy0zzzU01y007UDs00DU01kD0Q1U00Ty1zzz001w007UDs00D001k60Q1U00Ty1zzz000w003UDk00D000s6083U00Dy1zzy0S0s1s3UDk20C0S0s2083U30Dy1zzy0z0M3w1UDUDUC0z0M0007UDUDy0zzy1z0M7w1UDUDUC1z0Q0007UDkDy0zzy1z0M7w1UDUTkC1z0Q000DUDkDz0Tzy1z0M7w1UDUDUC1z0S000DUDkDz0DyC0z0s3w3UDUDUC0z0y000DUDkDzU3sC0Q0s1k3UDk20C0Q0y040TUDkDzU007000w003k1k00D000z0A0TUDkDzk007001w007k1s00D001z0C0zUDkDzs007U01y007k1s00DU01zUC0zUDkDzw007k03z00Dk1w00Dk03zUS0zUDkDzz00Ts07zU0Ts1y00Ds07zkT1zkTkDzzk1zy0Tzs1zy3zUsTy0TzszXzkTsTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Harvest:="|<>*31$152.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz1zw7zzzzzzzzzzzzzzzzzzzzzkDy0zzzzzzzzzzzzzzzzz0zzzs3zUDzzzzzzzzzzzzzzzzkDzzy0zs3zzzzzzzzzzzzzzzzw3zzzUDy0zzzzzzzzzzzzzzzzz0zzzs3zUDzzzzzzzzzzzzzzzzkDzzy0zs3zzzzzzzzzzzzzzzzw3zzzUDy0zkQD1kQDzVzU7zk1s01zzs3zUDk21k021zkDU0Tk0C00Tzy0zs3s00M00UTw3k03s01U03zzU000w0060083y0s00S00M00zzs000C001U060zUA007U0C00Dzy0003U00M01k7k70A0sDrU07zzU000k3060Tw1w1U7UC1zz0zzzs000A1w1UDzUC0s3s3U1zkDzzy0zs30z0M3zs3UC000s03w3zzzUDy0kDk60zz0E7U00T00T0zzzs3zUA3w1UDzs03s007s07kDzzy0zs30T0M3zy00y007zU0w3zzzUDy0k1060zzk0TUDzzz0D0zzzs3zUC001UDzw07w1yTVw3k0zzy0zs3U00M3zzU3z003k00w0DzzUDy0w0060zzw1zs00Q00TU1zzs3zUDU01UDzz0Tz007007s0Tzz0zw7w0UQ3zzsDzs03s03z0DzzkTz1zkQD1zzz7zz01zU3zw3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
Range:="|<>*30$118.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00zzzzzzzzzzzzzzzzzU00zzzzzzzzzzzzzzzzy001zzzzzzzzzzzzzzzzs003zzzzzzzzzzzzzzzzU007zzzzzzzzzzzzzzzy000Tzzzzzzzzzzzzzzzs3w0zzzzzzzzzzzzzzzzUDs3y3VsC3zz1Uzs1zzy0zUDU43U03zk03y01zzs3y0w00A007y007k03zzUDs3U00k00Dk00S007zy0z0A003000y001k00Tzs001k00A001s0070A0zzU0060M0k1U70A0M1s3zy000s3s30T0Q1w1UDUDzs003UTUA1y1kDk6000zzU00S1y0k7s70z0M007zy000s7s30TUQ3w1U00Tzs003UDUA1y1k7U6007zzUDk6080k7s7U00M3zzzy0z0Q0030TUS001k7tzzs3y0k00A1y1w007003zzUDs3U00k7s7k00S007zz0zkD0030TUTU01w00Tzw3z0y0EC3y1zUM7s03zzsTyDy3VsDwDzz0Tk0Tzzzzzzzzzzzzzzw3zzzzzzzzzzzzzzzzyDUDzzzzzzzzzzzzzzzzk00zzzzzzzzzzzzzzzzz007zzzzzzzzzzzzzzzzw00Tzzzzzzzzzzzzzzzzk03zzzzzzzzzzzzzzzzzk0zzzzzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Damage1:="|<>*15$143.znzzzzzzzzzzzzzzzzzzzzzzw00zzzzzzzzzzzzzzzzzzzzzk00TzzzzzzzzzzzzzzzzzzzzU00Tzzzzzzzzzzzzzzzzzzzz000Dzzzzzzzzzzzzzzzzzzzy000Dzzzzzzzzzzzzzzzzzzzw000Tzzzzzzzzzzzzzzzzzzzs3w0Tzzzzzzzzzzzzzzzzzzzk7w0zsC7UsTUzzUsTw63zU3zUDw0z08710C0Tw0UTU07w03z0Tw1w00A0080zk00y007k03y0zw3k00M0000z001s00D003w1zs7000k0000w003U00Q007s3zkC001U0001s007000s1U7k7zUM0U3080E3U20A0k1U7UDUDz0k7k60w1k70T0M3s30T0T0Ty1UTUA1s3kC1y0kDk6000y0zs30z0M3kDUQ3w1UTUA003w1zU61y0k7UT0s7s30z0M007s3y0Q1w1UD0y1k7k60w0k00zk7k1s0U30S1w3U20C001UDzzk003s0070w3s7U00Q003UDnzU00Dk00C1s7kD000w007003z000zk00Q3kDUT001w00D003y003zk00s7UT0z003w00z007w00Tzk21kTUy1z087w31z00Tw07zzwS7kz3y7zlsTzy3zU1zzzzzzzzzzzzzzzzzzzs7zzzzzzzzzzzzzzzzzzzzyDkDzzzzzzzzzzzzzzzzzzzzs60Tzzzzzzzzzzzzzzzzzzzzk01zzzzzzzzzzzzzzzzzzzzzU07zzzzzzzzzzzzzzzzzzzzzU0TzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzsTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
Strong:="|<>*15$123.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzzs0DzDzzzzzzzzzzzzzzzy00zUTzzzzzzzzzzzzzzzU03w3zzzzzzzzzzzzzzzs00DUTzzzzzzzzzzzzzzz003w3zzzzzzzzzzzzzzzk3UTUTzzzzzzzzzzzzzzy0y7w3zzzzzzzzzzzzzzzk7zw00sC3y0Tw71zzUkTy0zzU0700D00zU03zk03zs0zw00E01k03s00Dw00Dz00TU0200A00D000z001zw00w00E01001s007k00DzU03U0600M007000S001zz00DUTk3q0S0s0k3U60Dzy00w3y0zk7s30T0Q1w1zzy07UTk7y1z0M3w3UTUDzzy0w3y0zkDs30TUQ3w1zwTs7UTk7y1z0M3w3UTUDz1z0w3y0zk7s70TUQ1s1zk7k7UTk7y0S0s3w3k00Dy080w0D0zs007UTUS001zk00DU1s7z001w3w3s00Dz003y070zw00DUTUTU01zw00Tk1s7zk03w3w3y00Tzk0Dz0D1zz01zUzUTs63zzU7zz3wDzy0zyDy7zzkTzzzzzzzzzzzzzzzzzzw3zzzzzzzzzzzzzzzzzwTUTzzzzzzzzzzzzzzzzz0k3zzzzzzzzzzzzzzzzzs00zzzzzzzzzzzzzzzzzz00Dzzzzzzzzzzzzzzzzzw03zzzzzzzzzzzzzzzzzzk0zzzzzzzzzzzzzzzzzzzkzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Slayer:="|<>*17$128.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz1zzzzzzzzzzzzzzzzzw3zkDzzzzzzzzzzzzzzzzw07s3zzzzzzzzzzzzzzzzy00y0zzzzzzzzzzzzzzzzz007UDzzzzzzzzzzzzzzzzU00s3zzzzzzzzzzzzzzzzs00S0zzzzzzzzzzzzzzzzy0s7UDzzzzzzzzzzzzzzzz0TXs3zzzzzzzzzzzzzzzzk7zy0zy3VsTy7y0TsC3zzw1zzUDy0EA3z0y01y00TzzU3zs3z0030zkD00D007zzs03y0zU00k7s3U01k01zzz00DUDk00A0y0k00Q00Tzzk01s3w003UD0Q0k300Dzzz00C0y0M0s1k60S0k3rzzzw01UDUDUD0M3UDUA1zzzzzs0M3s7s3s20s0030Tzzzzzk60y1y0y00S001k7zzzz7y1UDUTUDk07U00Q1zzzzUzUM3s3s3y03s00T0Tzzzk7k70y080zU0y0zzk7zzzw001k1k00Dw0Tk7tw1zzzz000w0Q003z07w00DUTzzzs00D07U00zs1zU01s7zzzz007k1w00Dy0zw00S1zzzzs07y0TU43zUDzU0DUzzzzzU7zsDy7Vzs7zy07wDzzzzzzzzzzzzzw1zzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzzUDzzzzzzzzzzzzzzzzzzzs7zzzzzzzzzzzzzzzzzzzy1zzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
PressIt:="|<>*29$136.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU07zzzzzzzzzzzzzzsDzzzy007zzzzzzzzzzzzzzUT0zzk00Dzzzzzzzzzzzzzw1w3zz000Tzzzzzzzzzzzzzk7kDzw000zzzzzzzzzzzzzz0T0zzk003zzzzzzzzzzzzzw1w3zz0TUDzzzzzzzzzzzzzk7kDzw1z0Q71z0DzU3zU3zz0M01zk7w1k03k0Ds07s07zw1U07z0Tk600C00T00D00Dzk600Dw1z0M00k00w00w00zz0M00zk7s1U06003k07k07zw1U03z000C00M1U71yz1yzzk600Tw000s1v0D0Q3zw3zzz0T0zzk007UDw1w1k0Tk0Tzw1w3zz000y0zk00700T00Tzk7kDzw007s3z000y00y00zz0T0zzk00zUDw003w03w03zw1w3zz00Ty0zk00zs07s07zk7kDzw1zzs3z0Tzzy0Ty0Tz0T0zzk7zzUDy0zDky1ky1zw1w0Dz0Tzy0zs00S006007zk7k0zw1zzs3zk00s00s00zz0TU1zk7zzUDzU03U03U03zw1y07zUTzz0zz00T00T00Tzs7w0zy3zzw7zy03z07z07zzUzw3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Damage:="|<>*15$146.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzbzzzzzzzzzzzzzzzzzzzzzzz00DzzzzzzzzzzzzzzzzzzzzzU00zzzzzzzzzzzzzzzzzzzzzs007zzzzzzzzzzzzzzzzzzzzy000TzzzzzzzzzzzzzzzzzzzzU003zzzzzzzzzzzzzzzzzzzzs000zzzzzzzzzzzzzzzzzzzzy0z07zzzzzzzzzzzzzzzzzzzzUDs1zkQD1kz1zz1kzsA7z07zs3z0Dk21kE3U7z087s01z00zy0zs3s00M00E1zU01w00DU07zUDz0w0060000Dk00S003k00zs3zkC001U0001s007000s00Dy0zw3U00M0000S001k00C0M1zUDz0k1060E0U7040M1U30D0Ts3zkA1w1UD0Q1k7k60y0k7k7y0zw30z0M3k7UQ3w1UTUA001zUDy0kDk60w3s70z0M7s3000zs3z0A3w1UD0y1kDk61y0k00Dy0zU70T0M3kDUQ1w1UD0A00DzUDU3k1060w3s7040Q0030Tzzw000y001kD0y1s007000s3wzz000TU00Q3kDUS001s00C007zk00Dw0070w3s7k00T003k00zw007zU01kD0y1y007s01y00Dz007zw0UQ7sDUTk21z0kTk07zs0DzzswDVy7wDzXkzzw7z03zzzzzzzzzzzzzzzzzzzy1zzzzzzzzzzzzzzzzzzzzzwTUTzzzzzzzzzzzzzzzzzzzzy1U7zzzzzzzzzzzzzzzzzzzzzU03zzzzzzzzzzzzzzzzzzzzzs01zzzzzzzzzzzzzzzzzzzzzz00zzzzzzzzzzzzzzzzzzzzzzs0Tzzzzzzzzzzzzzzzzzzzzzzkzzzzzs"
Cooldown:="|<>*23$180.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzkTzzsTzzzzzzzzzzzzzzw7zzzzzzzzkDzzkDzzzzzzzzzzzzzzU0zzzzzzzzUDzzkDzzzzzzzzzzzzzy00DzzzzzzzUDzzkDzzzzzzzzzzzzzw007zzzzzzzUDzzkDzzzzzzzzzzzzzs003zzzzzzzUDzzkDzzzzzzzzzzzzzk007zzzzzzzUDzzkDzzzzzzzzzzzzzU007zzzzzzzUDzzkDzzzzzzzzzzzzz07wDzzzzzzzUDzzkDzzzzzzzzzzzzz0DyTy0Tzs1zUDzUkDy0TsTlz7kQ7zz0Tzzs07zU0TUDy00Ds07kDUy1k01zy0zzzk03z00DUDw00Dk03kD0w1U00zy0zzzU01y007UDs00DU01kD0Q1U00Ty1zzz001w007UDs00D001k60Q1U00Ty1zzz000w003UDk00D000s6083U00Dy1zzy0S0s1s3UDk20C0S0s2083U30Dy1zzy0z0M3w1UDUDUC0z0M0007UDUDy0zzy1z0M7w1UDUDUC1z0Q0007UDkDy0zzy1z0M7w1UDUTkC1z0Q000DUDkDz0Tzy1z0M7w1UDUDUC1z0S000DUDkDz0DyC0z0s3w3UDUDUC0z0y000DUDkDzU3sC0Q0s1k3UDk20C0Q0y040TUDkDzU007000w003k1k00D000z0A0TUDkDzk007001w007k1s00D001z0C0zUDkDzs007U01y007k1s00DU01zUC0zUDkDzw007k03z00Dk1w00Dk03zUS0zUDkDzz00Ts07zU0Ts1y00Ds07zkT1zkTkDzzk1zy0Tzs1zy3zUsTy0TzszXzkTsTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Champion:="|<>*22$209.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzVzzzzzzzzzzzzzzz3zzzzzzzzzzzzzzzwDy3zzzzzzzzzzzzzzw7zzzzzzzzzzzzzzy03s3zzzzzzzzzzzzzzk7zzzzzzzzzzzzzzk01k7zzzzzzzzzzzzzzUDzzzzzzzzzzzzzz001UDzzzzzzzzzzzzzz0Tzzzzzzzzzzzzzw0030Tzzzzzzzzzzzzzz1zzzzzzzzzzzzzzk0060zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz000A1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0Tks3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzs1znk67zz1kw73w7y31zkTw0zsC3zw0Tzzzk7zzU83zs10s81k7w00zUTU0Tk01zU0Tzzz0Tzz001zU01U0107k00y0y00T001y00Tzzy0zzy003y00300007U00w1s00S003w00zzzw3zzw003s0060000D000s3U00w003s03zzzs7zzs003k00A0000C001k7000s003kTjzzzkDzzk1U70A0M1U20Q0M1UA0w1k1U7UTzzzzUTzzU7UC0y0k7UC0s3s30M3w3UDUD03zzzz0Tzz0TUQ3w1UD0S1k7s60kDs30TUS00zzzy0zzy0z0s7s30S0w3UDkA1UTk60z0y00zzzy0zzw1y1kDk60w1s70TUM30zUA1y1y01zzzw0zss3w3UDUA1s3kC0S0k60z0s3w3z01zzzw0T1k7s7040M3k7UQ003UA0s1k7s7zk3zzzs001UDkD000k7UD0s0070Q003UDkD3s7zzzs0030TUS001UD0S1k00S0s00D0TUQ00Dzzzs0060z0y0030S0w3U00w1s00S0z0s00zzzzs00A1y1y0060w1s7003s3s01w1y1k01zzzzw01w3w3y0EC1s7kC00Ts7s07w3w3k07zzzzy0DsDwDz1kw7sDkw1rzkTw0zsDwDs0zzzzzzzzzzzzzzzzzzzzs3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzsDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"
Dodge:="|<>*32$119.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz3zzzzzzzzzzzzzzzzzzw3zzzzzzzzw00zzzzzzzs7zzzzzzzzk00TzzzzzzkDzzzzzzzzU00TzzzzzzUTzzzzzzzz000Dzzzzzz0zzzzzzzzy000Tzzzzzy1zzzzzzzzw000Tzzzzzw3zzzzzzzzs3w0Tzzzzzs7zzzzzzzzk7w0zs1zzUkDy71zk3zzUDy0z00zw00Tk23y01zz0Tw1w00zk00z003s01zy0zw3k00z001w007U01zw1zs7001y003k00C003zs3zkC001s007U00Q0k7zk7zUM1s3k20C0Q0k3k7zUDz0k7s70T0Q1w1UDUDz0Ty1UTk60y0s7s3000Ty0zs30zUA3y1kDk6001zw1zU61z0M3s3UTUA003zs3y0Q1y1k7k70S0M00Tzk7U0s1k3k20D000k7zzzU003s007U00S001k7tzz000Dk00TU00y003U01zy000zk00z001w007U01zw003zk03z003w00DU03zw00Tzk0Dz007y00TU0Dzs03zzs1zzUsTzy0zU0zzzzzzzzzzzzzzzw1zzzzzzzzzzzzzzzzz7k7zzzzzzzzzzzzzzzzw00Dzzzzzzzzzzzzzzzzs00zzzzzzzzzzzzzzzzzk01zzzzzzzzzzzzzzzzzU07zzzzzzzzzzzzzzzzzU0Tzzzzzzzzzzzzzzzzzk3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
UncommonLoot:="|<>*29$199.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzsDzkTzzzzzzzzzzzzzzzzzzzzzzzzzzzzw3zk7zzzzzzzzzzzzzzzzzzzzzzzzzzzzw1zs3zzzzzzzzzzzzzzzzzzzzzzzzzzzzy0zw1zzzzzzzzzzzzzzzzzzzzzzzzzzzzz0Ty0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzUDz0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzk7zUDzzzzzzzzzzzzzzzzzzzzzzzzzzzzs3zk71kTzs3zw0zsC7sDw73w7zw0zsC3zw1zs3U03zk0Ts07w40s1y20Q0zs07w00Ty0zw1U00zk07s01w0080y0040Ts01w007z0Ty0k00Dk01s00S0000D00007s00S001zUDz0M007k00s00D00007U0003s00D000zk7zUA001s00w003U0001k0000w003U00Ds3zk60A0s0kw0w1k3040s1U20Q0w1k1U7w1zs30T0Q1yy0z0M3k70Q1s3UC0z0M3s3z0zw1UDkC0zz0zUA1s3kC0w1s70zUA1y1zUTy1k7s70zzUTk60w1s70S0w3UTk60z0zk7y0s3w3UDzkDs30S0w3UD0S1kDs30TUTs3z0Q1y1k7vs3w1UD0S1k7UD0s3w1UDkDy0S0S0z0s0kw0s1k7UD0s3k7UQ0s1k7s7z000D0TUS00D000s3k7UQ1s3kD000s3w3zk00DUDkD003U00w1s3kC0w1s7U00w1y1zw007k7s7k01s00S0w1s70S0w3s00S0z0zz007s3w3w01y00T0S1w3UD0y1y00T0TUTzk0Dy1y1z01zU0TkD0y1s7UT0zU0TkDkDzw0Dz1zVzs3zw0zsDkTVw7sDkzw0zsDwDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
slayer2 := "|<>*17$128.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz1zzzzzzzzzzzzzzzzzw3zkDzzzzzzzzzzzzzzzzw07s3zzzzzzzzzzzzzzzzy00y0zzzzzzzzzzzzzzzzz007UDzzzzzzzzzzzzzzzzU00s3zzzzzzzzzzzzzzzzs00S0zzzzzzzzzzzzzzzzy0s7UDzzzzzzzzzzzzzzzz0TXs3zzzzzzzzzzzzzzzzk7zy0zy3VsTy7y0TsC3zzw1zzUDy0EA3z0y01y00TzzU3zs3z0030zkD00D007zzs03y0zU00k7s3U01k01zzz00DUDk00A0y0k00Q00Tzzk01s3w003UD0Q0k300Dzzz00C0y0M0s1k60S0k3rzzzw01UDUDUD0M3UDUA1zzzzzs0M3s7s3s20s0030Tzzzzzk60y1y0y00S001k7zzzz7y1UDUTUDk07U00Q1zzzzUzUM3s3s3y03s00T0Tzzzk7k70y080zU0y0zzk7zzzw001k1k00Dw0Tk7tw1zzzz000w0Q003z07w00DUTzzzs00D07U00zs1zU01s7zzzz007k1w00Dy0zw00S1zzzzs07y0TU43zUDzU0DUzzzzzU7zsDy7Vzs7zy07wDzzzzzzzzzzzzzw1zzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzzUDzzzzzzzzzzzzzzzzzzzs7zzzzzzzzzzzzzzzzzzzy1zzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
CommonLoot:="|<>*35$160.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzzzzzzzzzzzz01zzzzzzzzzzzzzzzzzzzzzzzzk01zzzzzzzzzzzzzzzzzzzzzzzy003zzzzzzzzzzzzzzzzzzzzzzzk00Dzzzzzzzzzzzzzzzzzzzzzzy000zzzzzzzzzzzzzzzzzzzzzzzk003zzzzzzzzzzzzzzzzzzzzzzy0DsTzzzzzzzzzzzzzzzzzzzzzzs1znzk3zUsTUzkQDkTzk3zUsDzzUDzzw03y20Q0z10C0Tw03y00Dzw1zzzU07k00U3s00E1zU07k00Tzk7zzw00D00007U0003w00D000zz0zzzU00w0000S0000DU00w003zw3zzy001k0000s0000S001k007zkDzzk3k70A0E3U6081k3k7060Tz0zzz0TUA1s3UC0w1k70TUA1w1zw1zzw3y0k7UD0s3k7UQ3y0k7s7zk7zzkDs30S0w3UD0S1kDs30TUTzUDzz0zUA1s3kC0w1s70zUA1y1zy0TwQ1y0k7UD0s3k7UQ1y0k7s7zw0T1k3U70S0w3UD0S1k3U70TUTzk003U00Q1s3kC0w1s7U00Q1y1zzU00C003k7UD0s3k7US003k7s7zz000w00D0S0w3UD0S1w00D0TUTzy003s01w1s7kC0w3s7s01w1y1zzy00zk0Ds7UT0w3kDUTk0Ds7s7zzy0Dzk3zUz1y7kTUz3zk3zUzkzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Speed:="|<>*21$114.zzzzzzzzzzzzzzzzzVzzy0zzzzzzzzzzzzzz0zzs0Dzzzzzzzzzzzzz0zzk07zzzzzzzzzzzzz0zzU03zzzzzzzzzzzzz0zz001zzzzzzzzzzzzz0zz003zzzzzzzzzzzzz0zy0Q3zzzzzzzzzzzzz0zy0y7zzzzzzzzzzzzz0zy0zzsA7zy0Dzk1zy30zy0zzs01zs07z00zs00zz07zk00zk03y00Tk00zz00Tk00TU01w00DU00zzU07k00D001s00D000zzU03k00D0A0s1U7000zzs01k1U60S0k3k7080zzy00k7k60y0k7k60y0zzzk0k7s6000k0060y0zzzy0k7s6001k00C1z0zzXz0k7s6001k00C0y0zz1z0k3k6007k00y0y0zy0y0k00C0zzk7zz0A0zy000s00D0Tbs3wz000zy001s00T003s00TU00zz003s00TU01w00DU00zzU03s01zk01y00Dk00zzk0DsA3zs03z00Tw10zzw0zsDzzy07zk0zz7VzzzzzsDzzzzzzzzzzzzzzzzzsDzzzzzzzzzzzzzzzzzsDzzzzzzzzzzzzzzzzzsDzzzzzzzzzzzzzzzzzsDzzzzzzzzzzzzzzzzzsDzzzzzzzzzzzzzzzzzsDzzzzzzzzzzzzzzzzzwTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"

Global CardImageVariables := Map(
    "Cooldown", Cooldown, "Cooldown1", Cooldown1,
    "Harvest", Harvest,
    "Range", Range,
    "Damage", Damage, "Damage1", Damage1,
    "Strong", Strong,
    "Slayer", Slayer, "slayer2", slayer2,
    "PressIt", PressIt,
    "Champion", Champion,
    "Dodge", Dodge,
    "UncommonLoot", UncommonLoot,
    "CommonLoot", CommonLoot,
    "Speed", Speed
    ; Add any other card image variables here if they are defined globally
)
AntRaids() {
    

    

    
    MainCards()
    Sleep(2000)
    ; Starts TinyTask
    Send("{F8 down}") ; if tinytask is still playing it will turn it off and on
    Sleep(100)
    Send("{F8 up}")
    Sleep(500)
    
    ; While TinyTask is running, the script will search for the alt cards
    loop {
        Sleep(900)
        status()
        Sleep(500)
        AltCards()
      
    }


    
}


webhook() {
 
    Run(A_ScriptDir . "\..\..\..\Webhook.ahk")
}

AltCards() {
    priorityList := []
    processedNames := Map() ; To ensure unique names from the priority file are processed
    try {
        priorityFile := FileOpen(A_ScriptDir "\..\..\..\Settings\MangoSettings\CardPriority.txt", "r")
        if (priorityFile) {
            while !priorityFile.AtEOF {
                line := Trim(priorityFile.ReadLine())
                ; Only add if it's a non-empty line and not already processed
                if (line != "" && !processedNames.Has(line)) {
                    priorityList.Push(line)
                    processedNames.Set(line, true) ; Mark as processed
                }
            }
            priorityFile.Close()
        }
    } catch {
        MsgBox("Error reading CardPriority.txt. Check file path and permissions.")
        status() ; Call status if priority file is crucial
        return
    }

    if (priorityList.Length == 0) {
        ; CardPriority.txt might be empty or only contained whitespace/duplicates that were removed.
        status() ; Call status if no valid priorities are set
        return
    }
    
    ; Define screen coordinates for card searching
    global X1 := 300, Y1 := 52, X2 := 678 + 950, Y2 := 52 + 642
    local FoundX, FoundY ; Variables to store coordinates from FindText

    for cardNameFromFile in priorityList { ; cardNameFromFile is a string like "Cooldown", "Cooldown1", etc.
        
        if (CardImageVariables.Has(cardNameFromFile)) {
            imageStringToSearch := CardImageVariables.Get(cardNameFromFile)
            
            ; Call FindText with the correct signature and the actual image string variable
            foundItemsArray := FindText(&FoundX, &FoundY, X1, Y1, X2, Y2, 0, 0, imageStringToSearch)
            
            if (IsObject(foundItemsArray) && foundItemsArray.Length > 0) {
                ChangeLogs("Found card: " cardNameFromFile)
                ; Card found, click the first match. FindText stores first match coords in &FoundX, &FoundY.
                BetterClick(FoundX, FoundY)
                return ; Exit after clicking the highest priority card found
            }
        } else {
            ; Optional: Log or notify if a card name in CardPriority.txt is not in our CardImageVariables map
            ; OutputDebug("Warning: Card name '" cardNameFromFile "' from CardPriority.txt is not a recognized card image variable.")
        }
    }
    
    ; If the loop completes, no card from the priority list was found on screen.
    status() 
}
status() {
    ; Use screen dimensions instead of custom coordinates
    X1 := 0
    Y1 := 0
    X2 := A_ScreenWidth
    Y2 := A_ScreenHeight

    
    Win:="|<>*112$176.000000000000000000000000000000000001zU0000000000000000000000D000wzy0000000000000000000000Dw00zzzU0007U0000000000000000DzU0TzVw000Dy00000000000000007zw0DzkD0007zs0000000000000001wD03kw1k001zy0000000000000000w1s1s30Q000w7k000000000000000D0S0S0k7000D0w0000000000000003k3U7UA1k003U70000000000000000w0w3k30w000s1k07k000E3U0A000070D0w0wz1zwS0TUDzU7zznz0Tk0001s1sS0TzVzzzU7wDzy3zzzzsDz0000S0S7U7ztzzzs1zjzztzzzzy7zs0003k3nk3wTzUTs01zw1zT7kz3lsT0000w0ww0w3zU0w00Dw07z0k3Uyw3k0007U7y0T0TU07001w00Tk00k7j0S0001s1zU7k7k00k00S003w00A0zU7U000D0Dk3w1s00A007000z0030Ds1s0003k3w0z0S003001k007k00k1y0w0000S0T0Tk7000k00s000w00S0T0D00007U7U7w1k00S00S0C0D06Dk3k3U0000w0s3z0M0yDs1z0Dk3k7zw0M1s0000D0A0zk60Tzy0Tk3y0w1zzU60S00001s30Sw1U7zzU7w1zU70Txs00D00000S007j0M1zys1z0Ts1k7UD003k00003k03nk60Tzy0Tk3y0Q1s3s01s00000w00ww1U7tzU7w0z0D0Q0S00S000007U0SD0M0MDs1z07U3k703k0D000001s07Xk7001y03s000w1k0w03k00000D03kw1k00Dk0S000T0Q07U0s000003k0wD0S003w03k007k701w0S000000S0S3k7k00z00y003w1k0D07U000007U7Uw1y00Ts0Dk01z0S03k3k000000w3kD0Tk0Dz07y00zk700w0w000000DVw3sDz0Dnw1zs0zy3k0S0S0000001zy0TzrzzsTzwzzzbzw07U7U000000Dz03zszzw3zz7zzlzy01s3k0000001zU0Tw3zw0DzUTzk7z00w0w00000003U01s07s00DU0zU0S00D0D000000000000000000000000007U7U00000000000000000000000001s1s00000000000000000000000000S0w000000000000000000000000007UD000000000000000000000000001w7U00000000000000000000000000Dns000000000000000000000000001zw000000000000000000000000000Dy0000000000000000000000000000z0000000000000000000000000000000000000000000000000000000000000000U"
    Failed:="|<>*152$133.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwzlzzzzzzzyTzzzzzzzzzzs7UTzzzzzzw3zzzU003zzzw1k7zzzzzzy0zzzU000zzzy0s3zzzzzzz0Tzzk000Tzzz0Q1zzzzzzzUDzzs000DzzzUC0zzzzzzzk7zzw0007zzzkD0Tzzzzzzs3zzy0003zzzzzUDzzzzzzw1zzz0003zzzzzk7zzzzzzy0zzzUDzzzzzzzs3zzzzzzz0Tzzk7zzzzzzzw1zz0TzzzUDzzs3zzz0M7US0zy03zy0k7zzw1zzz001k70Tw00Ty003zzy007y000s3UDw007y001zzz000z000Q1k7w003y000zzzU00T000C0s3y000y000Tzzk00D00070Q1y060S000Dzzs007U203UC0z0DUD0007zzw003k7k1k70T0Dk7U7U3zzy001k3w0s3UDU7s3k7s1zzz003s3y0Q1k7k001k7y0zzzUDzw1z0C0s3s000s3z0Tzzk7zy0zU70Q1w000w0z0Dzzs3zz0Dk3UC0y0Tzz0TU7zzw1zzk3U1k70TUDzzU7U3zzy0zzs000s3U1k3zTk001zzz0Tzy000Q1k0s007w000zzzUDzz000C0s0C001y000Tzzk7zzk0070Q07U00zU00Dzzs3zzw003UD03k00Ts007zzw3zzz043kDk3y00Dz087zzz1zzzwD3w7y1zk0TzsS7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"
    
    if FindText(&X, &Y, 454-150000, 174-150000, 454+150000, 174+150000, 0, 0, Failed) {
        Send("{F8 down}") 
        Sleep(100)
        Send("{F8 up}")
        TallyStatus("Failed")
        webhook()
        Sleep(2000)
        

        BetterClick(877, 850) 
        Sleep(5000)
        AntRaids()
        
        return
    } else if FindText(&X, &Y, 477-150000, 178-150000, 477+150000, 178+150000, 0, 0, Win) {
        Send("{F8 down}") 
        Sleep(100)
        Send("{F8 up}")
        TallyStatus("Victory")
        webhook()
        Sleep(2000)
        
        BetterClick(877, 850) 
        Sleep(5000)
        AntRaids()
        return
    } 
    return
}

F2::QUITAPP()
AntRaids()
QUITAPP() {
    
    sessionui := WinExist("Window")
    if (sessionui) {
       WinClose("Window")
    }
    ExitApp
}

ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, ImagePath, Tolerance := 30) {
    try {
        ; Store the previous CoordMode and set to Screen
        prevCoordMode := A_CoordModePixel
        CoordMode "Pixel", "Screen"


        ; Perform the image search with specified tolerance
        result := ImageSearch(&FoundX, &FoundY, X1, Y1, X2, Y2, "*" Tolerance " " ImagePath)

        ; Restore previous CoordMode if needed
        if (prevCoordMode != "Screen")
            CoordMode "Pixel", prevCoordMode

        ; Return and log results
        if (result) {
            return true
        } else {
            return false
        }
    } catch as e {
        MsgBox("Error in ImageSearchWrapper: " e.Message)
        return false
    }
}

TallyStatus(status) {

    winsFilePath := A_ScriptDir . "\..\..\..\Settings\MangoSettings\session\stats\wins.txt"
    totalWinsFilePath := A_ScriptDir . "\..\..\..\Settings\MangoSettings\session\stats\TotalWins.txt"
    lossesFilePath := A_ScriptDir . "\..\..\..\Settings\MangoSettings\session\stats\losses.txt"

    try {
        if status == "Failed" {
            ; Handle losses
            currentLosses := 0
            if FileExist(lossesFilePath) {
                lossFile := FileOpen(lossesFilePath, "r")
                if !lossFile.AtEOF
                    currentLosses := Integer(lossFile.ReadLine())
                lossFile.Close()
            }
            lossFile := FileOpen(lossesFilePath, "w")
            lossFile.Write(currentLosses + 1)
            lossFile.Close()
        } else if status == "Victory" {
            ; Handle wins
            currentWins := 0
            if FileExist(winsFilePath) {
                winsFile := FileOpen(winsFilePath, "r")
                if !winsFile.AtEOF
                    currentWins := Integer(winsFile.ReadLine())
                winsFile.Close()
            }
            winsFile := FileOpen(winsFilePath, "w")
            winsFile.Write(currentWins + 1)
            winsFile.Close()

            ; Handle total wins
            totalCurrentWins := 0
            if FileExist(totalWinsFilePath) {
                totalWinsFile := FileOpen(totalWinsFilePath, "r")
                if !totalWinsFile.AtEOF
                    totalCurrentWins := Integer(totalWinsFile.ReadLine())
                totalWinsFile.Close()
            }
            totalWinsFile := FileOpen(totalWinsFilePath, "w")
            totalWinsFile.Write(totalCurrentWins + 1)
            totalWinsFile.Close()
        }
    } catch as e {
        MsgBox("Error updating " status " stats: " e.Message)
    }
    return
}

ChangeLogs(msg) {

    try {
        ; Correct the file path
        logFilePath := A_ScriptDir . "\..\..\..\Settings\MangoSettings\Session\LastLog.txt"
        
        ; Ensure the directory exists
        SplitPath(logFilePath, , &dir)
        if !FileExist(dir) {
            MsgBox("Directory does not exist. Attempting to create: " . dir) ; Debugging
            if !DirCreate(dir) {
                MsgBox("Failed to create directory: " . dir) ; Debugging
                return
            }
        }

        ; Open the file in write mode
        LogFile := FileOpen(logFilePath, "w")
        if (LogFile) {
            LogFile.WriteLine(msg) ; Overwrite the log file with the new message
            LogFile.Close()
        } else {
            MsgBox("Error: Unable to open log file at " . logFilePath)
        }
    } catch as e {
        MsgBox("Error in ChangeLogs: " . e.Message)
    }
}
