#Requires AutoHotkey v2.0
#Include ../../../FindText.ahk

Failed:="|<>*47$216.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001zzzzy000TU003z0zk000DzzzzkTzzs000007zzzzzU01zs00Dznzw000zzzzzxzzzz00000Dzzzzzk03zw00Tzzzy001zzzzzzzzzzk0000Tzzzzzk07zy00zzzzz003zzzzzzzzzzw0000T00003s0DUT00w0z0D003s0000TU007y0000S00001s0D0D00w0T07U03k0000DU000zU000w00001s0T0DU1s0S07U03U000070000Tk000w00000s0S07U1s0S07U07U0000700007s000w00000s0y07k1s0S07U07U0000700003w000w00000s0w03k1s0S07U07U0000700001y000w00000s0w03s1s0S07U07U0000700000y0zzw00001zzs01zzs0S07zzzU0000D00000Tzzzw00001zzs01zzs0S07zzzU0000D00000Dzzzw0Dzzzzzk00zzs0S07zzzU1zzzz03w007zzzw0Dzzzzzk00zzs0S07zzzU1zzzz03zk07zzzw0DzzzzzU00Tzs0S07zzzU1zzzz03zs03zzzw0DzzzzzU00Tzs0S07zzzU1zzzz03zy03zzzw0Dzzzzz000Dzs0S07zzzU1zzzz03zy03zzzw0Dzzzzz000Dzs0S07zzzU1zzzz03zz01zzzw0003zzy0007zs0S07zzzU000Tz03zzU1zzzw0001zzy0007zs0S07zzzU000Dz03zzU1zzzw0001zzw0603zs0S07zzzU000Dz03zzU1zzzw0001zzw0603zs0S07zzzU0007z03zzk1zzzw0000zzs0D01zs0S07zzzU0007z03zzk1zzzw0000zzs0D01zs0S07zzzU0007z03zzk1zzzw0001zzk0TU0zs0S07zzzU000Dz03zzk1zzzw0001zzk0TU0zs0S07zzzU000Dz03zzU1zzzw0001zzk0000Ts0S07zzzU000Dz03zzU1zzzw0007zzU0000Ts0S07zzzU000zz03zzU1zzzw0DzzzzU0000Ts0S07zzzU1zzzz03zz03zzzw0Dzzzz00000Ds0S07zzzU1zzzz03zy03zzzw0Dzzzz00000Ds0S07zzzU1zzzz03zw03zzzw0Dzzzy000007s0S07zzzU1zzzz03zs07zzzw0Dzzzy000007s0S07zzzU1zzzz03zU07zzzw0Dzzzw000003s0S07zzzU0000z00000Dzzzw0Dzzzw07zz03s0S07zzzU0000D00000Tzzzw0Dzzzs0Dzz01s0S00007U0000D00000Tzzzw0Dzzzs0TzzU1s0S00003U0000700000zzzzw0Dzzzk0TzzU0s0S00003U0000700001zzzzw0Dzzzk0zzzk0s0S00003U0000700003zzzzw0Dzzzk0zzzk0s0S00003U000070000Dzzzzw0Dzzzk1zzzs0s0S00003U0000DU000Tzzzzy0Tzzzs1zzzs1w0z00007k0000DU001zzzzzz0zzzzy3zzzw7y1zU000Ds0000Tk00TzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
shibuya:="<>*96$68.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyDbyNzzzzzzz0szWDzzzzzzU6DtXzzzzzzsnXzszzzzzzyDs7a1ttbXWTUy0MUCC0sk7w3U681XWA81zUMlWAMsV6ATz6C8XWCA177tlXW8kX3Usly0MsW0M0sC0TU6C8UD0D7k7w7baN7sbly9zzzzzzzzszzzzzzzzzzyDzzzzzzzzzz7zzzzzzzzzztzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"
spider:="<>*88$59.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwzztzbzzzzUTzlzDzzzy0TzbwDzzzwNzzzsTzzzszzyTEzzzzkz8wM1kQXzUC0sU20M7zUA0l0A0kDzkMlWAMlXzzslX4MU37zslX68lUSDzk30AE33QTzU60sk60Mzzkw3nlD1nzzzszzzzzzzzzlzzzzzzzzzXzzzzzzzzzDzzzzzzzzzzzzzzzzzzzzzzzzzz"
LobbyCheck:="|<>*137$201.y07zzk1y0M0Dzzk000zy03070001zU00Tzk0zzy0DU000Tzs0007z0000s000Ds001zy07zzk1w0001zy0000zk00070001y0007zk0zzy0DU0007zU0007w0000s000DU000Ty07zzk1w0000zw0000z000070001s0003zk0zzy0DU0003z00007s0000s000C0000Dy07zzk1w0000Dk0000y000070001k0001zk0zzy0DU0001y00007k0000w000Q01w0Dy07zzk1w01s0Dk0C00w01k07y07zU0zk0zk0zzw0DU0zU0w07w07U0z00zk0zw0Dy07y07zzU1w07y07U1zU0w0Dw07y07zU1zk0zk0zzw0DU1zk0w0Dy07U1zk0zk0zw0000Dz03zzU1w0Dz07U1zk0s0Ty07y07z00001zs0Tzw0DU1zs0w0Ty0703zk0zk0zs0000Dz03zz01w0Dy07U1zk0w0Ty07y07zU0003zs0Dzs0TU0zk0w0Dy07U1zU0zk0zw0000zzU0zy03w03w07U0zU0w07w07y07zU1zzzzw03zU0TU0C01w03s07U0T00zk0zw0Dzzzzk07U07w0000Dk0000w00007y03zU0zzzzy00000zU0001y00007k0000zk00y03zVzzs0000Dw0000Ts0000y00007y007k0007zz00003zU0007z00007s0000zs00T0000Tzw0000Tw0001zw0000zU0007z003s0003zzk0007zU000Tzk0007y0000zw00TU000Tzz0001zw0007zz0000zs0007zU03y0003zzw000zzU101zzw0007zU080zy00zs000Tzzs00Dzw0C0zzzs0M1zy030Dzw07zU007zzzk07zzU1zzzzzkDkTzy3y3zzw1zzU03zzzzsTzzw0DzzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzVzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
usebutton:="|<>*92$101.00000000000000000000000000000000000001U0A0000000000000Ts3y0000000000001zsDy0000000000003VkwS00000000000061VkQ000000000000Q3XUs000000000000s771k000U00000001kCC3jz0Ty00000003UQQ7zzXzy000000070ssDkTzUy0000000C1lkS07w0S0000000Q3XUs07U0S0000000s771k0C00Q0000001kCC300w00Q0000003UQQ63vk30s00000070ssA0zUS1k000000C1lkQ0D0w3U000000A3b0s0C0070000000Q3y1s0A00Q0000000s7s3w0M01s0000001k3UDD0EDzU0000001k00Q71U07U0000003U01s03U0700000003U07k07U0C00000003U0TU0TU0Q00000007k1zk1zU1s00000007zzbzzbzzU00000003zy3zy7zy000000001zk1zk3zk00000000000000000000000000000000000004"
Namek:="<>*90$57.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzbzzzzzzy0QTzzzzyTk1Xzzzzzly04TzzzzyDlkXzzzzzUSD4T4mDkM3lkXk60Q10S04Q0k30A3k1XX6A8lly0QMslk0CDkzXX6C8zlyDwA0ll3S3lzVk6C81kSDyD4nnkT3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
NamekLoading:="|<>*130$221.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUTzzzzzzzzzzzzzzzzz0zzzzzzzzzk0007zzz0zzzzzzzzzzzzzzzzzy1zzzzzzzzzU0007zzy1zzzzzzzzzzzzzzzkzw3zzzzzzzzz0000Dzzw3zzzzzzzzzzzzzzz0zs7zzzzzzzzy0000Tzzs7zzzzzzzzzzzzzzy0zkDzzzzzzzzw0000zzzkDzzzzzzzzzzzzzzw1zUzzzzzzzzzw0007zzzUTzzzzzzzzzzzzzzs3zzzzzzzzzzzzz0zzzzz0zzzzzzzzzzzzzzzk7zzzzzzzzzzzzy1zzzzy1zzzzzzzzzzzzzzzUDzzzzzzzzzzzzw3zy0Dw3zs0zkQ7zy0Dz3UQ01wDUwDzy3Uzzzs7zk07s7z00TU03zk0Dw20E01kD0U7zk01zzzkDz007kDw00T003z007s00U03US003z001zzzUTw007UTk00S003w007k010070w007w003zzz0zk00D0z000w003s00DU0600C1s007s007zzy1zU00S1y001s007U00D00A00Q3k007U00Dzzw3z0T0Q3w1w1k0070C0S0Qw01s7U00D080Tzzs7w1y0s7k7s3UDUA0y0Q1zy0zkD0T0Q1w0zzzkDs3w1kDUDk70z0M3y0s7zw1zUS1z0s3w1zzzUTk003UT000C1z0k7w1kDzs3z0w3y1kDs3zzz0zU00D0y000w3y1UDs3UTzk7y1s7w3UDk7zzy1z000y1w003s3s30Tk70zzUDw3kDs70T0Dzzw3y0zzw3s3zzk3U60T0S1zz0Ts7UTkC0Q0Tzzs7y0zzs3s3zzU00S0M0w3zy0zkD0zUS000zzzkDw0Q7k1k1kT000w001s7zw07US1z0w001zzzUTs00DU1U00y003w007kDzw0D0w3y1w003zzz0zs00D03U00w00Ds00TUTzs0S1s7w3w007zzy1zs00S07U01s00zs00z0zzs0w3kDs7w00Dzzw3zs01y0DU07k83zw07y1zzs1s7UTkDw10TzzwDzw07z0zk0TUTzzw0zy7zzw7sTVzkzzy0zzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzw1zzzzzzzzzzzzzzy1zzzzzzzzzzzzzzzzzy7k7zzzzzzzzzzzzzzw3zzzzzzzzzzzzzzzzzw20Dzzzzzzzzzzzzzzs7zzzzzzzzzzzzzzzzzk00TzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzU01zzzzzzzzzzzzzzzUTzzzzzzzzzzzzzzzzz007zzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzz00Tzzzzzzzzzzzzzzy1zzzzzzzzzzzzzzzzzzU3zzzzzzzzzzzzzzzyDzzzzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"
PortalPicker :="<>*124$71.zzzzzzzzzzzzzzzzzzzzzzzzzz3zzzzzzzzzzy3zzzzzzzzz3w7zzzzzzzzy7sDzzzzzzzzwDkTzzzzzzzzsTUzzzzzzzzz071byATUTw3y0603s0Q0TU3s0A03k0k0S03k0M03U1U0Q03k0k07021UkA7sTUs63w7VUwDkz1sA7s0300TVy3kMDk0600z3w7UkTU0w07y3sD1Uz1zsDzw1kS31y01k0Ds1Uw63y03k0Ts31sA7y07k0zsD7swTy0Dk1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
voteDectect:="<>*92$71.zzzzzzzzzzzzzzzzzzzzzzzzzbzwzzzzzzzzy7zkzzy7zzzzs7zUzzw7zzzzsDy3zzsDzzzzkTw7zzkTzzzzkTkTbzUzzTzzUzUs1w0DU7zzUy3U1k0C07zz1w601U0M07zz1kM01U0U0Dzy3UkA3UL0sDzy23Uw7Uy3kTzw471wD1w00zzw0S3sS3s03zzs0w7Uw7kTzzzs3s01sDUzzzzk7s03k3U0TzzkTk0Dk700zzzUzk0zUD01zzzXzs7zkzU7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
create:="|<>*112$185.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000zw0000000000000000000000000000Dzz00000000000000w0000000000003zzzU000000000000Dz000000000000Dzzzk000000000000zz000000000001zzzzk000000000003zz000000000007zU1zk00000000000Dzz00000000000Ts00zk00000000000TVy00000000001z000Tk00000000000w0y00000000007w000DU00000000001s1w0000000000TU000T03U0Dw000003k3s07y0000000y0000zzzw3zz00TzzjU7w1zzU000003s0001zzzwTzzU7zzzz0DyDzzk000007k0003zzzzzzzkTzzzy0Tzzzzs00000T00TUDzzzzzzzlzzzzw0zzzzzs00000y07zkzzyDzw1zrzzzzs1zzy0zs00001s0Tzzy1k3z00Tzk3UQ003zU0Ds00007k1zzzs007s00Tz020M003w00Dk0000DU3yzzk00DU00Ts000k007k00Dk0000S0DkDzU00S000TU001U00D000DU0000w0T07z000s000z0003000Q000TU0001s0y00y001k000w0006000s000T00003k3w01w00700U1k000A001U0E0y0000DU7s03s0QC0Dk3U000Q00D07s1w0000T07k0rk1zw0zU707k0z0Dy0Tk3w0000y0DUDzU7zk1z0A0Tk1y0Ts0zU7s0001y0Tkzz0DzU000M0zU3w0zk000DU0003w0zzzy0Tz0000k3z07s1zU000T00003s0zzzw0yy0003U7y0Dk3z0001y0Dzzzk0zzzs1zw000707w0TU7y0003zzzzzzk0zy7k3zs0Tzy0Dk0z0Dw0DzzzzzzzzU0Tk7U7zs1zzy0701y0Tw0zzzzzzzzzU000D0Dzk1znw0003w03s0ztzzzzzzzU000C0TzU003w0007s03k001zzzzzzz0000Q0zzU003s000Dk03k001zzzzzzz0000s1zzU007s000Tk07k003zzzzzzzU001k3zz000Ds000zU0DU007zzzzzzzU00DU7zz000Ts001zU0TU00Dzzzzzzzk00z0DzzU01zs0E7zU1zk00zzzzzzzzs0Dz0zzzU07zy3kTzs3zk03zzzzzzzzzzzzzzzzw7zzzzzzzzzzy3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
yes:="<>*109$84.000000000000000000000000000000000000000000000000000000000000000000000000000000000000007k1w0000000000Ts3z0000000000zw7zU000000001ywDjk000000003sSD3k000000003kDS1s000000003UDw1s000000003k7w1zy0zw00003k7s3zzXzz00001s3s3zzrzzk0001w1k7w7zsDk0000w1UDU1z01s0000S0UD00y00s0000T00S00S01s0000D00w00A01s00007U0w00A3nk00007k1s3kA1zk00003k3s7kC07s00001s3s00C01s00zzzs7s00D00zzzzzzs7s00TU0zzzzzzs7s7zzs0zzzzzzs7s3zyDUzzzzzzs7w00Q10zzzzzzs7w00Q00zzzzzzs7y00Q00zzzzzzs7z00S01zzzzzzw7zk0z07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
cancel:="<>*132$135.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000zU000007z0000000000000Dy000007zy0000000000003nk00001zzw000000000000Q700000z07k0000000000030s0000DU0D000000000000s700003k00s0000000000070s0000w00700000000003Us700007000szznzz03zU7zb0s0001s0k7Tzzzzy1zz3zzs70000C0TlzzzzzzsTnwz3z0s0001kDzzw23kEDbk3z03s70000Q1szy00Q00Rs0Dk0D0s0003UQ3vU03U01y00w00s70000Q3U0s00Q00DU070070s0003UQ07003U00w00s10M70000Q3U1k20Q0k70AC0w30s0003UQ0C1w3UD0s7vkDUM70000Q3UTkDUQ3w30zy0030s00zzUDzy1w3UTUM7zk00M7zzzzy1zzkDUQ3w30zy0070zzzzzk3yC0s3UTUM3nkDzs7zzzzz000k00Q3w300C0zz0Dzzzzs007003UTUQ00s01s0zzzzzU00w00Q3w3k07007U7zzzzy007U03UTUS00w00w0zzzzzw01z00Q3w3w0Dk07k7zzzzzs0zw63kzkzs7zU1z0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
darkerYes:="|<>*85$102.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000D01k0000000000000zk7w0000000000001zkDz0000000000003xsTT0000000000003kwS7U000000000007UQw3U0000000000070Ss3k000000000007UDs3zs0zs00000003UDk7zz3zy00000003k7k7zzbzz00000001s3UDsDzkTU0000001s30T03y03k0000000w10S01w01k0000000S00w00w03k0000000S01s00M03k0000000D01s00M7bU00000007U3k7UM3zU00000007U7kDUQ0DU00000003k7k00Q03k0000zzzzkDk00S01zzzzzzzzzkDk00z01zzzzzzzzzkDkDzzk1zzzzzzzzzkDk7zwT1zzzzzzzzzkDs00s21zzzzzzzzzkDs00s01zzzzzzzzzkDw00s01zzzzzzzzzkDy00w03zzzzzzzzzsDzU1y07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
darkerCancel:="|<>*104$132.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000Dk00000Dw0000000000000Tw00000zzU000000000000ww00003zzs000000000000sC0000Dk1w000000000000kC0000T00S000000000000kC0000w00C000000000000kC0000s00C000000000000kC0001k00C7zwzTU0Ts1zskC0003k1UCTzzzzs1zy7zykC0003U7wRzzzzzy7wzDkzkC0003UTzzs47UUTDU7y07kC00070SDzU07007S03w03kC00070s3b007003w01s01kC00070s0C007003s01k01kC00070k0C007001s01k20kC00070s0Q0U70A1k33UD0kC00070s0Q3s70S1kDrUT0kC00070s7w3s70z0kDzU00kC00zz0Tzw3s70z0kDzU00kDzzzzUTzw3s70z0kDzU01kDzzzzU7wQ1k70z0k7bUTzkDzzzzk00A0070z0k03UDzk3zzzzk00C0070z0s01k03k1zzzzs00D0070z0w01k01s1zzzzw00D0070z0w01s01s1zzzzz00Tk070z0z03w01w1zzzzzk1zsA7VzVzkDz03y1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
darkerCreate:="|<>*87$181.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007zk000000000000000000000000000Dzz0000000000000Dk000000000000zzzs000000000000zy000000000000zzzz000000000000zzU00000000001zw3zk00000000000Tzs00000000001zk0Dw00000000000Tzw00000000001zU01z00000000000DUT00000000001z000DU00000000007UDU0000000000z0003k00000000003k7k0000000000y0001ztzU7zs03yTls3y0TzU000000z0000zzzwTzz07zzzw1zlzzw000000T0000zzzzTzzkDzzzy0zxzzz000000T00y0TzzzzzzwDzzzz0Tzzzzk00000DU1zsTzzTzw3zDzzzzU7zzkDw000007U1zzzkA0zk0Tzs3UQ007z01z000007k1zzzk40TU03zk0UC001y00Dk00003s1zDzs007U00zk003000y003w00001s0y1zw007U00Dk001U00S000y00000w0y0DS003U007k000k00C000T00000S0T00D001U001s000M0060007k0000D0DU07U01k0s0s000A00303U3s00007U7k03k1ts0y0Q0007k17U3s1w00003k3s0zs1zs0z0A0T03w1zU3w0y00001s1y1zw0zw0TU60Tk1y0zk1y0T00000y0Trzy0Ty00030Ds0z0Ts000DU0000T0Dzzz0Dz0001U7y0TUDw0007k0000DU3zzzU7zU001k3y0Dk7y0007s00Tzzk0zzDk3zk001s0z07s3z0007zzzzzzw07y3s1zs0zzy0D03w0zU3zzzzzzzzy00E0w0zy0Tzz0001y0Ts1zzzzzzzzzU000S0Tz03sDU000z00w0DUzzzzzzzs00070Dzk007s000TU0D000Tzzzzzzy0003U7zs001y000Dk07U007zzzzzzzU003k3zy000z0007w03s003zzzzzzzw003s1zzU00Ts003z01y001zzzzzzzz003w1zzs00Ty083zk0zU01zzzzzzzzw0Dz1zzz00TzkS3zy0zw01zzzzzzzzzzzzzzzzy7zzzzzzzzzzsTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"
yesagain:="<>*109$97.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000y0DU000000000001zUDw000000000001zsDz000000000001ywDjk00000000001wD7Vs00000000000w3rUS00000000000Q1zUD00000000000D0Tk7zs3zk0000007UDk7zz7zy0000001s3s3zzrzzk000000y0s3y3zw7s000000D0M3s0Tk0S0000003k41s07k070000001w01s01s07U000000S01s00M03k0000007U0w00A3nk0000003s0w1s60zs0000000w0y1w3U1y0000000D0T001k0D000TzzzzUTU00w03zzzzzzzzkDk00z01zzzzzzzzs7s7zzs0zzzzzzzzw3w1zz7kTzzzzzzzy1z0070EDzzzzzzzz0zU03U07zzzzzzzzUTs01k03zzzzzzzzkDy00w03zzzzzzzzw7zk0z07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"

; leech := FileOpen("../../Settings/MangoSettings/WinterPortal/leech.txt", "r")
; LeechValue := leech.ReadLine()
BetterClick(x, y) {
    MouseMove(x, y)
    Sleep(10)
    MouseMove(1, 0, , "R")
    Sleep(20)
    MouseClick("Left", -1, 0, , , , "R")
    Sleep(50)
}

SmoothMouseMove(targetX, targetY, speed := 2) {
    MouseGetPos(&startX, &startY)
    count := 10  ; Reduced number of steps for efficiency
   
    Loop count {
        progress := A_Index / count
        currentX := startX + (targetX - startX) * progress
        currentY := startY + (targetY - startY) * progress
        MouseMove(Round(currentX), Round(currentY))
        Sleep(speed)
    }
}
Failed:="|<>*118$101.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003zU00000000000000zzw00001U00000003k1y0000Ts0000000600C0001ts0000000M00C00030k0000000k00C00061U0000001U00C000A300000003000A000M600000006000MDz1kDXxzDU7kA1y0NzzjUTzzzzUTsM3y0rU3s01kM73Vksk6A1w03k01U04330lUAQ3k03U020087C1X0Tk700300400E6M360z0A00600800U7k6A000s1U400k03UD0MM001U7UD0zU7zUC0kk0070T0S1z0Tv0M3VU00C000w360l70E63000Q003s6A1U600Q6000s006kAM30600kA001k00xUTk60A01UM3w1UDzn0TUA0A060k7s3U7Va070M0Q0A1UAs3003g060k0M0k30Mk7003Q0A1U0s1U60lkD006M0M300k70C1VUT00Qs0s601UA0A73Vr01kw3kQ060s0Tw3z7zzUzzzk0A1U0Dk3s3zw0Tsz00s30000000y0000001UA0000000000000070M00000000000000A1k00000000000000M3000000000000000kC000000000000001kM000000000000001zk000000000000001z0000000000000000M0000000000000000004"
UnitPlaced := "|<>*87$115.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzszzzyDy7zzzzzzzzzzzsDzzy3z3zzzzzzzzzzzw7zzz1zUzzzzzzzzzzzy3zzzUzkTzzzzzzzzzzz1zzzkTsDzzzzzzzzzzzUzzzsDw7zzzzzzzzzzzkTtzw7y323zUVkES13w0DU7y3z1U0TU0M0C01s07U1z1zUk07U0A0600s03U0TUzkM03U060700Q01U07kTsA00k830n00A00kC3sDwC3kMD1UzUw63kMD1w7w71sADUkTky31sA00y1y3Uw63kMDsD1Uw600zUy1kA31kA7w70kS31zzk41s03U063y00M01Uzzw00w01s031zU0C00s07z00y01y01Uzk07U0Q03zk0z01zU0kTw03s0D01zw1zUnzzkQTzVXy6Ds1zzzzkTzzsDzzzzzzzzzzzzzsDzssDzzzzzzzzzzzzzw7zs07zzzzzzzzzzzzzy3zw07zzzzzzzzzzzzzz1zz07zzzzzzzzzzzzzzlzzsDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"
Vote:= "<>*92$71.zzzzzzzzzzzzzzzzzzzzzzzzzbzwzzzzzzzzy7zkzzy7zzzzs7zUzzw7zzzzsDy3zzsDzzzzkTw7zzkTzzzzkTkTbzUzzTzzUzUs1w0DU7zzUy3U1k0C07zz1w601U0M07zz1kM01U0U0Dzy3UkA3UL0sDzy23Uw7Uy3kTzw471wD1w00zzw0S3sS3s03zzs0w7Uw7kTzzzs3s01sDUzzzzk7s03k3U0TzzkTk0Dk700zzzUzk0zUD01zzzXzs7zkzU7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
AutoAbility:="|<>*132$58.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzntwU0sTzzyDbm020TzzsSTDXk1zzz1twyD7Xzzw3bnswyDzzWCTDXXwzzy0NwyDDXzzk1XXswSDzz024DXkVzzsyA1yDU7zznwsDsz1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
; developer notes
; Monarch is the top priority unit if the team has it [Will be placed down first]
; MoneyUnits are the units that will be placed down after Monarch [Will be placed down second]
; If the team has no Monarch, the 3/3 units will be placed down first
checkstatus() {
    ChangeLogs("Checking status")
    global X1 := 214
    global Y1 := 5
    global X2 := 1600
    global Y2 := 600

    Loop {
        Sleep(500)
        if ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, A_ScriptDir . "\..\..\..\Images\status\portal.png", 50) {
            ChangeLogs("Portal found")
            webhook()
            SendInput("{f}")
            
            try {
                if FileExist("../../../Settings/MangoSettings/session/stats/wins.txt") {
                    Wins := FileOpen("../../../Settings/MangoSettings/session/stats/wins.txt", "r")
                    currentWins := Integer(Wins.ReadLine())
                    Wins.Close()
                } else {
                    currentWins := 0
                }
                
          
                Wins := FileOpen("../../../Settings/MangoSettings/session/stats/wins.txt", "w")
                Wins.Write(currentWins + 1)
                Wins.Close()
                

                if FileExist("../../../Settings/MangoSettings/session/stats/TotalWins.txt") {
                    TotalWins := FileOpen("../../../Settings/MangoSettings/session/stats/TotalWins.txt", "r")
                    TotalCurrentWins := Integer(TotalWins.ReadLine())
                    TotalWins.Close()
                } else {
                    TotalCurrentWins := 0
                }
                
                TotalWins := FileOpen("../../../Settings/MangoSettings/session/stats/TotalWins.txt", "w")
                TotalWins.Write(TotalCurrentWins + 1)
                TotalWins.Close()
            } catch as e {
                MsgBox("Error updating win stats: " e.Message)
            }
            Sleep(500)

            Leech1()
            return true ; Exit with success



        } else {
            ; Check for Rewards
        

        ; Check for Failure
        if ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, A_ScriptDir . "\..\..\..\Images\status\failed.png", 50) {
            Sleep(1000)
            SendInput("{f}")
            try {
                if FileExist("../../../Settings/MangoSettings/session/stats/losses.txt") {
                    loss := FileOpen("../../../Settings/MangoSettings/session/stats/losses.txt", "r")
                    currentLosses := Integer(loss.ReadLine())
                    loss.Close()
                } else {
                    currentLosses := 0
                }
         
                loss := FileOpen("../../../Settings/MangoSettings/session/stats/losses.txt", "w")
                loss.Write(currentLosses + 1)
                loss.Close()
            } catch as e {
                MsgBox("Error updating loss stats: " e.Message)
            }
            Sleep(2000)
            GemStart()
            
            
            return true ; Exit with success
        }
        }
        
     


        ; If no conditions are met, exit the loop
        return false ; Exit with failure
    }
}

GemStart() {
    global X1 := 214
    global Y1 := 5
    global X2 := 1600
    global Y2 := 600

    loop {
        if ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, A_ScriptDir . "\..\..\..\Images\status\Vote.png", 50) {
            WinActivate("Roblox")
            Sleep(1000)
            BetterClick(881, 173) ; Clicks yes
            Sleep(5000)
            unitManager1()
            break
        } else {
            Sleep(1000) ; Add a small delay to avoid excessive CPU usage
            continue
        }
    }
}


unitManager1() {
    Unit1(864, 595)
    Sleep(500)
    Unit2(602, 374)
    Sleep(500)
    Unit3(1271, 657)  
    Sleep(500)
    Unit4(1218,422)  
    Sleep(500)
    
    ; Use a counter and sleep between checks rather than an infinite loop
    loop {
        if (checkstatus()) {
            break
        }
        if (upgradeAll()) 
            break

        Sleep(5000)  
    }
}
upgradeAll() {
    ; open the unitmanager ui


    Sleep(1000)
    BetterClick(1365, 416)
    Sleep(500)
    BetterClick(1575, 412)
    Sleep(500)
    BetterClick(1774, 408)
    Sleep(1000)
    BetterClick(1572, 744)
    Sleep(500)
    SmoothMouseMove(1167, 819)
    CheckAll()

    return checkstatus()

}



Unit1(x, y) {
    SendInput("{1}")
    BetterClick(x, y)

    Sleep(100)
    loop {
        if (ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, UnitPlaced)) {
            break
        } else {
            ; Retry clicking if the condition is not met
            SendInput("{1}")
            checkstatus()
            BetterClick(x, y)
            Sleep(100)
        }
    }
}

Unit2(x, y) {
    SendInput("{2}")
    BetterClick(x, y)

    Sleep(100)
    loop {
        if (ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, UnitPlaced)) {
            break
        } else {
            ; Retry clicking if the condition is not met
            SendInput("{2}")
            checkstatus()
            BetterClick(x, y)
            Sleep(100)
        }
    }
}

Unit3(x, y) {
    SendInput("{3}")
    BetterClick(x, y)

    Sleep(100)
    loop {
        if (ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, UnitPlaced)) {
            break
        } else {
            ; Retry clicking if the condition is not met
            SendInput("{3}")
            checkstatus()
            BetterClick(x, y)
            Sleep(100)
        }
    }
}

Unit4(x, y) {
    SendInput("{4}")
    BetterClick(x, y)

    Sleep(100)
    loop {
        if (ok := FindText(&X, &Y, 918-150000, 105-150000, 918+150000, 105+150000, 0, 0, UnitPlaced)) {
            SendInput("{f}")
            break
        } else {
            ; Retry clicking if the condition is not met
            SendInput("{4}")
            checkstatus()
            BetterClick(x, y)
            Sleep(100)
        }
    }
}

CheckAbility() {
    
    loop {
        if (ok := FindText(&X, &Y, 671-150000, 345-150000, 671+150000, 345+150000, 0, 0, AutoAbility)) {
            BetterClick(679, 377)
            Sleep(1000)
            return true
        } else {
            return false
        }
    }
}

CheckAll() {

    BetterClick(1391, 289)
    Sleep(500) ; Give UI time to update
    CheckAbility()
    Sleep(900)
    
    BetterClick(1596, 289)
    Sleep(500) ; Give UI time to update
    CheckAbility()
    Sleep(900)
    
    BetterClick(1806, 286)
    Sleep(500) ; Give UI time to update
    CheckAbility()
    Sleep(900)
    
    BetterClick(1578, 618)
    Sleep(500) ; Give UI time to update
    CheckAbility()
    Sleep(900)

    return
}
LeechButtons() {
    loop {
        if (ok := FindText(&X, &Y, 841-150000, 568-150000, 841+150000, 568+150000, 0, 0, yes)) {
            BetterClick(X, Y)
            Sleep(500)
            LeechCancel()
            Sleep(1000)
            break
        } else {
            if (ok := FindText(&X, &Y, 853-150000, 556-150000, 853+150000, 556+150000, 0, 0, darkerYes)) {
                BetterClick(X, Y)
                Sleep(2000)
                LeechCancel()
                Sleep(1000)
                break
            }
        }
    }
}

LeechCancel() {
    loop {
        if (ok := FindText(&X, &Y, 961-150000, 569-150000, 961+150000, 569+150000, 0, 0, cancel)) { ; detects cancel after picking portal
            ; collects the rewards
            BetterClick(X, Y - 20)
            Sleep(2000)
            Sleep(500)
            BetterClick(X, Y)
            Sleep(500)
            BetterClick(X, Y)
            Sleep(500)
            BetterClick(X, Y)
            Sleep(500)
            webhook() ; WEBHOOK HERE
            BetterClick(X, Y)
            Sleep(1000)
            Sleep(1000)
            GemStart()
            break
        } 
    }
}

Leech1() {
    ChangeLogs("Checking For Portals")
    loop {
        portals := [
            {x: 722, y: 500},
            {x: 960, y: 500},
            {x: 1194, y: 499}
        ]
    
        CheckWorldType(worldType) {
            for portal in portals {
                BetterMouseMove(portal.x, portal.y)
                Sleep(500)
                
                switch worldType {
                    case "Namek":
                        if (FindText(&X, &Y, 1292-150000, 617-150000, 1292+150000, 617+150000, 0, 0, Namek)) {
                            BetterClick(portal.x, portal.y + 120)
                            Sleep(2000)
                            LeechButtons()
                            return true
                        }
                    case "Shibuya":
                        if (FindText(&X, &Y, 1062-150000, 581-150000, 1062+150000, 581+150000, 0, 0, shibuya)) {
                            BetterClick(portal.x, portal.y + 120)
                            Sleep(2000)
                            LeechButtons()
                            return true
                        }
                    case "Spider":
                        if (FindText(&X, &Y, 1061-150000, 618-150000, 1061+150000, 618+150000, 0, 0, spider)) {
                            BetterClick(portal.x, portal.y + 120)
                            Sleep(2000)
                            LeechButtons()
                            return true
                        }
                }
                
                if (A_Index < portals.Length) {
                    BetterClick(portal.x, portal.y)
                    Sleep(2000)
                }
            }
            return false
        }
    
        if (!CheckWorldType("Namek")) {
            if (!CheckWorldType("Shibuya")) {
                CheckWorldType("Spider")
            }
        }
    }
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

webhook() {
    Run(A_ScriptDir "\..\..\..\webhook.ahk")   
}

GemStart()
BetterMouseMove(targetX, targetY, speed := 2) {
    MouseGetPos(&startX, &startY)
    count := 25  ; number of steps
    
    Loop count {
        progress := A_Index / count
        currentX := startX + (targetX - startX) * progress
        currentY := startY + (targetY - startY) * progress
        MouseMove(Round(currentX), Round(currentY))
        Sleep(speed)
    }
}

F2::ExitApp

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