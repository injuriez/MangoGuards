#Requires AutoHotkey v2.0
#Include ../../../Modules.ahk
#Include ../../../FindText.ahk
#Include ../UnitPlacement/Start/Namek/script.ahk
#Include ../UnitPlacement/Middle/Namek/script.ahk
#Include ../UnitPlacement/Start/Spirit/script.ahk
#Include ../UnitPlacement/End/Namek/script.ahk
#Include ../UnitPlacement/Middle/Spirits/script.ahk

speedwagonoffsetx := 0
speedwagonoffsety := 0
PlacementError := "|<>*144$87.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUzzzzzzzzzzzzzs7zzzzzzzzzzzzz0zzzzzzzzzzzzzs7zzzzzzzzzzzzz0zzzzzzzzzzzzzs7zzzzzzzzzzzzz0zzzzzzzzzzzzzs7zzzzzzzyDz30z0zw63z0Dy0Dk03s7y00TU0z00y00D0zU03s03k03k00s7s00S00Q00S0070z003k03UA1k30M7k70Q0ks3kC0w30y1w3UTz0y1kDkM7kDUQ3zs00C1y30y1w3UTz003kDUM7kDUQ3zs00S0s30y0s3UDD0zzk00M3s00S00s3zy007U7003k03U07k01w0w00T00Q00S00TU7k03w03k03k87y0z0ETk0z00S1zzs7y77zUTy07kDzzzzzzzzzzzzy1zzzzzzzzzzzzzkDzzzzzzzzzzzzy1zzzzzzzzzzzzzkDzzzzzzzzzzzzy1zzzzzzzzzzzzzsTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

positions := {
    Namek: {
        Start: {
            FindText: "|<>*38$140.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600000000000000000000000s00000000000000000000007k0000000000000000000001z0000000000000000000000Dy0000000000000000000001zw000000000000000000000Dzk000000000000000000003zzU00000000000000000000Tzy000000000000000000003zzw00000000000000000000Tzzk00000000000000000007zzzU0000000000000000000zzzy00000000000000000007zzzw0000000000000000000zzzzs000000000000000000DzzzzU000000000000000001zzTzz000000000000000000Dzzzzw000000000000000000zzjzzs000000000000000001zzzzzU00000000000000000Dzzzzz000000000000000003zzzzzw00000000000000000Tzzzzzs00000000000000003zzzyzzk0000000000000000Tzzzrzz00000000000000003zzzwzzy0000000000000000TzzzXzzw0000000000000007zzzyTzzk000000000000000zzzznzzzU000000000000007zzzyTzzz000000000000000zzjy7zzzw000000000000007zxzzzzzzs00000000000000zzjzzzzzzU0000000000000Dztzzzzzzy00000000000001zzDzzzzzzk0000000000000Dzlzzzzzzz00000000000001zyDzzzgTzw0000000000000Dzlzzzz2zzk0000000000001zSTzzzw7zy0000000000000TvXzzzzUzzs0000000000003zwTzzzy3zzU000000000000TzXzzDzkTzw0000000000003zsTzkzy7zzk000000000000Tr3zS3ztzzz0000000000007ysTzkDz7zzw000000000000zq7zw1zvzzzU000000000007zkzzUTzzzzw000000000000zi7zw3zzzzzU00000000000DxUzr0Tzzzzs000000000001zw7zs3zzzzz800000000000DzUzz0Tzzzzy000000000001zQ7zk3zzzzzk00000000000Tv1zi0zzzzzy000000000003zsDxk7zzzzzk00000000000Tz1zw0zzzzzy000000000003ysDwU7zzzzzU00000000000zq3zg0zznzzk000000000007ykTtUDzyDzs000000000000zy3z81zzkzs0000000000007xkTv0Dzw3w0000000000001zg7zM1zrUC0000000000000DzUzn0Dzs00008",
            cords: "&X, &Y, 1715-150000, 1040-150000, 1715+150000, 1040+150000, 0, 0",
            second: {
                Text: "|<>*39$53.00000000000000000000000000000000000000000000000000000000000000000000000U00000001s00000001w00000001z00000003zU0000003zs0000003zw0000003zz0000007zzU000007zzs000007zzw000007zzz00000DzTzU0000Dw7zs0000Ds3zw0000Dy3zz0000Ty3zzU000Dy3zzk0007y1zzw0003y1zzy0003z3zzzU007zDzzz0007zzzDy0007zzw3w0007zzs3s0007zzz1k0007zzz1U000Dzzz10000Dzzz00000DzvzU0000DzvzU0000DzvzU0000DznzU0000Tznz00000Tvny00000TzXw00000Tzbs00000Tzbk00000Tr7U00000zz7000000zz6000000zy4000000zi0000000zi0000001zgE"
            }
        },
        Middle: {
            FindText: "|<>*36$198.yzk0000000E00000000000003U0zzw000wTU0000007800000000000000s0Tzz000sz000000TzU00000000000000C03zzs00ly000003zzy000000000000001U1zzw00ly000007zzz000000000000000M0TzzU00z00000DzzzU000000000000007E7zzs01y00000Tzzzk000000000000001k1zzy00400000zzzzs000000000000000R0Tzz00000001zzzzs0000000000000007s7zzk0S00003zzzzk0000000000000000y0zzy0T00007zzzzU0000000000000000SUDzz0T0000Dzzzz00000000000000000203zz0D0000Tzzzy00000000000000000000Tz040000zw3zw00000000000000000000Dz000001zzzzs000000000000000000001z000003zzzzk0000000000000000000007000007zzzz0000000000000000000000100000Dzzzz0000000000000000000000000000TzzzzU000000000000000000000000000zzzzzk000000000000000000000000001zzzzzs000000000000000000000E00003zzzzzw000000000000000000000000007zzzzzi00000000000000000000000000Dzzzzzz00000000000000000000000000TzzzbzxU0000000000000000000000000zzzz3zy00000000000000000000000001zzzy0zzU0000000000000000000000007zzzw0Tzk000000000000000000000000Dzzzw07zv000000000000000000000000Tzzzy03zxU00000000000000000000000zzzzz00zzk00000000000000000000001zzzzzU0Tzc00000000000000000000003zzzzzk0Dzq00000000000000000000007zzzzzw03zzU000000000000000000000Dzzzzzy01zyk000000000008000000000TzzyTzz00zzQ000000000000000000000zzzw7zxU0Dzy000000000000000000001zzzy3zyM07zv000000000000000000000zzzz0zzg03zxU00000000000000000U00TzzzUDzq00zzs00000000000000001U007zzzs3zxU0Tzg00000000000000000U003zzzw1zyk0Dzq00000000000000000U001zzzy0TzQ07zzU0000000000000001U000Tjzz0Dzy01zyk0000000000000003U000D7zzU3zzU0zz80000000000000003U00061zys1zzk0TzY0000000000000003U00000Tzw0zzs07zs0000000000000003000000Dzy0zzi03zw00000000000000000000003zvVzzz01zy00000000000000000000000zzntzxU0Tzc0000000000000000000000Tzvszzs0Dzo00000000000000000000007zhsTzg07zt00000000000000000000003zz07zz01zzU0000000000000000000001zxU3zxU0zzs0000000000000000000000Tzs1zyk0Tzg0000000000000000000000Dzw0zzg07zz00000000000000E00000007zq0Dzq03zxU0000000000000w00000001zz03zxU1zyk0000000000000700000000zzk1zyk0zzg0000000000000000000000TzM0TzM0Dzq00000000000000000000007zy0Dzy07zvU0000000000000000000003zv27zv03zxk0000000000000000000000zxW1zzk0zzs0000000000000000000000Tzz0zzM0Tzg0000000000000000000000Dzg0Dzi0Dzr00000000000000000000003zz07zz03zx00000000000000000000001zzU3zzU1zyk0000000000000000000000zyk0zzM0zzM0000000000000000000000Tzs0Tzg0Dzw0000000000000000000000Dzq07zr07zv00000000000000000000007zv03zzU3zxU0000000000000000000003zzk1zzk0zzE0000000000000000000001zzM0Tzs0TzU0000000000000000000000bzw0Dzq0Dzk00000000000000000000003zz03zz07zx00000000000000000000001zxU1zyk1zyk0000000000000000000000Tzk0Tzs0zzM0000000000000000000000Dzc0Dzy0Tzw00000000000000000000007zo07zz07zv00000000000000000000001zw01zzk3zxU0000000000000000000000zy00zzs1zys0000000000000000000000TzU0Dzi0Tzg00000000000000000000007zo07zv0Dzq00000000000000000000003zv03zxU7zvU0000000000000000000000zzU0zzM1zzk0000000000000000000000TzE0Tzg0zzs0000000000000000000000Dzc07zr0Tzg00000000000000000000003zu03zzU7zu00000000000000000000001zw01zys3zxU0000000000000000000000zy00Tzw1zys0000000000000000000000DzU0Dzq0zzw08000000000000000000007zk03zvUDzq0E07k000000000000000003zw01zzk7zvUkzzt000000000000000000zyE0zzw3zytzzzzU00000000000000000TzM0Dzy1zzTzzzzk000000000000000007zy07zzUzzzzzzzs000000000000000003zz01zzsDzzzzzzw000000000000000001zxk0zzw7zzzzzzw000000000000000000Tzs0Tzz3zzzzzzs000000000000000000Dzi07zvlzzzzzzk0000000000000000007zz03zxxzzzzzzU0000000000000000001zzU1zzzzzzzzz00000000000000000000zzs0Tzzzzzzzy00000000000000000000Dzs0Dzzzzzzzy000000000000000000007zy07zzzzzzzk000000000000000000003zvU3zzzzzzw0000000000000000000000zzs0zzzzzzU0000000000000000000000TzQ1zzzzzw00000000000000000000000DzzbzzzzzU000000000000000000000007zzzzzzzzU000000000000000000000001zzzzzzzr0000000000000000000000000zzzzzzz20000000000000000000000000Tzzzzzw40000000000000000000000000Dzzzzzk400000000000000000000000007zzzzz0000000000000000000000000007zzzzw000000000000000000000000000Dzzzzk01U000000000000000000000000Dzzzz003U000000000000000000000000zzzzw007U000000000000000000000000zzzzk007k000000000000000000000000Dzzz000Ds0000000000000000000000007zzw000Tw0000000000000000000000003zzk000zw0000000000000000000000000zz0000zw0000000000000000000000000Tw0001zs0000000000000000000000000Dk0001zs0000000000000000000000000300001zk0000000000000000000000000000000zk0000000000000000000000000000000Tk0000000000000000000000000000000Tk0000000000000000000000000000000Tk0000000000000000000000000000000zk0000000000000000000000000000000zs0000000000000000000000000000001zs0000000000000000000000000000001zs0000000000000000000000000000000zk0000000000000000000000000000000zk0000000000000000000000000000000zk0000000000000000000000000000000zs0000000000000000000000000000001zU0000000000000000000000000000001y00003000000000000000000000000000w00007000000000000000000000000000w0000D000000000000000000000000000y0000T000000000000000000000000000C0000zU",

            cords: "&X, &Y, 1425-150000, 372-150000, 1425+150000, 372+150000, 0, 0",
            Second: {
                Text: "|<>*38$204.s0Trzz000DU0000000000201zzw0000000y0TVzs0001U0000000000000Dzy0000000zzzUzU0000U00000000001007zz0000000zzzUz00001y00000000001003zzk000000zzzUQ00001y00000000000E00zzy000000zzzU000003y000000000003U07zzU00000zzz0000003z000000000000Q0Tzzs00000zzz0000001y0000000000003s7zzy00000zzy0000001y0000000000000g0zzzU0000zzw0000000y000000000000030Nzzs0000zzw0000000600000000000000s07zy0000zzs0000007m00000000000000C07zzk000Tzk00000zzs000000000000003U1zzw000Czk00001zzz000000000000000s0zzz0004Tu00003zzzk00000000000000C0Dzzk000zs00007zzzs000000000000003k3zzw000zk0000Dzzzw000000000000000z0zzz000zk0000Tzzzy0000000000000007kDzzk00Tw0000zzzzw0000000000000003w1zzs007w0001zzzzs0000000000000000zUDzy007s0003zzzzk00000000000000007c7zzU03s0007zzzzk00000000000000001U1zzs01s000DzzzzU00000000000000000E0Tzw01s000Tz1zz000000000000000000003zz000000zzzzw000000000000000000001Tz000001zzzzs000000000000000000000Tz000003zzzzU0000000000000000000001z000007zzzzk0000000000000000000000T00000Dzzzzs0000000000000000000000700000Tzzzzw0000000000000000000000000000zzzzzy0000000000000000000000000001zzzzzz0000000000000000000002000003zzzzzzU000000000000000000000000007zzzzzzk00000000000000000000000000Dzzztzzk00000000000000000000000000TzzzUzzk00000000000000000500000000zzzz0Dzk00000000000000000600000001zzzy07zz00000000000000000200000003zzzz01zzk0000000000000000000000007zzzzU0zzs000000000000000000000000Dzzzzk0Dzg000000000000000000000000Tzzzzs07zy000000000000000000000000zzzzzy03zzU000000000001s0000000001zzzzzz00zys000000000003k0000000003zzzzzzU0Tzw000000000007k0000000007zzzbzzk0Dzy0000000000070000000000Tzzz1zzM07zvU000000000060000000000TzzzUTzi01zzk0000000000000000000007zzzsDzz00zzs0000000000000000000003zzzw3zxU0Tzg00000000000000000M0001zzzy0zzs07zr00000000000000000M0000Tzzz0Tzg03zzU0000000000000000A0000DzzzU7zz01zyk0000000000000000w00007nzzk3zzU0zzM0000000000000000w00001Uzzw0zzs0Dzq0000000000000001w000000Dzi0Tzw07zu0000000000000001w0000007zz0Dzy03zz000000000000000Bw0000001zxkTzvU0zy000000000000000Ts0000000zzszzzk0TzU00000000000000zk0000000DzwzTzs0Dzw000000000000M0zU00000007zzzDzi03zv000000000000M1z000000001zzz7zz01zyU0000000000001U100000000zzs1zxU0zzs000000000000003U0000000Dzs0zzs0Tzw00000000000000C000000007zy0Tzg07zz00000000000000S000000003zz0Dzr03zzU0000000000000S000000000zxU3zxU1zyk0000000000000T000000000Tzs0zyk0TzA0000000000000Dk00000000Dzw0zzw0Dzq00000000000001s000000003zq0jzy07zv00000000000000s000000001zzUXzv03zxk00000000000000000000000zzllzzk0zzs00000000000000000000000DzRkTzs0Tzw000000000000000000000007zzkDzy0Dzz000000000000000000000003zz07zz03zvU00000000000000000000000zxk1zzU1zzk00000000000000000000000Tzs0zzs0zzM00000000000000000000000Dzw0Tzg0Tzg000000000000000000000007zr07zr07zz000000000000000000000003zzU3zzU3zxU00000000000000000000001zyk0zzs1zyk00000000000000000000000zzs0Tzw0Tzs00000000000000000000000Tzy0Dzy0Dzo00000000000000000000000Dzv03zv07zt000000000000000000000004zzk1zzk1zwk00000000000000000000002Tzs0TzM0zzM00000000000000000000000Dzg0Dzw0Tzg000000000000000000000003zy07zz0Dzq000000000010000000000001zx01zzk3zzU000000000F0000000000000zy00zzs1zzk00000000010000000000000DzU0Tzw0zzM000000000000000000000007zk07zr0Dzy000000000000000000000001zv03zzU7zv000000000000000000000000zzk0zyk3zxU00000000000000000000000TzM0Tzw1zys000000000000000000000007zg0Dzq0Tzw000000000000000000000003zu03zvUDzy000000000000000000000001zxU1zzk7zv000000000000000000000000Tyk0Tzw1zzk00000000000000000000000DzU0Dzy0zzM020000000000000000000007zk07zz0Tzi040000000000000000000001zs01zzk7zr0A0000000000000000000000zyE0zzs3zxUM0Tw0000000000000000000Tz80Tzy1zzwvzzyU0000000000000000007zy07zz0zzTzzzzk0000000000000000003zz03zzkTzzzzzzs0000000000000000001zzk0zzsDzzzzzzw0000000000000000000Tzs0Tzy7zzzzzzy0000000000000000000Dzw0DzzXzzzzzzy00000000000000000007zz03zzkzzzzzzw00000000000000000001zzU1zzwTzzzzzs00000000000000000000zzs0zzzzzzzzzk00000000000000000000Tzw0DzzzzzzzzU000000000000000000007zy07zzzzzzzz0000000000000000000043zz03zzzzzzzy0000000000000000000001zxk1zzzzzzzk0000000000000000000000Tzw0zzzzzzy00000000000000000000000Dzi0zzzzzzU000000000000000000000007zzVzzzzzy0000000000000000000000001zzzzzzzzw0000000000000000000000000zzzzzzzzs0000000000000000000000000Tzzzzzzzk0000000000000000000000000DzzzzzzjU00000000000000000000000007zzzzzy7000000000000000000000000003zzzzzs0000000000000000000000000003zzzzzU0000000000000000000000000003zzzzy00M00000000000000000000000007zzzzs01s0000000000000000000000000DzzzzU03s0000000000000000000000000Tzzzy003y00000000000000000000000007zzzs00Dy00000000000000000000000003zzzU00Dz00000000000000000000000001zzy000DzU0000000000000000000000000Tzs000Tz00000000000000000000000000DzU000Tz000000000000000000000000007y0000zy000000000000000000000000001s000Czy000000000000000000000000000U000Tzw0000000000000000000000000000000Tzs0000000000000000000000000000001zzs0000000000000000000000000000001zzs0000000000000000000000000000003zzw0000000000000000000000000000003zzw0000000000000000000000000000000Tzw00000000000000000000000000000007zy00000000000000000000000000000007zy00003000000000000000000000000007zy0000z000000000000000000000000007zy0000T000000000000000000000000007zy0000z000000000000000000000000001zy0000z000000000000000000000000001zk0001z000000000000000000000000000z0000Tz000000000000000000000000000z0000Tz000000000000000000000000000T0000Tz000000000000000000000000000DU000zz0000000000000000000000000003U001zz0000000000000000000000000001U001zzU"
            }
            
        },
        End: {
            FindText: "|<>*68$155.00000000000007zxzzzzz0000y0000000000000DznwTzzw0001w0000000000001zz7Vzzzw0001s0000000000001zwA3zyzs0001U0000000000003zkE7zl0000000000000000003zzU0Tw00000000000000000007zy01zk3000000000000000000Dzw03z0DU00000000000000000Dzs0Ds0T000000000000000000Dzs0TU3y0000000000000000007zU1y0Dw0000000000000000007y07s0Ds0000000000000000087s0TU03k0000000000000000007k1y0000000000000000000000303s00000000000000000000000080000C0000000000000000000000k00S0000000000000000000007k0Dw00000000000000000000MzU1y0000000000000000000007z07w6000000000000000000C0Dy0Ts0700000000000000008A0zw0zk040000000000000000003001y000000000000000000000000080000300000000000000000000007w0C0000000000000000000000zk0Q000000000000000020DU01s00000000000000000000101U7U0000000000000000000040006000U00000000000000000A0006000000000000000000000100kDU7k0000000000000000000003w07k0000000000000000000001k01s0000000000000000000000E00k0000000000000000E00000000000000000000000k0007000C00000000000000003k00lzU00M7k000000000000007w400Ts07U0k0000000000000007k0000TzU0s00000000000000000000003k0E000000000000s000000000000U000000000001U00000000000s00000000000020000000000000000000000000Q0000030000000000000000001s00001w0000008000000000002E00003k000000I0000000000000Ts0070000000S000E0000000003U0060000000w30TU0000000003000A0000000yC3zU0000000007000M0000001wMzy0000000000Q000k000000twXzs0000000000U0000000003U0Dz000000000020000000000001zs00000000000000000000200Dzk00000000000000000000000Tz000000000000000000000003zl0000000000000000000U000Dy00000000000008000000000020L000000000000k000000001U07y000000000000s00000040D02Ty100000000001w000000s0C01zyDk0000000001z00001w000EFzxDs0000000000w00003k0000E3sDk0000000001U03U0C000A4EDn3U0000080001006000000TUTzUU80Q00000006000000000TkTz03XUQ00000000000401k00ToTy0DU000000000000000D300Tk1s0zk800000A0000000AiS3yTU1k3zU0002E1k0000001nHwDkTU1U7yT010601U0000000CTVz0T0807wzk000E01w000001tz7swD320DwzU0zkU07k000003bsTUTC3Y064wB1rUA000000006TYsS643U0000M3001U00000001wU6T0030kXrVEU00Dk00000007r0wzdkUsRrr4wADkTk0000000A43wCs01kMbAyPyTsT001U020000Ds0003U91vzjwzs0003nw020DjaT0k072k07sTtzs0T077mE4pyzXzaskC0Ws71zlzk8T7kT4A97vzDzisEA7Rk03zBz04TbwS8kKTDwbzg313BsTQ3w003k7jy800RwTnsTU71mM1ykE0w23k0Tz041olyTzm0D1Uk7vSsVUvk00Tz000j03byN3TMNX7VxtQSt0ETbzU0006AzwtORwO4KXnmzyvrXzXzU00w07ztsMvwk2XE1xzxbqTzvz201cATzxkQzxwA0ACvzvTpzzbzA2SlvTzxatyt8DTPSrzqzlzyTyM0/brbykEtxtgyzKybzZzdzlzwnzCTzzzw0Nxr/xz9yjznzs07zBjzNwzyTyq5vZrvyXxjynyk7ktszwk3zrzyRkTX7yz0PDs7yDSQTnztTowTzzfnzDHkYz0DlbxysNnwT4zy0TzzrlwTQDnziGrXzt6PU0EVzyTzzyDVtyyxDzS8DXW5S7Ar79zyTzzxT8/wtszyynTOTBwCkjAMzyLzzvSQrs3nzxzazlyBsRQQsszy7zzyQxbrrbzvzxym84slttg0TETtyPLvjjzbzbzvyMwCs7s00b0JzaT8TrDThjzDzzwt1CqT7zy0zTwxwzPXSz/jxTTzsNu1Rzzzzk3zrzLzTeMQvjbzTzr1xUvzzzzwTzXTzyyuFJwnEzTzjvxhjzzzzyTzsLTztrDTivTyDzTvxRzzzzzzzzzvTzPgyszrxxnzrrwtzzzzzzzzzzAzLTzhxby00zjrwvzzzzzzzzzyQjqkNyvLXw+rTbsrnzzzzzzzxzyylznvfmzzESwHsTtzzzzzzzjzpzzzbyruzzFzUXhzcDzy1zzwTjzyzzTjztzztsLrxxhk020Tzzzvzvzzzzztzzk01hvpNzTs0CDzzvTLzyzzrtzw1Vy/XqXxzk03zzzyyjbzzrjozrzU00zkTLzDs7zzzxubHzvzwK4TziOzzzqjszk7zzzzgzzzxzvjzjzD0TzzyTfzU7zzvxqzzzvzvTzzztuVzzWxzy03zy1zzzzzzzuDzz7xuz0007Ts0Dzzzzzzzjzzz7zljyz60Tyyz3XzzzzzzzzzjzzySyDxzTxztyT7bzzzzzzzzzzzzzvzzvr7u0TjzzzzzzzzzzzvzzTyrzzjzzzzzzzTzzzzzzzzvzzjzw7zzzzzzryzzjzzzzzzzzzzzzzzrzzxzTzDzzzzzzzzzzzzzzzzzzzzzrrzyTzzzzzzzzzzzzzzzzzzzzzrzzzhzzzzzzzzzzzzzzzzzzzzzzzzzzzzxzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzzzzzzzzzzzzzTTzzzzzjzzzzzzzzzzzzzzzTzzzzzzzzzTzzzxzzzzzzbzzzzzjzzzyzzzzzzzzlzzzzzzXzzjzzTTxzzzzwPzzzzTzzzzzzbzzzzrzw7zzzzyDzzzzzzzzzzzzzzzzzzzzzzzzyzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzzzzzzzzzzzTzzzzzzzTzzzzzzzzzzzzzzzzzzzzzzzzyzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzvzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzsTzzzzzzzzzzzzzzzzzzzzzzz00zzzzzzzzzzzzzzzzzzzzzzzwC0zzzzzzzzzzzzzzzzzzzzzzyEz1zzzzzzzzzzzzzzzzzzzzzzs1z1zzzTzzzzzzzlzzzzzzk",
            cords: "&X, &Y, 1536-150000, 793-150000, 1536+150000, 793+150000, 0, 0",
            Second: {
                Text: "|<>*35$53.00001zzzy00003zzzw00007zzzs0000Tzzzk0000zzzzU0001zzzz00001zzzy00001zzzw00000zzzs00000Tzzk00000DzzU00000Dzz000000Dzy000000zzw000001zzs000007zzk00000DzzU00000zzz000001zzy000007zzw00000Dzzs00000zzzU00001zzz000001zzw000003zzk00000Dzz000000zzw000005zzs00000LzzU00001zzy000002zzs00000/zzU00000jzz000001Tzw000005zzk00000TzzU00000jzy000003zzs00000Dzzk00000Lzz000001Tzw000007zzs00000/zzU00000jzy000003zzw000005zzk00000Lzz001U00zzy006002zzs00S003zzU00w00jzz001M00zzw005k01zzk00LU07zzU01z00Tzy003y00zzs00/w03zzk00js0Dzz000zk0Tzw007zU1zzs00Lz0LzzU01Ty1jzy005zw2zzs00DzsDzzk00jzkLzz002zzVzzw003zz3zzs00Tzy/zzU01Tzwjzy005zznzzw00LzzBzzk01TzwTzz003zzszzy00/zzUzzs00jzy3zzU00zzs7zz007zzUDzw00Lzz0Tzk01Tzw0zzU05zzk1zy00Dzz03zs00jzy07zk02zzs08"
            },
            Third: {
                Text: "|<>*71$48.000000000160C000AVY0S3U0CFYbA0627043U00300100000Ukc003k0k081U7k02A34kTk4nA06kzk0wA1sMA0zx8TwP0FztASw/0Vy1dAAUC000l066TZ0ysyDkTkSz3zTxTmQzLzTy300z7zTz07kMDzDz1XwUDyny0Fys3wQwLczrg0y3bo7jyMEAts0DTLbjQ00CTrrrUCD01rzzTQzPSrzuzhzfTLzuzlznTvzuztzvTfzwzyToDxzzTv6gsizqTs03z0TXDtyrzyrLbzxjzzA7nzwTzjgrxk3Tzjwry7vTzjzLv/1TzjzrytqjzDzzwxwryjzzwRNlvzjzxAyqPzrzzFTvxrtzxzTzjvvTxzzxzyA2zjjxDvyYzzryzzzhzjnU"
            }
        }
    },
    DoubleDungeon: {
        Start: {
            FindText: "|<>*98$123.0043zzzzzzzzzzzzU0000000zzzzzzzzzzzzy00000007zzzzzzzzzzzzU0000001zzzzzzzzzzzzw0000000Dzzzzzzzzzzzz00000003zzzzzzzzzzzzk0000000zzzzzzzzzzzzy00000007zzzzzzzzzzzz00000001zzzzzbzzzzzzU0000000Dzzzs0Tzzzzzs00000003zzyA007zzzzs00000800zzzU000jzzzu000003zU7zzs0000Cfzk000000zzlzzy0000004w000000DzzbzzU00000000000003vzzzzU00000000000000z5zzzw00000000000000Ds0Tzx000000000000007z007t000000000000001zs003000000000000000Tz0000000000000000007zs000000000000000001zz000000000000000000Tzs000000000000000007zz000000000000000001zzs00000000000000000Tzz00000000000000000Dzzs00000000000000003zzz00000000000000000zzzs0000000000000000Dzzz00000000000000003zzzs0000000000000000zzzzk000000000000000Dzzzz0000000000000003zzzzw000000000000000zzzzsk00000000000000Tzzzz1000000000000007zzzzs400000000000001zzzzz0E0000000000000Tzzzzs100000000000007zzzzz060000000000001zzzzzs0M000000000000Tzzzzz01U000000000007zzzzzs06000000000001zzzzzz00M00000000000zzzzzzs01U0000000000Dzzzzzz007U0000000003zzzzzzs00S0000000000zzzzzzz001k000000000Dzzzzzzs0070000000003zzzzzzz000Q000000000zzzzzzzs001k00000000Dzzzzzzz000T000000003zzzzzzzs00Dw00000000zzzzzzzz003rk0000000Dzzzzzzzs01sTU0000003zzzzzzzz00STy0000000zzzzzzzzs0Dzts000000Dzzzzzzzz03zy7U000007zzzzzzzzs0zzUS000001zzzzzzzzz0Dzs1s00000Tzzzzzzzzs7zw03k00007zzzzzzzzz1zzU0D00001zzzzzzzzzsTzs00w0000Tzzzzzzzzz7zy001s0007zzzzzzzzzvzzU007U001zzzzzzzzzzzzs000S000Tzzzzzzzzzzzy0001w007zzzzzzzzzzzzU0003k01zzzzzzzzzzzzs0000D00Tzzzzzzzzzzzy00000y07zzzzzzzzzzzzU00003s1zzzzzzzzzzzzs00000TUzzzzzzzzzzzzy000007zDzzzzzzzzzzzzU00001zzzzzzzzzzzzzzs00000Tzzzzzzzzzzzzzy000007zzzzzzzzzzzzzzU00001zzzzzzzzzzzzzzs00000Tzzzzzzzzzzzzzu000007zzzzzzzzzzzzzz000001zzzzzzzzzzzzzzs00000Tzzzzzzzzzzzzzz000007zzzzzzzzzzzzzzs00001zzzzzzzzzzzzzzz00000Tzzzzzzzzzzzzzzs00007zzzzzzzzzzzzzzz00001zzzzzzzzzzzzzzzs0000Tzzzzzzzzzzzzzzz00007zzzzzzzzzzzzzzzs0001zzzzzzzzzzzzzzzz0000Tzzzzzzzzzzzzzzzs0007zzzzzzzzzzzzzzzz0001zzzzzzzzzzzzzzzzs000TzzzzzzzzzzzzzzzzU",
            cords: "&X, &Y, 380-150000, 74-150000, 380+150000, 74+150000, 0, 0"
        },
        Middle: {
            FindText: "|<>*98$123.0043zzzzzzzzzzzzU0000000zzzzzzzzzzzzy00000007zzzzzzzzzzzzU0000001zzzzzzzzzzzzw0000000Dzzzzzzzzzzzz00000003zzzzzzzzzzzzk0000000zzzzzzzzzzzzy00000007zzzzzzzzzzzz00000001zzzzzbzzzzzzU0000000Dzzzs0Tzzzzzs00000003zzyA007zzzzs00000800zzzU000jzzzu000003zU7zzs0000Cfzk000000zzlzzy0000004w000000DzzbzzU00000000000003vzzzzU00000000000000z5zzzw00000000000000Ds0Tzx000000000000007z007t000000000000001zs003000000000000000Tz0000000000000000007zs000000000000000001zz000000000000000000Tzs000000000000000007zz000000000000000001zzs00000000000000000Tzz00000000000000000Dzzs00000000000000003zzz00000000000000000zzzs0000000000000000Dzzz00000000000000003zzzs0000000000000000zzzzk000000000000000Dzzzz0000000000000003zzzzw000000000000000zzzzsk00000000000000Tzzzz1000000000000007zzzzs400000000000001zzzzz0E0000000000000Tzzzzs100000000000007zzzzz060000000000001zzzzzs0M000000000000Tzzzzz01U000000000007zzzzzs06000000000001zzzzzz00M00000000000zzzzzzs01U0000000000Dzzzzzz007U0000000003zzzzzzs00S0000000000zzzzzzz001k000000000Dzzzzzzs0070000000003zzzzzzz000Q000000000zzzzzzzs001k00000000Dzzzzzzz000T000000003zzzzzzzs00Dw00000000zzzzzzzz003rk0000000Dzzzzzzzs01sTU0000003zzzzzzzz00STy0000000zzzzzzzzs0Dzts000000Dzzzzzzzz03zy7U000007zzzzzzzzs0zzUS000001zzzzzzzzz0Dzs1s00000Tzzzzzzzzs7zw03k00007zzzzzzzzz1zzU0D00001zzzzzzzzzsTzs00w0000Tzzzzzzzzz7zy001s0007zzzzzzzzzvzzU007U001zzzzzzzzzzzzs000S000Tzzzzzzzzzzzy0001w007zzzzzzzzzzzzU0003k01zzzzzzzzzzzzs0000D00Tzzzzzzzzzzzy00000y07zzzzzzzzzzzzU00003s1zzzzzzzzzzzzs00000TUzzzzzzzzzzzzy000007zDzzzzzzzzzzzzU00001zzzzzzzzzzzzzzs00000Tzzzzzzzzzzzzzy000007zzzzzzzzzzzzzzU00001zzzzzzzzzzzzzzs00000Tzzzzzzzzzzzzzu000007zzzzzzzzzzzzzz000001zzzzzzzzzzzzzzs00000Tzzzzzzzzzzzzzz000007zzzzzzzzzzzzzzs00001zzzzzzzzzzzzzzz00000Tzzzzzzzzzzzzzzs00007zzzzzzzzzzzzzzz00001zzzzzzzzzzzzzzzs0000Tzzzzzzzzzzzzzzz00007zzzzzzzzzzzzzzzs0001zzzzzzzzzzzzzzzz0000Tzzzzzzzzzzzzzzzs0007zzzzzzzzzzzzzzzz0001zzzzzzzzzzzzzzzzs000TzzzzzzzzzzzzzzzzU",
            cords: "&X, &Y, 380-150000, 74-150000, 380+150000, 74+150000, 0, 0"
        },
        End: {
            FindText: "|<>*98$123.0043zzzzzzzzzzzzU0000000zzzzzzzzzzzzy00000007zzzzzzzzzzzzU0000001zzzzzzzzzzzzw0000000Dzzzzzzzzzzzz00000003zzzzzzzzzzzzk0000000zzzzzzzzzzzzy00000007zzzzzzzzzzzz00000001zzzzzbzzzzzzU0000000Dzzzs0Tzzzzzs00000003zzyA007zzzzs00000800zzzU000jzzzu000003zU7zzs0000Cfzk000000zzlzzy0000004w000000DzzbzzU00000000000003vzzzzU00000000000000z5zzzw00000000000000Ds0Tzx000000000000007z007t000000000000001zs003000000000000000Tz0000000000000000007zs000000000000000001zz000000000000000000Tzs000000000000000007zz000000000000000001zzs00000000000000000Tzz00000000000000000Dzzs00000000000000003zzz00000000000000000zzzs0000000000000000Dzzz00000000000000003zzzs0000000000000000zzzzk000000000000000Dzzzz0000000000000003zzzzw000000000000000zzzzsk00000000000000Tzzzz1000000000000007zzzzs400000000000001zzzzz0E0000000000000Tzzzzs100000000000007zzzzz060000000000001zzzzzs0M000000000000Tzzzzz01U000000000007zzzzzs06000000000001zzzzzz00M00000000000zzzzzzs01U0000000000Dzzzzzz007U0000000003zzzzzzs00S0000000000zzzzzzz001k000000000Dzzzzzzs0070000000003zzzzzzz000Q000000000zzzzzzzs001k00000000Dzzzzzzz000T000000003zzzzzzzs00Dw00000000zzzzzzzz003rk0000000Dzzzzzzzs01sTU0000003zzzzzzzz00STy0000000zzzzzzzzs0Dzts000000Dzzzzzzzz03zy7U000007zzzzzzzzs0zzUS000001zzzzzzzzz0Dzs1s00000Tzzzzzzzzs7zw03k00007zzzzzzzzz1zzU0D00001zzzzzzzzzsTzs00w0000Tzzzzzzzzz7zy001s0007zzzzzzzzzvzzU007U001zzzzzzzzzzzzs000S000Tzzzzzzzzzzzy0001w007zzzzzzzzzzzzU0003k01zzzzzzzzzzzzs0000D00Tzzzzzzzzzzzy00000y07zzzzzzzzzzzzU00003s1zzzzzzzzzzzzs00000TUzzzzzzzzzzzzy000007zDzzzzzzzzzzzzU00001zzzzzzzzzzzzzzs00000Tzzzzzzzzzzzzzy000007zzzzzzzzzzzzzzU00001zzzzzzzzzzzzzzs00000Tzzzzzzzzzzzzzu000007zzzzzzzzzzzzzz000001zzzzzzzzzzzzzzs00000Tzzzzzzzzzzzzzz000007zzzzzzzzzzzzzzs00001zzzzzzzzzzzzzzz00000Tzzzzzzzzzzzzzzs00007zzzzzzzzzzzzzzz00001zzzzzzzzzzzzzzzs0000Tzzzzzzzzzzzzzzz00007zzzzzzzzzzzzzzzs0001zzzzzzzzzzzzzzzz0000Tzzzzzzzzzzzzzzzs0007zzzzzzzzzzzzzzzz0001zzzzzzzzzzzzzzzzs000TzzzzzzzzzzzzzzzzU",
            cords: "&X, &Y, 380-150000, 74-150000, 380+150000, 74+150000, 0, 0"
        }
    },
    Spirit: {
        Start: {
            FindText: "|<>*37$100.00000000003w000000000000000Dk000000000000000T0000000000000001w0000000000000007s000000000000000TU000000000000001y0000000000000007s000080000000000TU0000000E0000001y0000000100000003w000000000000000Ds000000000000000z0000000000000003s000000000000000Dk0000000000000Q0T0000000000001010M0000000000007U4QU000100000000w03w003zg00000003U0Ds04TznU000001zE0nk0FzzD200000TzU37U0DzwUB00U0Tzx0MTU3zzkDo00Tzzzw1U3UDzz0nS0HzzzzaS030wzwD080Dzs0CTkk07Vz1wFk8yw003z3k0Q7svvz17nk00TsTU1kTVaDOYS6001z1zV61z0zzyXsM00DwATYEDwDzzsD0U003kkz1VzlzzvFlX00kC60sC7zjzzw7C40610E0UwSqzzzcwMM0sA3003tk/zzyXllU3Uk802Da0zzzkT120A41U09zQ1zzy1k080UEA007ws7zzsC00U000k00S9Vjzz0k010E06001s63z7w7004200M00DU8403UM00MM03000w03k0C3U00V00Q003k8B01kA0U2803U00T0Ew071k008U0C001w17k0M6000I00k01bU0T01Us001E03006y01s047000200Q00vs0Lk00Q000061U03j01D001U0001wDUT7w02w00C000kDmzzsrk05k00k0060zrzkLS000006001u1zTU1ts00U00s00r07vU07bU00003003w0zUQ0yA00400Q01z07xzs3kk00E00003sUTbzUD3001U0000043yzy0xw006000000kDHzw7jk00Q0000061tTzUSy0Dzk20007y7gTUDzU00z0TzzzzswsMDzg00007zzzzzrr0zwzU0000Tzzzzzzwsz3w00000zzzzzzzbsSDk00001zzzzzzyDswz000001zzzzzzzzovkzzzz03zzzzzzyzkzzzzzw03zzzzzzxy1zzzzzk03zzzzzzzw3zzzzz007zzzzzzw03zzzzw007zzyzzzs73zzzzk00DzzyTzzsz3zzzz000Dzzzjzzly3zzzw000Dzzzrzzrr7zzzk000TzzznzzyS7zzz0000TzzzVzzvSDzzw000UTzzzyzzxwDzzk0000zzzzzzzXQDjz00000zzzzzzzDsS7w00001zzzzzzzDsk7k00001zzzzzzzz00z000001zzzzzzzw014000003zzzzzzyU080000003zzzzzzw00U0000003zzzzzzw0400000007zzzzzzw0E0000E007zzzzzzs200000000Dzzzzzzs800000000Dzzzzzzt00000U000DzzzzzzY000000000TzzzzzzU000000000A0zUTjk0000000000wDzvy000000000007zzzzs002",
            cords: "&X, &Y, 1514-150000, 639-150000, 1514+150000, 639+150000, 0, 0",
            Second: {
                Text: "|<>*53$53.nzwU7zzzzjzk07zzzyTz00Tzzzpzy00zzzznzi03zzzzjzQ07jzs7TyQ0STzU7zyM0xzz07zwk3ryw07rtUDjzs0Dbn0SzzU0MbX0tzz00lD63Vzy010SA71zs042wAQ7zk0M4sNsDz01k9YnUzy03U0Rj1vs070EzwDrk0C0VrsDD00w07bXwS01s0TTDty0Dk2zwzvwDzU7zvzzzzz07zjzzzlw0TzzzzsTs0zxzzsDzk3zzzwDzz0Dzjzjzzy7zyzzzzzxzzxzzzzzzzzrzrzzzzzzjzzzwTzzyjzTz0zzzy7zDUzzzzzTzjzzzzzzzzrzjz",
                cords: "&X, &Y, 1505-150000, 646-150000, 1505+150000, 646+150000, 0, 0"
            },
            Third: {
                cords: "&X, &Y, 1506-150000, 607-150000, 1506+150000, 607+150000, 0, 0",
                Text: "|<>*48$69.zzs14zzw7zy7zzE1zzzUyzwzzqDzzzzzljrzybzzzzTzUyzzhzzzzvzzkDzxTzzUSzzzVzzNzw01bzzwDzzTjU0Rzzzvzznys03DzzTTzyzr00tzz0vzzbyQ07Dzk1TzxztU1tyI03zzDzC0DDnU0zztzsk3nwQ07zyTTa0Szn00zyntwk3bzs07zozjW0sDT00zx7YwM73nk0DzdsbV1kSS03ruC2wAC3bU0SzFk31XUxw07rqQ086s7DU0zyXU80r1ks07jgs01akCD00zx700Cy3lk0DzNk0VnlwD03zOC00SwTXsDzuHU07zbzzzxvIQ02zxzzzsTMb00DzTzzkTv8s01zzzzUyyNC00Tyzz3zrn1k03zzzjzzyMQ00Txzzzzzr3U0zzzzTzzzts0Dzvzzzzrz007zzTyzzVzw07zzrzrzUzzk7zzz7zDVzzy1zzzszyTzjzkDzzzzzwzvzzzzzzzzzvzzzzzzzzzzzrzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
            }
        },
        Middle: {
            FindText: "|<>*55$56.k07zzzzzzs03zzzzzzw00zzzzzzz00Dzzzzzzk07zzzzzzw01zzzzzzz00Tzzzzzzk07zzzzzzw01zzzzzzz00Tzzzzzzk00zzzzzzw000zzzzzz0000Tzzzzk0000Dzzzw00000Dzzz0000007zzU0000003zs00000003w000000000C000000000S0000000007000000000TU00000309zU00000zzwzk0000Dzzw0E0003zzzU0s000zzzw03s00Dzzzw03w03zzzzzU1w0zzzzzzs0qDzzzzzzU0zzzzzzzkU0zzzzzzz1kDzzzzzzz7nzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy",
            cords: "&X, &Y, 1402-150000, 134-150000, 1402+150000, 134+150000, 0, 0",
            Second: {
                Text: ""
            },
            Third: {
                Text: ""
            }
        },
        End: {
            FindText: "|<>*55$56.k07zzzzzzs03zzzzzzw00zzzzzzz00Dzzzzzzk07zzzzzzw01zzzzzzz00Tzzzzzzk07zzzzzzw01zzzzzzz00Tzzzzzzk00zzzzzzw000zzzzzz0000Tzzzzk0000Dzzzw00000Dzzz0000007zzU0000003zs00000003w000000000C000000000S0000000007000000000TU00000309zU00000zzwzk0000Dzzw0E0003zzzU0s000zzzw03s00Dzzzw03w03zzzzzU1w0zzzzzzs0qDzzzzzzU0zzzzzzzkU0zzzzzzz1kDzzzzzzz7nzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy",
            cords: "&X, &Y, 1402-150000, 134-150000, 1402+150000, 134+150000, 0, 0"
        }
    }
}

selectedworld := "Namek"
Playerhost1 := ""
LookDown1(Position1 := "Start", world := "", PlayerHost := "") {
    global selectedPosition, selectedworld, Playerhost1
    Playerhost1 := PlayerHost
    
    ; Debug incoming parameters
    if (world != "")
        selectedworld := world
    else if (selectedworld == "" || !selectedworld)  ; Ensure it's not empty or undefined
        selectedworld := "Namek"
    
    ; Only update selectedPosition if a value was passed
    if (Position1 != "")
        selectedPosition := Position1
    else if (selectedPosition == "" || !selectedPosition)  ; Ensure it's not empty or undefined
        selectedPosition := "Start"
        

    BetterClick(700, 299)  
    
    loop 40 {
        SendInput("{WheelUp}")
        Sleep 50
    }
    Sleep 1000
    
    SendInput("{Click 949 929 Left}")
    Sleep 1000
    
    loop 100 {
        SendInput("{WheelDown}")
        Sleep 50
    }

    PlaceDownSpeedWagon()
}

PlaceDownSpeedWagon() {
    global speedwagonoffsetx, speedwagonoffsety
    BetterMouseMove(1197, 995, 2)

    Sleep(500)  
    BetterClick(1197, 995)
  
    

    offsetX := 0
    
    loop {
  
        BetterClick(974 + offsetX, 594)
        Sleep(500) 
        
        if (ok := FindText(&X, &Y, 922-150000, 847-150000, 922+150000, 847+150000, 0, 0, PlacementError)) {
  
            offsetX += 50
            
            if (offsetX > 200) {
                offsetX := 0
                BetterClick(1197, 995)
                Sleep(300)
                BetterClick(1197, 995)
                Sleep(1000)
            }
        } 
        else {
            ; Placement successful
            BetterClick(974, 594)
            Sleep(900)
            ; Update global offsets
            speedwagonoffsetx := 974 + offsetX
            speedwagonoffsety := 594
            SpeedWagonSpectate()
            break
        }
    }
}


SpeedWagonSpectate() {
    global selectedPosition, selectedworld, PlayerHost
    
 
    ; Successfully placed, Also clicks spectate
    SendInput("{f}")
    Sleep(200)

    BetterClick(1601, 293) ; presses the Manage units button
    Sleep(500)
    BetterClick(498, 787) ; presses the spectate button
    Sleep(500)
    BetterClick(802, 877) ; presses the left arrow in spectate mode to switch to (top down)
    Sleep(500)
    BetterClick(967, 1038) ; presses leave spectate mode
    Sleep(500)
    BetterClick(973, 559) ; Gets rid of the UI by clicking off it
    SendInput("{f}")
    Sleep(1000)

    if (selectedworld == "")
        selectedworld := "Namek"
    
    if (selectedPosition == "")
        selectedPosition := "Start"
    


    if (selectedworld == "Namek") {
        if (selectedPosition == "Start") {
            if (ImageSearchWrapper(&FoundX, &FoundY, 5, 150, 500, 800, A_ScriptDir . "/../../../Images/LovePortalPOS/Namek/Start.png", 100)) {
         
                UnitPlacementNamekStart1()
            } else {
                respawn()

            }
            
        }
        else if (selectedPosition == "Middle") {

            if (ImageSearchWrapper(&FoundX, &FoundY, 1200, 200, 1700, 500, A_ScriptDir . "/../../../Images/LovePortalPOS/Namek/middle.png", 125)) {
          
                UnitPlacementNamekMiddle1()
            } else if (ok := FindText(&X, &Y, 1425-150000, 372-150000, 1425+150000, 372+150000, 0, 0, positions.Namek.Middle.Second.Text)) {
 
                UnitPlacementNamekMiddle1()
            } else {
                respawn()
            }
        }
        else if (selectedPosition == "End") {
  
            if (ok := FindText(&X, &Y, 1536-150000, 793-150000, 1536+150000, 793+150000, 0, 0, positions.Namek.End.FindText)) {
          
                UnitPlacementNamekEnd1()
            } else if (ok := FindText(&X, &Y, 167-150000, 205-150000, 167+150000, 205+150000, 0, 0, positions.Namek.End.Second.Text)) {
              
                UnitPlacementNamekEnd1()
            } else if (ok := FindText(&X, &Y, 1526-150000, 818-150000, 1526+150000, 818+150000, 0, 0, positions.Namek.End.Third.Text)) {
    
                UnitPlacementNamekEnd1()
            } else {
                respawn()
            }
        }
    } 
    else if (selectedworld == "DoubleDungeon") {
        if (selectedPosition == "Start") {
         
            if (ok := FindText(&X, &Y, 380-150000, 74-150000, 380+150000, 74+150000, 0, 0, positions.DoubleDungeon.Start.FindText)) {
   
                UnitPlacementDoubleDungeonStart1()
            } else {
                MsgBox("DoubleDungeon Start position not found")
                respawn()
            }
        }
        else if (selectedPosition == "Middle") {
            ; Look for DoubleDungeon Middle position
            if (ok := FindText(&X, &Y, 380-150000, 74-150000, 380+150000, 74+150000, 0, 0, positions.DoubleDungeon.Middle.FindText)) {
               
                UnitPlacementDoubleDungeonMiddle1()
            } else {
                MsgBox("DoubleDungeon Middle position not found")
                respawn()
            }
        }
        else if (selectedPosition == "End") {
            ; Look for DoubleDungeon End position
            if (ok := FindText(&X, &Y, 380-150000, 74-150000, 380+150000, 74+150000, 0, 0, positions.DoubleDungeon.End.FindText)) {
       
                UnitPlacementDoubleDungeonEnd1()
            } else {
                MsgBox("DoubleDungeon End position not found")
                respawn()
            }
        }
    }
    else if (selectedworld == "Spirit") {

      
        if (selectedPosition == "Start") { 
            ; Look for Spirit Start position - use the actual pattern from positions
            if (ImageSearchWrapper(&FoundX, &FoundY, 214, 5, 1600, 600, A_ScriptDir . "/../../../Images/LovePortalPOS/Spirit/Start.png", 109)) {
                UnitPlacementSpiritStart1()
            } else {
            respawn()
            }
        }
        else if (selectedPosition == "Middle") {
            ; Look for Spirit Middle position
            if (ImageSearchWrapper(&FoundX, &FoundY, 1400, 500, 1700, 700, A_ScriptDir . "/../../../Images/LovePortalPOS/Spirit/middle.png", 85)) {
                UnitPlacementSpiritStart1()
            } else {
            respawn()
            }
        }
    }
    else {
        MsgBox("Unknown world: " . selectedworld . ", falling back to Namek Start")
        selectedworld := "Namek"
        selectedPosition := "Start"
        respawn()
    }
}

respawn() {
    BetterClick(27, 1048) ; Presses settings
    Sleep(500)
    BetterClick(1216, 341) ; Clicks the teleport to spawn button
    Sleep(500)
    BetterClick(1339, 165) ; Clicks the X button to close the settings
    SpeedWagonSpectate()
}

RunWorldFunction1(world, position) {
    switch world {
        case "Namek":
            switch position {
                case "Start":
                    UnitPlacementNamekStart1()
                case "Middle":
                    UnitPlacementNamekMiddle1()
                case "End":
                    UnitPlacementNamekEnd1()
            }
        case "DoubleDungeon":
            switch position {
                case "Start":
                    UnitPlacementDoubleDungeonStart1()
                case "Middle":
                    UnitPlacementDoubleDungeonMiddle1()
                case "End":
                    UnitPlacementDoubleDungeonEnd1()
            }
        case "Spirit":
            switch position {
                case "Start":
                    UnitPlacementSpiritStart1()
                case "Middle":
                    UnitPlacementSpiritMiddle1()
                case "End":
                    UnitPlacementSpiritEnd1()
            }
        default:
            MsgBox("Unknown world or position: " . world . " " . position)
    }
}


UnitPlacementNamekStart1() {

    ; removes the speedwagon
    Send("{f}") ;open unit manager
    Sleep(900)
    BetterClick(1627, 416) ; sell the speed wagon
    Sleep(100)
    Send("{f}") ; close the ui
    Sleep(500)
    MouseMove(1159,610)
    Sleep(500)
    unitManager(Playerhost1)
    ; Your code for Namek start placement
}

UnitPlacementNamekMiddle1() {
    Send("{f}") ;open unit manager
    Sleep(900)
    BetterClick(1627, 416) ; sell the speed wagon
    Sleep(100)
    Send("{f}") ; close the ui
    Sleep(500)
    MouseMove(1159,610)
    Sleep(500)
    unitManager22(Playerhost1)

    ; Your code for Namek middle placement
}

UnitPlacementNamekEnd1() {
    MsgBox("ds")

}

UnitPlacementDoubleDungeonStart1() {
    MsgBox("ds")
}

UnitPlacementDoubleDungeonMiddle1() {
    MsgBox("ds")

}

UnitPlacementDoubleDungeonEnd1() {
    MsgBox("ds")

}

UnitPlacementSpiritStart1() {
    Send("{f}") ;open unit manager
    Sleep(900)
    BetterClick(1627, 416) ; sell the speed wagon
    Sleep(100)
    Send("{f}") ; close the ui
    Sleep(500)
    unitManager3(Playerhost1)
    

}

UnitPlacementSpiritMiddle1() {
    Send("{f}") ;open unit manager
    Sleep(900)
    BetterClick(1627, 416) ; sell the speed wagon
    Sleep(100)
    Send("{f}") ; close the ui
    Sleep(500)
    unitManager25(Playerhost1)

}

UnitPlacementSpiritEnd1() {
    MsgBox("ds")

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
        MsgBox("Error in ImageSearchWrapper: " e.Message . " " . ImagePath)

        return false
    }
}



