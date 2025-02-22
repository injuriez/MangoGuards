#Requires AutoHotkey v2.0

Failed:="|<>*47$216.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001zzzzy000TU003z0zk000DzzzzkTzzs000007zzzzzU01zs00Dznzw000zzzzzxzzzz00000Dzzzzzk03zw00Tzzzy001zzzzzzzzzzk0000Tzzzzzk07zy00zzzzz003zzzzzzzzzzw0000T00003s0DUT00w0z0D003s0000TU007y0000S00001s0D0D00w0T07U03k0000DU000zU000w00001s0T0DU1s0S07U03U000070000Tk000w00000s0S07U1s0S07U07U0000700007s000w00000s0y07k1s0S07U07U0000700003w000w00000s0w03k1s0S07U07U0000700001y000w00000s0w03s1s0S07U07U0000700000y0zzw00001zzs01zzs0S07zzzU0000D00000Tzzzw00001zzs01zzs0S07zzzU0000D00000Dzzzw0Dzzzzzk00zzs0S07zzzU1zzzz03w007zzzw0Dzzzzzk00zzs0S07zzzU1zzzz03zk07zzzw0DzzzzzU00Tzs0S07zzzU1zzzz03zs03zzzw0DzzzzzU00Tzs0S07zzzU1zzzz03zy03zzzw0Dzzzzz000Dzs0S07zzzU1zzzz03zy03zzzw0Dzzzzz000Dzs0S07zzzU1zzzz03zz01zzzw0003zzy0007zs0S07zzzU000Tz03zzU1zzzw0001zzy0007zs0S07zzzU000Dz03zzU1zzzw0001zzw0603zs0S07zzzU000Dz03zzU1zzzw0001zzw0603zs0S07zzzU0007z03zzk1zzzw0000zzs0D01zs0S07zzzU0007z03zzk1zzzw0000zzs0D01zs0S07zzzU0007z03zzk1zzzw0001zzk0TU0zs0S07zzzU000Dz03zzk1zzzw0001zzk0TU0zs0S07zzzU000Dz03zzU1zzzw0001zzk0000Ts0S07zzzU000Dz03zzU1zzzw0007zzU0000Ts0S07zzzU000zz03zzU1zzzw0DzzzzU0000Ts0S07zzzU1zzzz03zz03zzzw0Dzzzz00000Ds0S07zzzU1zzzz03zy03zzzw0Dzzzz00000Ds0S07zzzU1zzzz03zw03zzzw0Dzzzy000007s0S07zzzU1zzzz03zs07zzzw0Dzzzy000007s0S07zzzU1zzzz03zU07zzzw0Dzzzw000003s0S07zzzU0000z00000Dzzzw0Dzzzw07zz03s0S07zzzU0000D00000Tzzzw0Dzzzs0Dzz01s0S00007U0000D00000Tzzzw0Dzzzs0TzzU1s0S00003U0000700000zzzzw0Dzzzk0TzzU0s0S00003U0000700001zzzzw0Dzzzk0zzzk0s0S00003U0000700003zzzzw0Dzzzk0zzzk0s0S00003U000070000Dzzzzw0Dzzzk1zzzs0s0S00003U0000DU000Tzzzzy0Tzzzs1zzzs1w0z00007k0000DU001zzzzzz0zzzzy3zzzw7y1zU000Ds0000Tk00TzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
shibuya:="<>*96$68.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyDbyNzzzzzzz0szWDzzzzzzU6DtXzzzzzzsnXzszzzzzzyDs7a1ttbXWTUy0MUCC0sk7w3U681XWA81zUMlWAMsV6ATz6C8XWCA177tlXW8kX3Usly0MsW0M0sC0TU6C8UD0D7k7w7baN7sbly9zzzzzzzzszzzzzzzzzzyDzzzzzzzzzz7zzzzzzzzzztzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"
spider:="<>*88$59.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwzztzbzzzzUTzlzDzzzy0TzbwDzzzwNzzzsTzzzszzyTEzzzzkz8wM1kQXzUC0sU20M7zUA0l0A0kDzkMlWAMlXzzslX4MU37zslX68lUSDzk30AE33QTzU60sk60Mzzkw3nlD1nzzzszzzzzzzzzlzzzzzzzzzXzzzzzzzzzDzzzzzzzzzzzzzzzzzzzzzzzzzz"
LobbyCheck:="|<>*137$201.y07zzk1y0M0Dzzk000zy03070001zU00Tzk0zzy0DU000Tzs0007z0000s000Ds001zy07zzk1w0001zy0000zk00070001y0007zk0zzy0DU0007zU0007w0000s000DU000Ty07zzk1w0000zw0000z000070001s0003zk0zzy0DU0003z00007s0000s000C0000Dy07zzk1w0000Dk0000y000070001k0001zk0zzy0DU0001y00007k0000w000Q01w0Dy07zzk1w01s0Dk0C00w01k07y07zU0zk0zk0zzw0DU0zU0w07w07U0z00zk0zw0Dy07y07zzU1w07y07U1zU0w0Dw07y07zU1zk0zk0zzw0DU1zk0w0Dy07U1zk0zk0zw0000Dz03zzU1w0Dz07U1zk0s0Ty07y07z00001zs0Tzw0DU1zs0w0Ty0703zk0zk0zs0000Dz03zz01w0Dy07U1zk0w0Ty07y07zU0003zs0Dzs0TU0zk0w0Dy07U1zU0zk0zw0000zzU0zy03w03w07U0zU0w07w07y07zU1zzzzw03zU0TU0C01w03s07U0T00zk0zw0Dzzzzk07U07w0000Dk0000w00007y03zU0zzzzy00000zU0001y00007k0000zk00y03zVzzs0000Dw0000Ts0000y00007y007k0007zz00003zU0007z00007s0000zs00T0000Tzw0000Tw0001zw0000zU0007z003s0003zzk0007zU000Tzk0007y0000zw00TU000Tzz0001zw0007zz0000zs0007zU03y0003zzw000zzU101zzw0007zU080zy00zs000Tzzs00Dzw0C0zzzs0M1zy030Dzw07zU007zzzk07zzU1zzzzzkDkTzy3y3zzw1zzU03zzzzsTzzw0DzzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzVzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
usebutton:="|<>*92$101.00000000000000000000000000000000000001U0A0000000000000Ts3y0000000000001zsDy0000000000003VkwS00000000000061VkQ000000000000Q3XUs000000000000s771k000U00000001kCC3jz0Ty00000003UQQ7zzXzy000000070ssDkTzUy0000000C1lkS07w0S0000000Q3XUs07U0S0000000s771k0C00Q0000001kCC300w00Q0000003UQQ63vk30s00000070ssA0zUS1k000000C1lkQ0D0w3U000000A3b0s0C0070000000Q3y1s0A00Q0000000s7s3w0M01s0000001k3UDD0EDzU0000001k00Q71U07U0000003U01s03U0700000003U07k07U0C00000003U0TU0TU0Q00000007k1zk1zU1s00000007zzbzzbzzU00000003zy3zy7zy000000001zk1zk3zk00000000000000000000000000000000000004"
Namek:="<>*90$57.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzbzzzzzzy0QTzzzzyTk1Xzzzzzly04TzzzzyDlkXzzzzzUSD4T4mDkM3lkXk60Q10S04Q0k30A3k1XX6A8lly0QMslk0CDkzXX6C8zlyDwA0ll3S3lzVk6C81kSDyD4nnkT3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
NamekLoading:="|<>*130$221.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUTzzzzzzzzzzzzzzzzz0zzzzzzzzzk0007zzz0zzzzzzzzzzzzzzzzzy1zzzzzzzzzU0007zzy1zzzzzzzzzzzzzzzkzw3zzzzzzzzz0000Dzzw3zzzzzzzzzzzzzzz0zs7zzzzzzzzy0000Tzzs7zzzzzzzzzzzzzzy0zkDzzzzzzzzw0000zzzkDzzzzzzzzzzzzzzw1zUzzzzzzzzzw0007zzzUTzzzzzzzzzzzzzzs3zzzzzzzzzzzzz0zzzzz0zzzzzzzzzzzzzzzk7zzzzzzzzzzzzy1zzzzy1zzzzzzzzzzzzzzzUDzzzzzzzzzzzzw3zy0Dw3zs0zkQ7zy0Dz3UQ01wDUwDzy3Uzzzs7zk07s7z00TU03zk0Dw20E01kD0U7zk01zzzkDz007kDw00T003z007s00U03US003z001zzzUTw007UTk00S003w007k010070w007w003zzz0zk00D0z000w003s00DU0600C1s007s007zzy1zU00S1y001s007U00D00A00Q3k007U00Dzzw3z0T0Q3w1w1k0070C0S0Qw01s7U00D080Tzzs7w1y0s7k7s3UDUA0y0Q1zy0zkD0T0Q1w0zzzkDs3w1kDUDk70z0M3y0s7zw1zUS1z0s3w1zzzUTk003UT000C1z0k7w1kDzs3z0w3y1kDs3zzz0zU00D0y000w3y1UDs3UTzk7y1s7w3UDk7zzy1z000y1w003s3s30Tk70zzUDw3kDs70T0Dzzw3y0zzw3s3zzk3U60T0S1zz0Ts7UTkC0Q0Tzzs7y0zzs3s3zzU00S0M0w3zy0zkD0zUS000zzzkDw0Q7k1k1kT000w001s7zw07US1z0w001zzzUTs00DU1U00y003w007kDzw0D0w3y1w003zzz0zs00D03U00w00Ds00TUTzs0S1s7w3w007zzy1zs00S07U01s00zs00z0zzs0w3kDs7w00Dzzw3zs01y0DU07k83zw07y1zzs1s7UTkDw10TzzwDzw07z0zk0TUTzzw0zy7zzw7sTVzkzzy0zzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzw1zzzzzzzzzzzzzzy1zzzzzzzzzzzzzzzzzy7k7zzzzzzzzzzzzzzw3zzzzzzzzzzzzzzzzzw20Dzzzzzzzzzzzzzzs7zzzzzzzzzzzzzzzzzk00TzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzU01zzzzzzzzzzzzzzzUTzzzzzzzzzzzzzzzzz007zzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzz00Tzzzzzzzzzzzzzzy1zzzzzzzzzzzzzzzzzzU3zzzzzzzzzzzzzzzyDzzzzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"
PortalPicker:="<>*124$71.zzzzzzzzzzzzzzzzzzzzzzzzzz3zzzzzzzzzzy3zzzzzzzzz3w7zzzzzzzzy7sDzzzzzzzzwDkTzzzzzzzzsTUzzzzzzzzz071byATUTw3y0603s0Q0TU3s0A03k0k0S03k0M03U1U0Q03k0k07021UkA7sTUs63w7VUwDkz1sA7s0300TVy3kMDk0600z3w7UkTU0w07y3sD1Uz1zsDzw1kS31y01k0Ds1Uw63y03k0Ts31sA7y07k0zsD7swTy0Dk1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
voteDectect:="<>*92$71.zzzzzzzzzzzzzzzzzzzzzzzzzbzwzzzzzzzzy7zkzzy7zzzzs7zUzzw7zzzzsDy3zzsDzzzzkTw7zzkTzzzzkTkTbzUzzTzzUzUs1w0DU7zzUy3U1k0C07zz1w601U0M07zz1kM01U0U0Dzy3UkA3UL0sDzy23Uw7Uy3kTzw471wD1w00zzw0S3sS3s03zzs0w7Uw7kTzzzs3s01sDUzzzzk7s03k3U0TzzkTk0Dk700zzzUzk0zUD01zzzXzs7zkzU7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
create:="|<>*112$185.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000zw0000000000000000000000000000Dzz00000000000000w0000000000003zzzU000000000000Dz000000000000Dzzzk000000000000zz000000000001zzzzk000000000003zz000000000007zU1zk00000000000Dzz00000000000Ts00zk00000000000TVy00000000001z000Tk00000000000w0y00000000007w000DU00000000001s1w0000000000TU000T03U0Dw000003k3s07y0000000y0000zzzw3zz00TzzjU7w1zzU000003s0001zzzwTzzU7zzzz0DyDzzk000007k0003zzzzzzzkTzzzy0Tzzzzs00000T00TUDzzzzzzzlzzzzw0zzzzzs00000y07zkzzyDzw1zrzzzzs1zzy0zs00001s0Tzzy1k3z00Tzk3UQ003zU0Ds00007k1zzzs007s00Tz020M003w00Dk0000DU3yzzk00DU00Ts000k007k00Dk0000S0DkDzU00S000TU001U00D000DU0000w0T07z000s000z0003000Q000TU0001s0y00y001k000w0006000s000T00003k3w01w00700U1k000A001U0E0y0000DU7s03s0QC0Dk3U000Q00D07s1w0000T07k0rk1zw0zU707k0z0Dy0Tk3w0000y0DUDzU7zk1z0A0Tk1y0Ts0zU7s0001y0Tkzz0DzU000M0zU3w0zk000DU0003w0zzzy0Tz0000k3z07s1zU000T00003s0zzzw0yy0003U7y0Dk3z0001y0Dzzzk0zzzs1zw000707w0TU7y0003zzzzzzk0zy7k3zs0Tzy0Dk0z0Dw0DzzzzzzzzU0Tk7U7zs1zzy0701y0Tw0zzzzzzzzzU000D0Dzk1znw0003w03s0ztzzzzzzzU000C0TzU003w0007s03k001zzzzzzz0000Q0zzU003s000Dk03k001zzzzzzz0000s1zzU007s000Tk07k003zzzzzzzU001k3zz000Ds000zU0DU007zzzzzzzU00DU7zz000Ts001zU0TU00Dzzzzzzzk00z0DzzU01zs0E7zU1zk00zzzzzzzzs0Dz0zzzU07zy3kTzs3zk03zzzzzzzzzzzzzzzzw7zzzzzzzzzzy3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
yes:="<>*109$84.000000000000000000000000000000000000000000000000000000000000000000000000000000000000007k1w0000000000Ts3z0000000000zw7zU000000001ywDjk000000003sSD3k000000003kDS1s000000003UDw1s000000003k7w1zy0zw00003k7s3zzXzz00001s3s3zzrzzk0001w1k7w7zsDk0000w1UDU1z01s0000S0UD00y00s0000T00S00S01s0000D00w00A01s00007U0w00A3nk00007k1s3kA1zk00003k3s7kC07s00001s3s00C01s00zzzs7s00D00zzzzzzs7s00TU0zzzzzzs7s7zzs0zzzzzzs7s3zyDUzzzzzzs7w00Q10zzzzzzs7w00Q00zzzzzzs7y00Q00zzzzzzs7z00S01zzzzzzw7zk0z07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
cancel:="<>*132$135.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000zU000007z0000000000000Dy000007zy0000000000003nk00001zzw000000000000Q700000z07k0000000000030s0000DU0D000000000000s700003k00s0000000000070s0000w00700000000003Us700007000szznzz03zU7zb0s0001s0k7Tzzzzy1zz3zzs70000C0TlzzzzzzsTnwz3z0s0001kDzzw23kEDbk3z03s70000Q1szy00Q00Rs0Dk0D0s0003UQ3vU03U01y00w00s70000Q3U0s00Q00DU070070s0003UQ07003U00w00s10M70000Q3U1k20Q0k70AC0w30s0003UQ0C1w3UD0s7vkDUM70000Q3UTkDUQ3w30zy0030s00zzUDzy1w3UTUM7zk00M7zzzzy1zzkDUQ3w30zy0070zzzzzk3yC0s3UTUM3nkDzs7zzzzz000k00Q3w300C0zz0Dzzzzs007003UTUQ00s01s0zzzzzU00w00Q3w3k07007U7zzzzy007U03UTUS00w00w0zzzzzw01z00Q3w3w0Dk07k7zzzzzs0zw63kzkzs7zU1z0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
darkerYes:="|<>*85$102.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000D01k0000000000000zk7w0000000000001zkDz0000000000003xsTT0000000000003kwS7U000000000007UQw3U0000000000070Ss3k000000000007UDs3zs0zs00000003UDk7zz3zy00000003k7k7zzbzz00000001s3UDsDzkTU0000001s30T03y03k0000000w10S01w01k0000000S00w00w03k0000000S01s00M03k0000000D01s00M7bU00000007U3k7UM3zU00000007U7kDUQ0DU00000003k7k00Q03k0000zzzzkDk00S01zzzzzzzzzkDk00z01zzzzzzzzzkDkDzzk1zzzzzzzzzkDk7zwT1zzzzzzzzzkDs00s21zzzzzzzzzkDs00s01zzzzzzzzzkDw00s01zzzzzzzzzkDy00w03zzzzzzzzzsDzU1y07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
darkerCancel:="|<>*104$132.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000Dk00000Dw0000000000000Tw00000zzU000000000000ww00003zzs000000000000sC0000Dk1w000000000000kC0000T00S000000000000kC0000w00C000000000000kC0000s00C000000000000kC0001k00C7zwzTU0Ts1zskC0003k1UCTzzzzs1zy7zykC0003U7wRzzzzzy7wzDkzkC0003UTzzs47UUTDU7y07kC00070SDzU07007S03w03kC00070s3b007003w01s01kC00070s0C007003s01k01kC00070k0C007001s01k20kC00070s0Q0U70A1k33UD0kC00070s0Q3s70S1kDrUT0kC00070s7w3s70z0kDzU00kC00zz0Tzw3s70z0kDzU00kDzzzzUTzw3s70z0kDzU01kDzzzzU7wQ1k70z0k7bUTzkDzzzzk00A0070z0k03UDzk3zzzzk00C0070z0s01k03k1zzzzs00D0070z0w01k01s1zzzzw00D0070z0w01s01s1zzzzz00Tk070z0z03w01w1zzzzzk1zsA7VzVzkDz03y1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
darkerCreate:="|<>*87$181.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007zk000000000000000000000000000Dzz0000000000000Dk000000000000zzzs000000000000zy000000000000zzzz000000000000zzU00000000001zw3zk00000000000Tzs00000000001zk0Dw00000000000Tzw00000000001zU01z00000000000DUT00000000001z000DU00000000007UDU0000000000z0003k00000000003k7k0000000000y0001ztzU7zs03yTls3y0TzU000000z0000zzzwTzz07zzzw1zlzzw000000T0000zzzzTzzkDzzzy0zxzzz000000T00y0TzzzzzzwDzzzz0Tzzzzk00000DU1zsTzzTzw3zDzzzzU7zzkDw000007U1zzzkA0zk0Tzs3UQ007z01z000007k1zzzk40TU03zk0UC001y00Dk00003s1zDzs007U00zk003000y003w00001s0y1zw007U00Dk001U00S000y00000w0y0DS003U007k000k00C000T00000S0T00D001U001s000M0060007k0000D0DU07U01k0s0s000A00303U3s00007U7k03k1ts0y0Q0007k17U3s1w00003k3s0zs1zs0z0A0T03w1zU3w0y00001s1y1zw0zw0TU60Tk1y0zk1y0T00000y0Trzy0Ty00030Ds0z0Ts000DU0000T0Dzzz0Dz0001U7y0TUDw0007k0000DU3zzzU7zU001k3y0Dk7y0007s00Tzzk0zzDk3zk001s0z07s3z0007zzzzzzw07y3s1zs0zzy0D03w0zU3zzzzzzzzy00E0w0zy0Tzz0001y0Ts1zzzzzzzzzU000S0Tz03sDU000z00w0DUzzzzzzzs00070Dzk007s000TU0D000Tzzzzzzy0003U7zs001y000Dk07U007zzzzzzzU003k3zy000z0007w03s003zzzzzzzw003s1zzU00Ts003z01y001zzzzzzzz003w1zzs00Ty083zk0zU01zzzzzzzzw0Dz1zzz00TzkS3zy0zw01zzzzzzzzzzzzzzzzy7zzzzzzzzzzsTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"
yesagain:="<>*109$97.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000y0DU000000000001zUDw000000000001zsDz000000000001ywDjk00000000001wD7Vs00000000000w3rUS00000000000Q1zUD00000000000D0Tk7zs3zk0000007UDk7zz7zy0000001s3s3zzrzzk000000y0s3y3zw7s000000D0M3s0Tk0S0000003k41s07k070000001w01s01s07U000000S01s00M03k0000007U0w00A3nk0000003s0w1s60zs0000000w0y1w3U1y0000000D0T001k0D000TzzzzUTU00w03zzzzzzzzkDk00z01zzzzzzzzs7s7zzs0zzzzzzzzw3w1zz7kTzzzzzzzy1z0070EDzzzzzzzz0zU03U07zzzzzzzzUTs01k03zzzzzzzzkDy00w03zzzzzzzzw7zk0z07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"

ShibuyaPortal:="<>*93$66.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzDbyNzzzzzzw3Xy8zzzzzzs1XyMzzzzzzsnXzszzzzzzszWSMbzzzzzsTUC83baTC9s3U681XUC41w1U681XW601z1X28kXX40lzlXW8kXX0FlslXW8lX3UMls1XW81U3UM1s1XW83k3kw1w7baN7sbky9zzzzzzzzVzzzzzzzzzzVzzzzzzzzzzXzzzzzzzzzzbzzzzzzzzzzzzzU"
; currency
PresentsThreeThousand:="|<>*128$65.zzzk1k07zzzzzzU3U07zzzzzy0700Dzzzzzy0Dw7zzzzzzz0zwzzzzzzzz3zzzzzzzzkyDVzVzVzzy0Sy0y0y0zzw0Rs1s1s1zzk0zU1U1U1vxXlz333333XVz3yD6D6D723s7wS4S4S60DkTsw8w8wC0zUTlsFsFsS3zszXkXkXks3Xkz7X7X7XU333C6666672206C0C0C0CC60QQ0w0w0wyS1sw3w3w3zzzztzzzzzzzzzzbzzzzzzzzzzTzzzzzzzzzzzzzzzzz"
shibuyaloading:="<>*58$307.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk7zzzzzy0zz0TzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzw0Dy07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk3zzzk0Tzzzzy03z01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy007zzk0Dzzzzy01z00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw000Tzs03zzzzz00TU0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs0003zw01zzzzzU0Dk07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs0000zy00zzzzzk07s03zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs0000Dz00Tzzzzs03w01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs00003zU0Dzzzzw01y00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00000zk07zzzzy01z00Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00000Ts03zzzzzU0zU0DzzzzzzzzzzzzzzzzzzzzzzzzzzzkDzw00000Dw01zzzzzs0zk07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy00000Dy00zzzzzzXzs03zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz000007z00Tzzzzzzzw01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz007w07zU0Dzzzzzzzy00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU07z07zk07zzzzzzzz00Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk07zk7zs03zzzzzzzzU0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs03zy7zw01zzzzzzzzk07zzzzzzzzzzzzyTzzzzzzzzzzzzzzzzw01zzzzy00zVzzzz1zs03w7zzzk7zzw1zw3zzzUTzzz1zk7zzzzy00zzzzz00S03zzw0Dw01k0TzzU0zzs0Ds0zzzU3zzw07k0zzzzz00TzzzzU0A00Tzy03y00U03zzk0Tzw07s0TzzU0zzs00k0TzzzzU07zzzzk04007zy00z00000Tzk07zw01s07zzk0Dzk00007zzzzk00zzzzs00000zz00TU00007zs03zy00s01zzk07zk00003zzzzw001zzzw00000DzU0Dk00001zw01zz00Q00zzs03zk00001zzzzy0003zzy000007zk07s00000Ty00zzU0C00Dzw01zk00000zzzzz00007zz000001zs03w000007z00Tzk07U07zw00zk00000Tzzzzk0000zzU00000Tw01y000003zU0Dzs03k01zy00Tk00000Dzzzzw00003zk00000Dy00z000000zk07zw01w00Ty00Ts000007zzzzy00000zs000003z00TU00000Ds03zy00z00Dz00Ds000003zzzzzU0000Dw000001zU0Dk000007w01zz00TU03z00Dw000001zzzzzw00003y000000Tk07s000001y00zzU0Ds01zU07w000000zzzzzz00001z001w00Ds03w007k00z00Tzk07w00TU07y007k00Tzzzzzs0000TU03zU07w01y00Dy00TU0Dzs03z007k03y00Dw00DzzzzzzU000Dk03zs03y00z00DzU07k07zw01zU03k03z00Dz007zzzzzzy0003s01zw00z00TU07zk03s03zy00zs00s01zU07zk03zzzzzzzw001w01zz00TU0Dk07zw01w01zz00Ty00Q00zk07zs01zzzzzzzzk00y00zzU0Dk07s03zy00y00zzU0Dz00400zs03zy00zzzzzzzzy00T00Tzk07s03w01zz00T00Tzk07zk0000Tw01zz00TzzzzyTzzU0DU0Dzs03w01y00zzU0DU0Dzs03zs0000Ty00zzU0Dzzzzw3zzk07k07zw01y00z00Tzk07k07zw01zy0000Dz00TzU07zzzzw0zzs03s03zy00z00TU07zk03s01zw00zzU000DzU07zk03zzzzw0Dzw01w01zz00TU0Dk01zk01w00zy00Tzk0007zk03zk01zzzzw03zy00y00zzU0Dk07s00zk01y00Dy00Dzw0007zs00zk00zzzzw00zy00T00Tzk07s03w007k00zU01w007zy0003zy007U00Tzzzy007y00DU0Dzs03w01y000000Tk000003zzU001zz000000Dzzzz000E00Dk07zw01y00z000000Ts000001zzs001zzk000007zzzzU000007s03zy00z00TU00000Dy000000zzw000zzs000003zzzzk000003w01zz00TU0Dk00000Dz000000Tzz000zzy000001zzzzw000003y00zzU0Dk07s000007zk00000DzzU00Tzz000000zzzzz000001z00Tzk07s03w000007zs000007zzs00Tzzk00000Tzzzzk00001zU0Dzs03w01y000007zy000003zzw00Dzzw00000Dzzzzw00001zk07zw01y00z000007zzU00001zzz00Dzzz000007zzzzz00001zs03zy00z00TU00007zzs00000zzzU07zzzk00003zzzzzk0001zw01zz00TU0Dk00007zzy00100TzzU03zzzw00001zzzzzw0003zy01zzU0Tk0Ds0600Dzzzk01U0Tzzk03zzzz00300zzzzzzU007zzU0zzs0Dw07y03U0Dzzzw03s0Dzzs01zzzzs07U0zzzzzzw00Dzzw1zzy0TzUDzk7y0zzzzzk7z0Tzzs01zzzzzUDw1zzzzzzzw1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy00Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy00Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz00Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz007zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk03zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk03zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy0DzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"
shibuyafailed:="<>*41$218.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000TzzzzU007w001zsTy0003zzzzw7zzy000000Tzzzzy007zU00zzDzk003zzzzzrzzzw00000Dzzzzzk03zw00Tzzzy001zzzzzzzzzzk00007zzzzzy01zzU0Dzzzzk00zzzzzzzzzzz00001s00007U0y1w03k3w0w00D00000y000Tw0000S00001s0D0D01w0T07U07k0000DU000zU000D00000C07k3s0S07U1s01s00001k0003w0003k00003k1s0S07U1s0S00S00000Q0000TU000w00000w0y07k1s0S07U07U0000700003w000D00000D0D00w0S07U1s01s00001k0000TU003k00003U7k0DU7U1s0S00S00000Q00003s0zzw00001zzs01zzs0S07zzzU0000D00000Tzzzz00000Tzy00Tzy07U1zzzs00003k00003zzzzk0zzzzzz003zzU1s0Tzzy07zzzw0DU00Tzzzw0Dzzzzzk00zzs0S07zzzU1zzzz03zk07zzzz03zzzzzs007zy07U1zzzs0Tzzzk0zy00zzzzk0zzzzzy001zzU1s0Tzzy07zzzw0Dzk0Dzzzw0Dzzzzz000Dzs0S07zzzU1zzzz03zy03zzzz03zzzzzk003zy07U1zzzs0Tzzzk0zzk0Tzzzk000Dzzs000TzU1s0Tzzy0001zw0Dzy07zzzw0001zzy0007zs0S07zzzU000Dz03zzU1zzzz0000Tzz01U0zy07U1zzzs0003zk0zzs0Tzzzk0003zzk0M0DzU1s0Tzzy0000Tw0Dzy07zzzw0000zzs0D01zs0S07zzzU0007z03zzk1zzzz0000Dzy03k0Ty07U1zzzs0001zk0zzw0Tzzzk0007zz01y03zU1s0Tzzy0000Tw0Dzy07zzzw0001zzk0TU0zs0S07zzzU000Dz03zzU1zzzz0000Tzs00007y07U1zzzs0003zk0zzs0Tzzzk000Tzy00001zU1s0Tzzy0003zw0Dzy07zzzw0DzzzzU0000Ds0S07zzzU1zzzz03zz03zzzz03zzzzk00003y07U1zzzs0Tzzzk0zzU0zzzzk0zzzzw00000TU1s0Tzzy07zzzw0Dzk0Dzzzw0Dzzzy000007s0S07zzzU1zzzz03zs07zzzz03zzzzU00000y07U1zzzs0Tzzzk0zs01zzzzk0zzzzk00000DU1s0Tzzy00003w00000zzzzw0Dzzzw07zy03s0S07zzzU0000D00000Dzzzz03zzzy03zzk0S07U0001s00003k00007zzzzk0zzzzU1zzy07U1s0000C00000Q00003zzzzw0Dzzzk0TzzU0s0S00003U0000700001zzzzz03zzzw0Dzzw0C07U0000s00001k0000zzzzzk0zzzz03zzz03U1s0000C00000Q0000zzzzzw0Dzzzk0zzzs0s0S00003U0000D0000TzzzzzU7zzzy0Tzzy0T0Dk0000w00003s000Tzzzzzw3zzzzsDzzzkTs7y0000TU0001z000zzzzzzzzzzzzzzzzzyTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"