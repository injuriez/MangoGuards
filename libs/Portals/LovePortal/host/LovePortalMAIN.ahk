#Requires AutoHotkey v2.0
#Include ../../../FindText.ahk
#Include ../../../webhook.ahk
#Include ../../../Modules.ahk
#Include ../../../AllText.ahk
#Include ../Portal_Modules/LovePortalPosition.ahk
global PlayerHost := "false"
global WorldLoaded := "none"
global selectedPosition := "Start" 
class LovePortal_Portals {
    static Namek := {
        Value: "|<>*87$120.TzzzzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzzzzzTzyTzzzzzzzzzzzzzztzT0CDzzzzzDyDXzzzzzszT06Dzzzzz7y7VzzzzzszT02Dzzzzz7y3VzzzzzszT72Dzzzzy1y3VzzzzzszT7UDWN7sA1y1VWM37WMXT72D0M1U41y0V0M030M3T02C0M1U61y000M000M3T06CAMkX77yA0AMkUAM7T0CAQMs077yA0QMlkQM7T3yCAMsUT7yC0AMlkAM7T7y60MsVD1yD00Mlk0M3T7y70MsU71yDX0Mll0MVT7z7WNtsDVyDnWMlnWNnTzzzzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzzzzzU",
        Cords: "&X, &Y, 999-150000, 644-150000, 999+150000, 644+150000, 0, 0"
    }
    static DoubleDungeon := {
        Value: "|<>*95$61.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyTtzzw0zzzz7wTzy07zzzXyDzz03zzzlz7zzXkzzzsbXzzlwQDDA1lsDsyA1XW0Mk3wT00ll0AM1yDUA8sX2AMz7UD4QFV40TXUX2A8lX0zk0k3040kVDs0w1k20sE3w1z3wH8yC3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz",
        cord: "&X, &Y, 1166-150000, 634-150000, 1166+150000, 634+150000, 0, 0"
    }
}

SwitchNamek :="|<>*144$304.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs03zzzzzzzzzzw7zzzzzVzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU07zzzzzzzzzy03zzzzk0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00Tzzzzzzzzzk07zzzy01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzk01zzzzzzzzzz00Dzzzk03zzzzzzzzzzzzzzzzzzzzzzzzzzzzz007zzzzzzzzzw00Tzzz00Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00TzzzzzzzzzU00zzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzk01zzzzzzzzzy003zzzk03zzzzzzzzzzzzzzzzzzzzzzzzzzzzz007zzzzzzzzzs007zzz00Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00TzzzzzzzzzU00Dzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzk01zzzzzzzzzy000zzzk03zzzzzzzzzzzzzzzzzzzzzzzzzzzzz007zzzzzzzzzs001zzz00Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00TzzzzzzzzzU003zzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzk01zzzzzzzzzy0007zzk03zzzzzzzzzzzzzzzzzzzzzzzzzzzzz007zzzzzzzzzs000Tzz00Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00TzzzzzzzzzU000zzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzk01zzzzzzzzzy0001zzk03zzzzzzzzzzzzzzzzzzzzzzzzzzzzz007zzzzzzzzzs0003zz00Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00TzzzzzzzzzU000Dzw00zzzz7zw7zzUzz1zzz1zzzzzz7zw7zk01zzzzzzzzzy0000Tzk03zzz01z03zk0TU0zzk0Tzzzz01z03z007zzzzzzzzzs0000zz00Dzzk01s07y00w00zw00Tzzzk01s07w00TzlzzzzzzzU0001zw00zzw00300Ds03U01z000zzzw00300Dk01zw1zzzzzzy00007zk03zzU00000zU0A003s001zzzU00000z007zU3zzzzzzs0000Dz00Dzw000003w0000070003zzw000003w00Ts07zzzzzzU0000Tw00zzU00000Dk0000080007zzU00000Dk01z00Tzzzzzy00000zk03zw000000z0000000000Tzw000000z007s00zzzzzzs00003z00DzU000003w0000000000zzU000003w00T001zzzzzzU00007w00zw000000Dk0000000003zw000000Dk01s007zzzzzy00800Dk03zU000000z00000000007zU000000z007000Tzzzzzs00k00T00Dy0000003w0000000000Ty0000003w00M001zzzzzzU03001w00zk000000Dk0000000001zk000000Dk010007zzzzzy00C003k03z0000000z00000000007z0000000z000000zzzzzzs00w00700Ds0000003w0000000000Ds0000003w000007zzzzzzU03s00A00zU00TU00Dk00TU00DU00zU00TU00Dk00000zzzzzzy00DU00k03y007zU00z003z001z003y007zU00z000007zzzzzzs00z00100Ds00zz003w00Dw00Dy00Ds00zz003w00001zzzzzzzU03y00000z003zw00Dk01zs00zs00z003zw00Dk0000Dzzzzzzy00Dw00003w00Tzs00z007zU03zk03w00Tzs00z00001zzzzzzzs00zk0000Dk01zzU03w00Ty00Dz00Dk01zzU03w0000DzzzzzzzU03zU0000z007zy00Dk01zs00zw00z007zy00Dk0001zzzzzzzy00Dz00003w00Tzs00z007zU03zk03w00Tzs00z0000Dzzzzzzzs00zy0000Dk01zzU03w00Ty00Dz00Dk01zzU03w0000DzzzzzzzU03zs0000z007zy00Dk01zs00zw00z007zy00Dk0000Tzzzzzzy00Dzk0003w00Tzk00z007zU03zk03w00Tzk00z00000zzzzzzzs00zzU000Ds00zz003w00Ty00Dz00Ds00zz003w00001zzzzzzzU03zz0000zU01zs00Dk01zs00zw00zU01zs00Dk00001zzzzzzy00Dzw0003y001y000z007zU03zk03y001y000z000003zzzzzzs00zzs000Ds0000003w00Ty00Dz00Ds0000003w000007zzzzzzU03zzk000zk000000Dk01zs00zw00zk000000Dk00000Dzzzzzy00DzzU003z0000000z007zU03zk03z0000000z004000Tzzzzzs00zzy000Dy0000003w00Ty00Dz00Dy0000003w00M000zzzzzzU03zzw000zs000000Dk01zs00zw00zs000000Dk01k001zzzzzy00Dzzs003zk000000z007zU03zk03zk000000z007U003zzzzzs00zzzk00DzU000003w00Ty00Dz00DzU000003w00T000DzzzzzU03zzz000zz000000Dk01zs00zw00zz000000Dk01y000zzzzzy00Dzzy003zy000000z007zU03zk03zy000000z007y003zzzzzs00zzzw00Dzw000003w00Ty00Dz00Dzw000003w00Tw00Tzzzzzk03zzzs00zzs00000Ds01zs01zw00zzs00000Ds01zs01zzzzzz00TzzzU03zzk00400zU07zU07zk03zzk00400zU0Dzk0Dzzzzzw01zzzz00DzzU00s07y00zz00TzU0TzzU00s07y00zzU1zzzzzzs0Dzzzy01zzzU0DU0zw07zy03zy01zzzU0DU0zw07zz0Dzzzzzzs3zzzzy0Tzzzs7zkDzw1zzy0zzy0Tzzzs7zkDzw1zzz1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
SwitchSpirit := "|<>*139$555.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU3zzzzzzzz07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs0Dzzzzzzzk0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk1zzzzzzzzzzzy00zzzzzzzw01zzzzzzzzzzzzzk1zzzzzzzzzzzzzzzzzzzk07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzU00zzzzzzzzzzzk07zzzzzzzU0DzzzzzzzzzzzzU00zzzzzzzzzzzzzzzzzzy00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzk000zzzzzzzzzzw00Tzzzzzzs00zzzzzzzzzzzzk000zzzzzzzzzzzzzzzzzzU03zzzzzzzzzzzzzzzzzzzzzzzzzzzzs0001zzzzzzzzzzU03zzzzzzz007zzkzzzzzzzzs0001zzzzzzzzzzzzzzzzzw00Tzzzzzzzzzy7zzzzzzzzzzzzzzzzy00003zzzzzzzzzw00Tzzzzzzs00zzk0zzzzzzzy00003zzzzzzzzzzzzzzzzzU03zzzzzzzzzy07zzzzzzzzzzzzzzzzU0000DzzzzzzzzzU03zzzzzzz007zw03zzzzzzzU0000Dzzzzzzzzzzzzzzzzw00TzzzzzzzzzU0Tzzzzzzzzzzzzzzzs00000zzzzzzzzzw00Tzzzzzzs00zz00Dzzzzzzs00000zzzzzzzzzzzzzzzzzU03zzzzzzzzzs01zzzzzzzzzzzzzzzy000003zzzzzzzzzU03zzzzzzz007zs01zzzzzzy000003zzzzzzzzzzzzzzzzw00Tzzzzzzzzz00DzzzzzzzzzzzzzzzU00000Tzzzzzzzzy00Tzzzzzzw00zz00DzzzzzzU00000Tzzzzzzzzzzzzzzzzk03zzzzzzzzzs01zzzzzzzzzzzzzzzw000001zzzzzzzzzk07zzzzzzzU0Dzs01zzzzzzw000001zzzzzzzzzzzzzzzzy00zzzzzzzzzz00Dzzzzzzzzzzzzzzz000000Dzzzzzzzzz00zzzzzzzy01zz00Dzzzzzz000000Dzzzzzzzzzzzzzzzzs07zzzzzzzzzs01zzzzzzzzzzzzzzzs000003zzzzzzzzzw0Tzzzzzzzs0zzs01zzzzzzs000003zzzzzzzzzzzzzzzzzU3zzzzzzzzzz00Dzzzzzzzzzzzzzzy000000Tzzzzzzzzzzzzzzzzzzzzzzz00Dzzzzzy000000Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzs01zzzzzzzzzzzzzzzk000007zzzzzzzzzzzzzzzzzzzzzzzs01zzzzzzk000007zzzzzzzzzzzzzzzzzzzzzzzzzzzzz00Dzzzzzzzzzzzzzzy007y00zzzzzzzzzzzzzzzzzzzzzzzz00Dzzzzzy007y00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzs01zzzzzzzzzzzzzzzU01zs0Dzzzzzzzzzzzzzzzzzzzzzzzs01zzzzzzU01zs0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzz00Dzzzzzzzzzzzzzzw00TzU3zzzzzzzzzzzzzzzzzzzzzzzz00Dzzzzzw00TzU3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzs01zzzzzzzzzzzzzzzU03zz0zzzzzzzzzzzzzzzzzzzzzzzzs01zzzzzzU03zz0zzzzzkDzzzzzzzzzzzzzzzzzsDzzzz00DzzzDzzzzzzzzzzw00TzzzzzsDzkzzzzwDzz1zw0zzsTzz00Dbzzzzw00TzzzzzzzU07zzzzzw07zzzVzzzzU03zzzs01wzzUTzzzUTzzzzzU03zzzzzs0DU0Tzzs0Dz01y01zk0Ts00003zzzzU03zzzzzzzU007zzzzw007zz01zzzU003zz00000Tk1zzzs0zzzzzw00Tzzzzy00s00zzy00zk07003w01y00000Dzzzw00Tzzzzzzk000Dzzzy000Dzk07zzk0007zk00001w07zzy01zzzzzU01zzzzzk06003zzk07y00k00TU0Dk00001zzzzU01zzzzzzw0000zzzz0000Ty00zzw0000Ty00000D00zzzk07zzzzy007zzzzy000007zy00Tk00003w00y000007zzzy007zzzzzz00003zzzk0001zk03zy00001zk00000k03zzw00zzzzzk00DzzzzU00000TzU03w00000D007U00000zzzzk00DzzzzzU00007zzw00007w00TzU00007w00000400DzzU03zzzzy0007zzzw000001zw00TU00001s00w000007zzzy0007zzzzs00000Tzy00000TU03zs00000TU00000U01zzw00Tzzzzk0001zzzU000007zU03w00000D007U00000zzzzk0001zzzy000003zzU00001w00Ty000001w000006007zz003zzzzz00001zzw000000Tw00TU00003s00w000007zzzz00001zzzk00000Dzw00000DU03zU00000DU00000k00zzs00zzzzzs00001zzU000003zU03w00000T007U00000zzzzs00001zzw000000zz000001w00Tw000000w000006003zy007zzzzzU00003zw000000Dw00TU00003s00w000007zzzzU00003zz0000003zk00000TU03z0000007U00000s00Dzk01zzzzzy000007zU000000zU03w00000z007k00000zzzzy000007zs000000Ty000003w00Tk000000S000007U01zw00Dzzzzzs00000Tw0000007w00TU00007s00y00000Dzzzzs00000Ty0000001zU00000TU03y000A003k00001w007zU03zzzzzzU00001zU000000TU03w00001z007s00003zzzzzU00001zk000000Dw000007w00Tk00Dw00T00000Tk00zs00Tzzzzzy00000Dw0000003w00TU00TUTs00zU0000zzzzzy00000Dw001y001z000001zU03w007zU03w00007y003z003zzzzzzw00000zU00Ts00TU03w007zzz007zs01zzzzzzzw00000zU00zw007s007w0Tw00TU01zy00Tz00Dzzs00Tk00zzzzzzzs00003w007zU01w00TU01zzzs00zz00Dzzzzzzzs00003w00Dzk00z001zs7zU03w00Tzk03zs01zzzU01y007zzzzzzzk0000TU01zy00DU03w00Tzzz007zs01zzzzzzzzk0000TU03zz007s00Tzlzw00TU03zy00Tz00Dzzw007k01zzzzzzzzk0003w00Dzk01w00TU03zzzs00zz00Dzzzzzzzzk0003s00zzs00y007zzzzU03s00TzU03zs01zzzk00w00Dzzzzzzzzs000DU03zz00DU03w00Tzzz007zs01zzzzzzzzzs000D007zzU03k01zzzzw00T0000000Tz00Dzzy003U03zzzzzzzzzw001w00Tzs01w00TU03zzzs00zz00Dzzzzzzzzzw001s00zzw00S00DzzzzU03s0000003zs01zzzs00M00Tzzzzzzzzzs00DU03zz00DU03w00Tzzz007zs01zzzzzzzzzzs00D007zzU03k01zzzzw00T0000000Tz00DzzzU01007zzzzzzzzzzU01w00Tzs01w00TU03zzzs00zz00DzzzzzzzzzzU01s00zzw00S00DzzzzU03s0000007zs01zzzw00000zzzzzzz3zzy00DU03zz00DU03w00Tzzz007zs01zzzzzzz3zzy00D007zzU03k01zzzzw00T0000000zz00Dzzzk00007zzzzzzUDzzs01w00Tzk01w00TU03zzzs00zz00DzzzzzzUDzzs01s00zzw00S00DzzzzU03s000000Dzs01zzzy00001zzzzzzs0Tzz00DU01zy00DU03w00Tzzz007zs01zzzzzzs0Tzz00D007zz007k00zzzzw00T0000003zz00Dzzzs0000Dzzzzzy01zzk01w007zU01w00TU03zzzs00zz00Dzzzzzy01zzk01w00Tzs00z007zzzzU03s000001zzs01zzzzU0003zzzzzzk07zy00DU00Ts00TU03w00Tzzz007zs01zzzzzzk07zy00DU01zy007s00Tz1zw00TU03zzzzzz00Dzzzw0000Tzzzzzw00Tzk01w000w003w00TU03zzzs00zz007zzzzzw00Tzk01w007zU00z000zU3zU03w00Tzzzzzs00zzzzk0007zzzzzz001zw00DU000000TU03w00Tzzz007zs00zzzzzz001zw00DU00Dk00Ds001k0Dw00TU01zzzzzz007zzzy0000zzzzzzs003y003w0000007w00TU03zzzs00zz0007zzzzs003y003y0000001zU00000zU03y007zzXzzs000zzzs000Dzzzzzz0000000TU000000zU03w00Tzzz007zs000Dzzzz0000000Tk000000Dw000007w00Tk00DzU7zz0001zzz0001zzzzzzw0000003w000000Dw00TU03zzzs00zz0000zzzzw0000003z0000003zk00000TU03y000000zzs0007zzw000DzzzzzzU000000zU000001zU03w00Tzzz007zw0007zzzzU000000zs000000Ty000003w00Ts000003zzU000zzzk003zzzzzzy0000007w000000Tw00TU03zzzs00zzU000Tzzzy0000007zU000007zs00000DU03z000000Tzw0003zzy000Tzzzzzzk000001zU000007zU03w00Tzzz007zw0003zzzzk000001zy000001zzU00001w00Tw000001zzU000Tzzs007zzzzzzz000000Dw000001zw00TU03zzzs00zzk000Tzzzz000000Dzk00000Tzw00000DU03zk00000Dzy0003zzz000zzzzzzzw000003zU00000TzU03w00Tzzz007zy0003zzzzw000003zz000003zzk00003w00Ty000001zzk000Tzzw00Dzzzzzzzk00000zw000007zw00TU03zzzs00zzs000Tzzzzk00000zzw00000zzz00000zU03zs00000Dzz0003zzzU01zzzzzzzz00000DzU00001zzU03w00Tzzz007zzU003zzzzz00000Dzzs0000Tzzy0000Dw00TzU00001zzw000Tzzw00Tzzzzzzzy00007zw00k00zzy00zk03zzzw01zzy000zzzzzy00007zzzU0007zzzs0003zk07zz00000Tzzk007zzz003zzzzzzzzs0001zzU07U0Tzzk07y00zzzzU0Dzzs007zzzzzs0001zzzy0001zzzzk001zy00zzw00003zzz000zzzs00Tzzzzzzzzk000zzw00zUTzzz01zs0Dzzzy03zzzk01zzzzzzk000zzzzw000zzzzzU00Tzs0Dzzs0001zzzy00Dzzy007zzzzzzzzzk00zzzU07zzzzzy0zzk7zzzzw1zzzzs0zzzzzzzk00zzzzzw00zzzzzzU0Tzzk7zzzk000zzzzz07zzzk00zzzzzzzzzzs1zzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs1zzzzzzy1zzzzzzzzzzzzzzzzzs01zzzzzzzzzzy00DzzzzzzzzzzzzzzzU07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU01zzzzzzzzzzzzzzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00TzzzzzzzzzzzzzzzU07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz003zzzzzzzzzzzzzzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs00zzzzzzzzzzzzzzzzU07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy007zzzzzzzzzzzzzzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk00zzzzzzzzzzzzzzzzU07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00Dzzzzzzzzzzzzzzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU01zzzzzzzzzzzzzzzzU07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00Tzzzzzzzzzzzzzzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz003zzzzzzzzzzzzzzzzU07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs00zzzzzzzzzzzzzzzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz007zzzzzzzzzzzzzzzzU07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs01zzzzzzzzzzzzzzzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz00Dzzzzzzzzzzzzzzzzk07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs03zzzzzzzzzzzzzzzzy00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU0Tzzzzzzzzzzzzzzzzs0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz07zzzzzzzzzzzzzzzzzk7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
TwoPlayerError := "|<>*127$30.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz0zzzw0Dzzs07zzk03zzk01zzUA1zzUS1zzUz1zzUz0zzUz1zzky1zzzw1zzzk3zzzU3zzy07zzw0Tzzs0zzzk1zzzU00zzU00zzU00zzU00zzk00zzzzzzzzzzzzzzzzzzzzzzzzzzU"
VotingText := "|<>*93$74.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzbzwzzzzzzzzzkzy7zzkzzzzzs7zUzzw7zzzzz1zkTzz1zzzzzkTw7zzkTzzzzy3y3wzw7zvzzzUzUs1w0DU7zzw7kQ0C01k0zzz1w601U0M07zzsC300A0401zzy3UkA3UL0sDzzkEQ7Uw7kS3zzw471wD1w00zzzU3kT3kT00Tzzs0w7Uw7kTzzzz0T00D1w7zzzzk7s03k3U0Tzzy3y01y0s07zzzUzk0zUD01zzzwTz0zy7w0zzzzzzzzzzzzzzzzzzzzzzzzzy"
Namek := "|<>*63$251.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk000Tzzw03zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy00007zzs03zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00003zzk07zzzzzzzzzzzzzzzzzzzzzzzzs3zzzzzk00001zzU0Dzzzzzzzzzzzzzzzzzzzzzzzz01zzzzzU00000zz00Tzzzzzzzzzzzzzzzzzzzzzzzy03zzzzz000000zy00zzzzzzzzzzzzzzzzzzzzzzzzs07zzzzy000000zw01zzzzzzzzzzzzzzzzzzzzzzzzk0Dzzzzw000000zs03zzzzzzzzzzzzzzzzzzzzzzzzU0Dzzzzs000001zk07zzzzzzzzzzzzzzzzzzzzzzzz00Tzzzzk000001zU0Dzzzzzzzzzzzzzzzzzzzzzzzy00zzzzzU000001z00Tzzzzzzzzzzzzzzzzzzzzzzzw01zzzzz0000003y00zzzzzzzzzzzzzzzzzzzzzzzzs03zzzzy0000003w01zzzzzzzzzzzzzzzzzzzzzzzzk07zzzzw01zy007s03zzzzzzzzzzzzzzzzzzzzzzzzU0Dzzzzs03zz00Dk07zzzzzzzzzzzzzzzzzzz1zzzz00Tzzzzk07zz00TU0DzzzsDz0zz0Tw3zzzzzU07zzW00UTzzzU0Dzy00T00Tzzy03s0Ts0DU0zzzzs003zw00007zzz00Tzy00y00zzzk01U0zk0Q00Tzzz0001zs0000Dzzy00zzw01w01zzy00100z00k00Dzzw0001zk0000Dzzw01zzs03s03zzs00001y00000DzzU0001z00000Tzzs03zzk07k07zzU00003w00000Dzy00001y00000zzzk07zzU0DU0Dzy000007s00000Tzs00001w00001zzzU0Dzy00T00Tzs00000Dk00000Tzk00001s00003zzz00Tzw01y00zzU00000TU00000Tz000003k00007zzy00zzk03w01zz000000z000000zw000007U0000Dzzw01zy007s03zw000001y000000zs000007U0000zzzs000000Dk07zs000003w000001zU00z00D00001zzzk000000zU0DzU000007s000001z007z00T00007zzzU000001z00Tz003s00Dk00z003y00Tz00zw01zzzzz0000007y00zy00Tw00TU03zU07s01zy01zs03zzzzy000000Dw01zs01zs00z00DzU0Dk03zw03zk07zzzzw000000zs03zk03zs01y00zz00DU07zk07zU0Dzzzzs000003zk07zU0Dzk03w01zz00T000000Dz00Tzzzzk00000DzU0Dz00Tzk07s03zy00y000000Ty00zzzzzU00000zz00Ty00zzU0Dk07zw01w000000zw01zzzzz000007zy00zw01zz00TU0Dzs03s000003zs03zzzzy00000Tzw01zs03zw00z00Tzk07k00000Dzk07zzzzw00003zzs03zk03zs01y00zzU0DU00000zzU0Dzzzzs0000zzzk07zU07zU03w01zz00T000007zz00Tzzzzk07zzzzzU0DzU07y007s03zy00y00Tzzzzy00zzzzzU0Dzzzzz00Tz003s00Dk07zw01y00zzzzzw01zzzzz00Tzzzzy00Dy000000TU0Dzs03w00zzzzzs01zzzzy00zzzzzw001y000000z00Tzk07s00Tz0zzk003zzzw01zzzzzs003w000001y00zzU0Ds007U0zzU003zzzs03zzzzzk003w000003w01zz00Tk00001zzU003zzzk07zzzzzk007s000007s03zy00zk00001zz0007zzzU0DzzzzzU00Ds00000Dk07zw01zU00003zy000Dzzz00Tzzzzz000Ts00000TU0Dzs03zU00003zy000Tzzy00zzzzzy000zs00000z00Tzk07zU00007zw000zzzw01zzzzzy001zs00001y00zzU0DzU0000Tzw001zzzs03zzzzzw003zs00003w01zz00TzU0000zzw003zzzs0Dzzzzzw007zs00M07s07zy01zzU0003zzw007zzzk0Tzzzzzy00Tzw03k0Ts0Dzy03zzk000Dzzy00Tzzzs3zzzzzzzU1zzz0Ts3zw1zzz0Tzzs001zzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"
Spirit := "|<>*58$203.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUDzzzzzzz0Tzzzzzzzzzzzzzzzzzzzzzzw0Dzzzzzzs0Tzzzzzzzzzzk3zzzzzzzzzzs0Dzzzzzzk0Tzzzzzzzzzs00TzzzzzzzzzU0Tzzzzzz00zzzzzzzzzz0007zzzzzzzzz00Tzzzzzy00zzzzzzzzzs0003zzzzzzzzy00zzzzzzw01zzUDzzzzzU0003zzzzzzzzw01zzzzzzs03zw07zzzzy00003zzzzzzzzs03zzzzzzk07zs0Dzzzzs00003zzzzzzzzk07zzzzzzU0DzU0Tzzzzk00003zzzzzzzzU0Tzzzzzz00zz00Tzzzz000007zzzzzzzzU0zzzzzzz01zy00zzzzw00000DzzzzzzzzU3zzzzzzz07zw01zzzzs00000zzzzzzzzzszzzzzzzzlzzs03zzzzk00001zzzzzzzzzzzzzzzzzzzzzk07zzzz007w07zzzzzzzzzzzzzzzzzzzzzU0Dzzzy00Tw0Tzzzzzzzzzzzzzzzzzzzzz00Tzzzw01zw1zzzzzzzzzzzzzzzzzzzzzy00zzzzs03zy7zzzzzzzzzzzzzzzzzzzzzw01zzzzk07zzzzz0zs7zzzkTzk7y0TzUzy0020zzzU0Dzzzzs0T01zzw0Dy03k0Ds0Tk0000Tzz00Tzzzzk0M00zzs0Dw0700Dk0TU0000zzy00Tzzzz00U00zzU0Dk0000T00S00000zzw00Dzzzy00000zz00TU0000S00w00001zzw001zzzw00000zy00z00000w01s00003zzs000Dzzs00000zw01y00001s03k00007zzk0001zzk00000zs03w00007k07U0000Dzzk0000zzU00000zk07s0000DU0D00000Tzzk0000Dz000000zU0Dk0000T00S00000zzzU0000Dy000001z00TU0001y00y00003zzzU0000Dw000001y00z00003w01w00007zzzk0000Ds000003w01y003kDs03w0000Tzzzk0000Tk00z007s03w00Tzzk07zk07zzzzzs0000TU03zU07k07s01zzzU0DzU0Dzzzzzy0000z00Dz00DU0Dk07zzz00Tz00TzzzzzzU000y00zz00T00TU0Dzzy00zy00zzzzzzzw001w01zy00y00z00Tzzw01zw01zzzzzzzz003s03zy01w01y00zzzs03zs03zzzzzzzzU07k07zw03s03w01zzzk07zk07zzzzyTzzU0DU0Dzk07k07s03zzzU0DzU0DzzzzkDzz00T00TzU0DU0Dk07zzz00Tz00Tzzzz0Dzy00y00Ty00T00TU0Dzzy00zy00zzzzw0Dzw01w00Tw00y00z00Tzzw01zw01zzzzk0Dzs03s00TU03w01y00zzzs03zs03zzzz00DzU07k000007s03w01zzzk07zk07zzzy007y00DU00000Dk07s03zzzU0DzU07zzzw001000z000000zU0Dk07zzz00Tz000Dzzs000001y000001z00TU0Dzzy00zy000Dzzk000003w000007y00z00Tzzw01zw000Dzzk00000Ds00000Tw01y00zzzs03zw000Tzzk00000Tk00000zs03w01zzzk07zs000zzzk00001zU00003zk07s03zzzU0Dzs001zzzk00007z00000DzU0Dk07zzz00Tzk003zzzk0000Ty00000zz00TU0Dzzy00zzk007zzzk0001zw01007zy00z00Tzzw01zzk00Dzzzk000Dzs0300Tzw03y00zzzs07zzk00Tzzzs001zzk07U7zzw07y03zzzs0Dzzs01zzzzw00DzzU0Dzzzzy0zz0Tzzzw1zzzy07zzzzzk7zzz00Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs03zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz00Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs03zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz00Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw03zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"
Double := "|<>*60$260.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz0zzzzzzk7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz03zzzzzk0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk0Tzzzzw07zzzzzzzzzzs000Tzzzzzzzzzzzzzzzzzzs07zzzzy01zzzzzzzzzzs0000Tzzzzzzzzzzzzzzzzzy00zzzzzU0Dzzzzzzzzzy00001zzzzzzzzzzzzzzzzzzU0Dzzzzs03zzzzzzzzzz000007zzzzzzzzzzzzzzzzzs03zzzzy00zzzzzzzzzzk00000Tzzzzzzzzzzzzzzzzy00zzzzzU0Dzzzzzzzzzw000003zzzzzzzzzzzzzzzzzU0Dzzzzs03zzzzzzzzzz000000Dzzzzzzzzzzzzzzzzs03zzzzy00zzzzzzzzzzk000001zzzzzzzzzzzzzzzzy00zzzzzU0Dzzzzzzzzzw000000DzzzzzzzzzzzzzzzzU0Dzzzzs03zzzzzzzzzz0000001zzzzzzzzzzzzzzzzs03zzzzy00zzzzzzzzzzk000000Dzzzzzzzzzzzzzzzy00zzzzzU0Dzzzzzzzzzw0000003zzzzzzzzzzzzzzzzU0Dzzzzs03zzzzzzzzzz0000000Tzzzzzzzzzzzzzzzs03zzzzy00zzzzzzzzzzk07zs003zzzzzzzzzzzzzzzy00zzzzzU0Dzzzzzzzzzw01zzU00zzzz0zzzzzzzzzzzU0Dzzzzs03zzzzUTzzzz00Tzw007zzw00zzzs3zzy0zs03w7zzy00zzzw00Tzzzk07zzk01zzw001zzs0Dzy03y00s0DzzU0Dzzw001zzzw01zzy00Dzw000Dzy03zzU0zU0800zzs03zzw0007zzz00TzzU03zy0000zz00Tzk07s00003zy00zzy0000zzzk07zzw00zz00007zk07zw01y00000TzU0Dzy00007zzw01zzzU0DzU0000zw01zz00TU00003zs03zz00000zzz00Tzzs01zk00007z00Tzk07s00000Ty00zzU00007zzk07zzz00Ts00000zk07zw01y000003zU0Dzs00000zzw01zzzk07w00000Dw01zz00TU00000zs03zw00000Dzz00Tzzw01y000001z00Tzk07s000007y00zy000003zzk07zzz00TU00000Dk07zw01y000000zU0DzU00000Tzw01zzzk07k000003w01zz00TU00000Ds03zk00TU07zz00Tzzw01w007k00z00Tzk07s000001y00zw00Tw01zzk07zzz00T007z007k07zw01y003s00TU0Dz00DzU0Tzw01zzzk07U03zs01w01zz00TU03zU07s03zU07zs07zz00Tzzw01s01zz00T00Tzk07s01zw00y00zs01zy01zzk07zzy00S00zzk07k07zw01y00Tz00DU0Dy00Tz00Tzw01zzzU07U0Dzw01w01zz00TU0Dzs03s03zU000007zz00Tzzs03s03zz00T00Tzk07s03zy00y00zs000001zzk07zzw00y00zzk03k07zw01y00zzU0DU0Dy000000Tzw01zzy00DU0Dzw01w01zz00TU0Dzs03s03zU00000Dzz00Tzz007s03zz00T00Tzk07s03zy00y00zs000007zzk07zzU01y00Tzk07k03zs01y00Tz00DU0Dy000003zzw01zzk00TU07zs01w00zy00TU03zU03s03zU00003zzz00Tzk00Ds00zw00T007z007s00zk01y00zs01zzzzzzk07zU007z007y007s00T001y003s00TU0Dz00Tzzzzzw0000001zk00A003y000000TU000007s00zk03zzzzzz0000000zw000000zU000007s000003y000w00DzUTzzk000000TzU00000Tw000001y000000zU00DU00S03zzw0000007zw000007z000000TU00000Ts001s00000zzz0000003zz000003zs000007s000007y000T000007zzk000001zzs00000zz000001y000003zk007k00001zzw000000zzz00000Tzk00000TU00001zw001y00000Dzz000000zzzs0000Dzy000007s00000zz000Tk00003zzk00000Tzzz00007zzk00001y00000Tzs007y00000zzw00000Tzzzs0003zzy00100TU0000Dzy001zk0000TzzU0000Tzzzz0003zzzs00k0Ds0600Dzzk00Ty0000Dzzs0000Tzzzzw001zzzz00y03z01k07zzz00Dzs0007zzzU001zzzzzzk03zzzzy0zs3zw1zUDzzzy07zzU007zzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzzzzzzzz00TzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"

spiritPick := "|<>*94$50.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyTzwzwzzy1zz7z6Tz0DznznXzlbzzzzszwTzzDzA3z3wXl8k0zk70QEA0Dy0k34343zsAMl7lXzzX6AFwMzwMlX4T6Dz0A0l7lUzk30QFwMDy3kDAzD3zzwTzzzzzzz7zzzzzzzlzzzzzU"





LovePortalMain(Playerposition, hosting) {
    global PlayerHost, selectedPosition, WorldLoaded
    

    PlayerHost := hosting
    selectedPosition := Playerposition
    WorldLoaded := "none"  
    if hosting == "true" {
        HostPickPortal(Playerposition, hosting)
    } else {
  
        HostAwaitingVote(Playerposition, hosting)
    }
}



HostPickPortal(position, host) {
    baseX := 531
    baseY := 432
    
    ; Grid spacing
    colSpacing := 160
    rowSpacing := 150
    
    searchType := "Namek"

    BetterClick(1495, 227)
    Sleep(1000)
    Send("{Tab}")
    Sleep(100)
    Send("{j}")
    Sleep(2000)
    BetterClick(1180, 316)

    text := "love"
    for each, char in StrSplit(text) {
        Send(char)
        Sleep(100)
    }
    Sleep(1000)

    WinGetPos(&winX, &winY, &winWidth, &winHeight, "A")

    row := 0
    col := 0

    while (true) { ; Infinite loop until a portal is found
        SmoothMouseMove(baseX + (col * colSpacing), baseY + (row * rowSpacing))
        Sleep(500) 

        if (searchType = "Namek" && FindText(&X, &Y, 999-150000, 644-150000, 999+150000, 644+150000, 0, 0, Love_NAMEK)) {
            Sleep(1000)
            MouseGetPos(&mouseX, &mouseY)
            BetterClick(mouseX, mouseY)
        } 
        else if (searchType = "Spirit" && FindText(&X, &Y, 1361-150000, 607-150000, 1361+150000, 607+150000, 0, 0, spiritPick)) {
            Sleep(1000)
            MouseGetPos(&mouseX, &mouseY)
            BetterClick(mouseX, mouseY)
            
        } 
        else {
            ; Move to the next portal
            col++
            if (col >= 6) {
                col := 0
                row++
                if (row >= 3) {
                    row := 0
                    Send("{WheelDown}") ; Scroll after checking all portals
                    Sleep(1000)
                }
            }

            searchType := (searchType = "Namek") ? "Spirit" : "Namek"
            continue
        }

        loop {
            if (FindText(&X, &Y, 744-150000, 554-150000, 744+150000, 554+150000, 0, 0, usebutton)) {
                BetterClick(X, Y)
                Sleep(2000)

                loop {
                    if (FindText(&X, &Y, 787-150000, 549-150000, 787+150000, 549+150000, 0, 0, create)) {
                        BetterClick(X, Y)
                        Sleep(100)
                        break
                    }
                }

                loop {
                    if (FindText(&X, &Y, 962-150000, 550-150000, 962+150000, 550+150000, 0, 0, cancelPortal)) {
                        BetterMouseMove(X, Y, 3)
                        BetterClick(X, Y)
                        Sleep(1500)
                        break
                    }
                }
                TwoPlayerErrorFUNC()
                break
            }
        }
        break
    }
}



TwoPlayerErrorFUNC() {
    loop { ;start
        if (ok := FindText(&X, &Y, 1398-150000, 829-150000, 1398+150000, 829+150000, 0, 0, aftercanelstart)) {
            BetterClick(X, Y)
            Sleep(100)
            Sleep(1000)
            break
        }
    }

    loop { 
        if (ok := FindText(&X, &Y, 1028-150000, 488-150000, 1028+150000, 488+150000, 0, 0, TwoPlayerError)) {
            BetterMouseMove(961, 555, 3) ; clicks cancel button
            BetterClick(961, 555)
            Sleep(500)
            BetterMouseMove(800, 555, 3) ; So the button doesn't get stuck on one thing
            Sleep(500)
            TwoPlayerErrorFUNC()
        } else {
            HostAwaitingVote(selectedPosition, PlayerHost)
            break
        }
    }
}

HostAwaitingVote(position := "", host := "", CurrentWorldPlaying := "") {
    global selectedPosition, WorldLoaded, PlayerHost


    if (position != "")
        selectedPosition := position
    if (host != "")
        PlayerHost := host
    MsgBox(PlayerHost)
    Countdown(0, "Waiting for world...")

    ;So when the player picks another portal after the last portal and picks the same portal the ui vote will pop up 
    loop {
        if (ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, VotingText)) {
            BetterClick(881, 177) ; Clicks yes
            Sleep(200)
            LookDown1(selectedPosition, CurrentWorldPlaying, PlayerHost)



            break
        } else {
            DetectWorldHost()

            WaitForVotingUI_HOST()

            WaitForMatchStart_HOST()

        }

    }
    

    
}

DetectWorldHost() {
    global WorldLoaded
    global Namek, Double, Spirit, SwitchSpirit


    loop {
        if (ok := FindText(&X, &Y, 149-150000, 911-150000, 149+150000, 911+150000, 0, 0, Namek)) {
            Countdown(0, "Loading Into namek")
            WorldLoaded := "Namek"
            break
        } else if (ok := FindText(&X, &Y, 960-150000, 538-150000, 960+150000, 538+150000, 0, 0, SwitchNamek)) {
            Countdown(0, "Loading Into namek")
            WorldLoaded := "Namek"
            break
        } else if (ok := FindText(&X, &Y, 126-150000, 915-150000, 126+150000, 915+150000, 0, 0, Spirit)) {
            WorldLoaded := "Spirit"
            break
        } else if (ok := FindText(&X, &Y, 957-150000, 547-150000, 957+150000, 547+150000, 0, 0, SwitchSpirit)) {
            WorldLoaded := "Spirit"
            break
        }
    }
}

WaitForVotingUI_HOST() {
    
    loop {
        if (ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, VotingText)) {
            BetterClick(881, 177) ; Clicks yes
            Sleep(200)
            break
        }

    }
}

/**
 * Waits for the match to start and then positions character
 */
WaitForMatchStart_HOST() {
    global selectedPosition, WorldLoaded, PlayerHost
    
    loop {
        ; Wait for the voting text to disappear
        if !(ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, VotingText)) {
            MsgBox("World: " . WorldLoaded . "`nHost: " . PlayerHost . "`nPosition: " . selectedPosition)

            LookDown1(selectedPosition, WorldLoaded, PlayerHost)
            break
        }

    }
}