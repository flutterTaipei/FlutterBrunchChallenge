# flutter_brunch_challenge

這是 Flutter Brunch 現場小挑戰活動 使用的初始專案，
從 2020/08/29 開始。

## Flutter Brunch 2020/10 小挑戰

9 月玩了 PACMAN，10 月換 FlappyBird！
還是原作者的實作影片連結（長度約 60 分鐘）：     
https://www.youtube.com/watch?v=vgmVPpFP0fI

P.S. 原作者有在網站上販售程式碼，有興趣的人也可以參考喔

#### 小挑戰起始位置
- 請使用 branch：[feature/20201031_flappybird](https://github.com/flutterTaipei/FlutterBrunchChallenge/tree/feature/20201031_flappybird)
- 實作頁面位置：[lib/ui/flappybird/flappybird_screen.dart](https://github.com/flutterTaipei/FlutterBrunchChallenge/blob/feature/20201031_flappybird/lib/ui/flappybird/flappy_bird_screen.dart)     
- 範例在 branch [feature/20201031_flappybird_sample](https://github.com/flutterTaipei/FlutterBrunchChallenge/tree/feature/20201031_flappybird_sample)（已 merge 回 develop）    


#### 最終樣貌
<img src="https://github.com/flutterTaipei/FlutterBrunchChallenge/blob/develop/readme/challenge202010/20201030_flappybird_final.png" width="600">
需要處理的大致有：

- 背景和鳥
- 點擊畫面時讓鳥先跳起再墜落
- 障礙物

#### 1. 背景和鳥
<img src="https://github.com/flutterTaipei/FlutterBrunchChallenge/blob/develop/readme/challenge202010/20201031_flappybird_01_bg.png" width="600">
Tips：

- 使用 Column、Expanded 兜出色塊範圍
- 另開檔案放 Bird Widget

#### 2. 點擊畫面時讓鳥先跳起再墜落
<img src="https://github.com/flutterTaipei/FlutterBrunchChallenge/blob/develop/readme/challenge202010/20201031_flappybird_02_math.png" width="600">
Tips：

- 使用 AnimatedContainer，透過 [Alignment](https://api.flutter.dev/flutter/painting/Alignment-class.html) 移動鳥的位置 
- 宣告 birdYaxis 紀錄鳥的 alignment y
- 宣告 startGame() 開始遊戲
- 宣告 jump() 點擊畫面後跳動

startGame() 
- 使用 Timer 更新鳥下墜時的位置
- 公式為 (-9.8t²)/2 + vt
- t=時間，可先 +=0.1，再調整成自己覺得適合的數值
- v=加速度，可先用 5，再調整成自己覺得適合的數值
- 若鳥砸到地上就遊戲結束（cancel timer）

jump() // 改變鳥的高度
- 重置 Timer 用的時間（t 歸零）
- 重置初始高度為鳥目前的高度（initialHeight=birdYaxis）


#### 3. 計分板與障礙物
<img src="https://github.com/flutterTaipei/FlutterBrunchChallenge/blob/develop/readme/challenge202010/20201031_flappybird_03_score.png" width="600">
<img src="https://github.com/flutterTaipei/FlutterBrunchChallenge/blob/develop/readme/challenge202010/20201031_flappybird_04_barriers.png" width="600">
Tips：

- 另開檔案放 Barrier Widget
- 畫面上需要圖層概念的遊戲區塊，使用 Stack
- 要讓障礙物移動，方式和鳥類似，只是換成動 alignment x
- 要讓障礙物循環出現，可以在障礙物的 x 超出螢幕範圍時，再重置回螢幕另一頭

最後還有鳥撞到障礙物時的判斷，這部分就不在影片中，    
可以自己研究看看，參考這次
[由 Vincent 寫的 20201031_flappybird_sample](https://github.com/flutterTaipei/FlutterBrunchChallenge/tree/feature/20201031_flappybird_sample)
或 參考[原作者](https://mitchkoko.app/)販售的程式碼囉！








# 過去的小挑戰

## Flutter Brunch 2020/09 小挑戰

8月小挑戰我們練習了一些基本 Widget，最後兜岀一個有首頁 Drawer 的畫面，    
這次來玩小遊戲吧！    
來挑戰社團分享中，有蠻多留言，也有人跟著做了分享出來的 PACMAN！    
原作者實作影片連結（長度約 45 分鐘）：     
https://www.youtube.com/watch?v=PbIlXoijRvM      
    
這次小挑戰的實作頁面位置在 lib/ui/pacman/pacman_screen.dart，    
（範例在 branch feature/20200919_pacman_sample）    
TODO 畫面  和 完成後畫面 如下：    
<img src="https://github.com/flutterTaipei/FlutterBrunchChallenge/blob/feature/20200919_pacman/readme/challenge202009/20200919_pacman_todo_1.gif" width="300">
<img src="https://github.com/flutterTaipei/FlutterBrunchChallenge/blob/feature/20200919_pacman/readme/challenge202009/20200919_pacman_done.gif" width="300">

#### 最終樣貌
<img src="https://github.com/hl3hl3/FlutterBrunchChallenge/blob/feature/20200919_pacman/readme/challenge202009/20200919_pacman_0_final.png" width="600">
需要處理的大致有：

- 作為地圖的表格
- 地圖上的元素
- 供操作的角色      

#### 1. 先做出地圖    
<img src="https://github.com/hl3hl3/FlutterBrunchChallenge/blob/feature/20200919_pacman/readme/challenge202009/20200919_pacman_1_map.png" width="600">
Tips：

- 使用 GridView 顯示表格
- 宣告 numberInRow 紀錄一行中要顯示幾格
- 宣告 numberOfSquares 紀錄整個 Grid 總共要顯示幾格
- 宣告 barrierList 紀錄路障的位置
- GridView 產 widget 時，可以走的路徑 和 路障，顯示不同 widget

#### 2. 調整地圖顯示元素    
<img src="https://github.com/hl3hl3/FlutterBrunchChallenge/blob/feature/20200919_pacman/readme/challenge202009/20200919_pacman_2_barrier.png" width="600">    
<img src="https://github.com/hl3hl3/FlutterBrunchChallenge/blob/feature/20200919_pacman/readme/challenge202009/20200919_pacman_3_map_ui.png" width="600">
<img src="https://github.com/hl3hl3/FlutterBrunchChallenge/blob/feature/20200919_pacman/readme/challenge202009/20200919_pacman_4_path.png" width="600">
Tips：

- 抽出 顯示路障用的 Widget
- 抽出 顯示路徑用的 Widget

#### 3. 加上角色和動作！可以玩啦！！
<img src="https://github.com/hl3hl3/FlutterBrunchChallenge/blob/feature/20200919_pacman/readme/challenge202009/20200919_pacman_5_player.png" width="600">
Tips：

- 加入角色使用的圖檔
- 宣告變數紀錄角色目前的位置
- 新增 點擊後能開始遊戲的按鈕事件
- 使用 Timer.periodic 定時更新內容
- 往右走 = 只要不撞到路障，即可角色位置 index + 1 後 setState
- 透過手勢操作改變角色行進方向，使用 GestureDetecture，onVerticalDragUpdate、onHorizontalDragUpdate (宣告一個變數紀錄要走的方向）
- 往左走 = 角色 index - 1
- 往上走 = index - numberInRow
- 往下走 = index + numberInRow
- 讓角色跟著行進方向轉動（Transform.rotate，angle 可用 pi & pi/2 兜出來）
- 宣告一個 List 紀錄有食物的路徑，並判斷角色 index 與食物的位置相符時，移除 List 中的食物（代表吃掉了）

還有 Ghost 的部分，不過到了這邊，也差不多可以玩啦！！    
    

## Flutter Brunch 2020/08 小挑戰
#### 1. Widget 練習：Drawer
- 幫頁面加上 Drawer。參考： https://flutter.dev/docs/cookbook/design/drawer
- 可能用到的 Widget：Drawer、ListView、DrawerHeader、ListTile、Text、Icon、BoxDecoration
<img src="https://github.com/hl3hl3/FlutterBrunchChallenge/blob/develop/readme/challenge_202008_3.png" width="300">

#### 2. 動畫練習：幫 App 介紹區塊加上動畫效果
- 參考：https://flutter.dev/docs/cookbook/animation/opacity-animation
- 先把所在 Widet 轉成 StatefulWidget
- 幫介紹區塊加上點擊事件
- 點擊時修改狀態並 setState

#### 3. 點擊開啟 Drawer
- 宣告一個型別為 GlobalKey<ScaffoldState> 的變數，建議名稱：_scaffoldKey
- 將 Scaffold 的 key 設定為宣告的 _scaffoldKey
- 幫 小挑戰區塊文字 加上點擊事件（用 GestureDetector？ 或整塊換成 RaisedButton? 或其他？）
- 點擊事件中  `_scaffoldKey.currentState.openDrawer();` 
- setState()   
<img src="https://github.com/hl3hl3/FlutterBrunchChallenge/blob/develop/readme/challenge_202008_0.gif" width="300">
  
#### 4. 換成自己喜歡的顏色吧！
<img src="https://github.com/hl3hl3/FlutterBrunchChallenge/blob/develop/readme/challenge_202008_2.png" width="300">
