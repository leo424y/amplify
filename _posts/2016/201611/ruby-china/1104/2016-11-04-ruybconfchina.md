---
layout: post
title: Rubyconf China 2016
---
> 成都重新定義了不辣

這一屆選擇成都是非常明智的, 300+ 的參與人群證明大家是很熱愛這裡的 😃

事實證明, Ruby 社區一直是一個友愛, 認真, 不斷成長的社區. 加入 Ruby, 就加入了整個社區, 分享整個社區的資源和幫助.

我在這裡主要講講主題演講的情況與內容, 以便沒有時間或機會參加的朋友瞭解概況.

## 主題一:  Rei 分享的 Turbolinks 與 關於它的 Native 方案

https://speakerdeck.com/chloerei/ji-yu-turbolinks-de-kua-ping-tai-kai-fa

* Rails 的哲學 Omakase
* Turbolinks 對比前後端分離框架的速度優勢( RubyChina 800ms VS Discourse 2.8s )
* Turbolinks Native = Native + Web

優勢: 可複用 responsive web page, 大量節省開發成本
缺點: 仍然需要 Native Code 配合. web 與 native 交互是一個不爽的點.

總而言之, 這是一個 Rails 工程師值得學習的點. 現在 RubyChina 的 iOS 版與 Android 版均已發佈. 開源代碼也已經釋出. 對大家而言是一個不錯的充電的方向之一.

## 主題二: 知人( 一個的HR使用的 [企業級] 產品 )模型構建經驗分享

https://speakerdeck.com/zchar/zhi-ren-shi-ru-he-suan-gong-zi-de

前提:

每個公司對於工資單的計算都不一樣.
沒有一個通用的模型進行計算工資

模型設計:

一切皆可重算

原始數據 + 計算規則 = 工資單

計算規則可以用一系列策略模型進行抽象. 目前日活 10 萬+.

除模型, 還講了一些關於內部用的 rails generator 等經驗.

我個人有不錯的收穫: 當遇到一些不明的規則的需求時, 如何設計你的應用數據模型.

## 主題三: 陳金洲關於重構的主題 - 重新理解和設計 RESTful

https://speakerdeck.com/mechiland/reconsider-rest-chong-gou-jian-da-xing-railsying-yong-de-fang-shi

金洲是一個吐嘈大師, 這點體現在了演講了各個環節 😃

這個 REST 的主題是一個很遠之前的觀點, 大約在 2007 年 DHH 就有一篇這方面的討論. 但漸漸地, 大家又忘了它的本來面目.

純正的 REST 就是 CRUD + resources, 如何將 CRUD 之外的操作也抽象為資源, 是關鍵. 做的好, 就可以讓每個 controller 清晰乾淨.

在這個 slide, 有一個新觀點: 架構就是剋制 - 陳金洲

我個人觀點:  API 接口的設計是一門藝術, 不是每一個程序員都能把它搞好, 尤其是BAT那些人. REST 雖好, 但也不建議過度極端. 否則資源的抽象是一個非常有挑戰的事. 並且 REST 適合對外的API, 但對內, GraphQL 這種思路反而能讓用戶體驗更好.

## 主題四: I18n 經驗談

https://speakerdeck.com/danielglh/da-zao-guo-ji-hua-chan-pin-strikinglyde-i18nshi-jian

Rails 原生的 i18n 解決方案的優缺點, 以及為什麼要選用 gettext 方案進行 i18n 設計.

如何構建一個全球化的 i18n 流程, 包括團隊招募, 流程制定等.

Rails 原生的方案不錯, 但也不適用於大規模的 i18n 團隊需求.

相信這個主題對於有這方面需求的團隊將會很有幫助.

## 主題五: Rails 應用廋身

https://speakerdeck.com/xiewenwei/ru-he-gei-rails-ying-yong-jian-fei-bo-he-wei-fu-wu-hua-shi-jian

namespace
抽離 gem
微服務化

微服務化的優點與缺點, 如何應用

謝文威是一個資深的講師, 將這些問題一一個深入淺出做了分析, 這幾年有一種把微服務神話的感覺, 但實踐來看, 這個也不是萬能的方案. 有時候反而導致了更多的複雜性.

對於 Rails 應用開始複雜起來後的處理方向做了探討, 非常具備思考性.

## 主題六: 定位 Rails 內存洩漏的問題

https://speakerdeck.com/42thcoder/zhui-zong-rails-ying-yong-zhong-de-nei-cun-xie-lu

講述如何定位到 Timeout.timeout 方法 在 Redis 某個版本中導致的內存洩漏問題

這是一個非常技術化的話題, 對於一個致力於提高個人技術能力的同學來說, 剖析問題的根因的思路是必不可少的. 這也讓我想到幾年前的自己也是經常沉迷於具體的某個技術難點.

但我聽完 timeout 導致洩漏的原因還是差了最後一點點深度... 希望能進一步析出為什麼短時間 timeout 對象集中創建而不釋放...

這種追根的思路希望對聽眾們有幫助.

## 主題七: Elixir 的介紹

https://speakerdeck.com/qhwa/what-can-we-rubyists-learn-from-elixir

Elixir 語法與 Ruby 的異同. 介紹了 Erlang 的進程模型, service.

什麼是 OTP

有人評論, Elixir 除了太新之外, 沒有其他缺點. 這個介紹初步給大家普及了 Elixir 的語法與特點.

不過我認為, 在 RubyConf 這樣的大會可以更多分享一些思想性的內容. 畢竟演講時間不長, 大家也沒有充分準備.

## 主題八: 在 Rails 下如何給用戶提供 API, 技術選型等

https://speakerdeck.com/poshboytl/building-api-for-the-rest-of-us

對比了 Rails API 和 Grape.

如何做 auth

總結: 沒有最好的方案, 只有更適合的場景.

Terry Tai 也是個老司機了, 講的非常流利.  Rails 中提供 API 在社區中也是老話題了, 之前就有很多討論. 這次做了集中的討論和方向的思考. 這種思考方式是每一個老司機 Rails 工程師應該有的.

也希望這個演講能夠讓你掌握到 Rails 中有哪些個方案來實現 API 編寫. 以及各種利弊.

第二天

## 一.  Deppbot 自動更新你的 gem

https://speakerdeck.com/juanitofatas/how-to-build-deppbot

Juanito 是一個臺灣的同胞, 這個主題介紹瞭如何實現一個可以讓你的應用自動做 bundle update 的產品之路.

非常真誠與有效的介紹, 既分享了 deppbot 的產品本身, 也分享它本身的故事.

我也有這方面的需求, 但更新 gem 也非常依賴良好的測試覆蓋率, 不然會出現意外之外的問題.

大家一方面可以使用這個產品. 也可以瞭解一下如何做成一個產品以及背後的故事.

## 二. 如何重構

https://speakerdeck.com/xdite/refactoring-lesson-from-gpa-1-dot-4-to-gpa-3-dot-0

先估api數量
api 測試
model test
ci

Xdite 用大量的經驗實踐出來的重構之路, 相信對於一個接手爛攤子的程序員能夠解決燃眉之急 😃

注意流程, 一定是先評價工作量, 再上基本的 API 測試, 最後才去重構. 老闆是對的: 一切圍繞著商業目標.

## 三. 環境變量 Ruby 快十倍

https://speakerdeck.com/pmq20/huan-jing-bian-liang-wei-he-neng-rang-ruby-kuai-shi-bei

RUBYOPT   -rbundle/setup

bundler/setup 的執行過程

潘旻琦的主題演講非常有趣解釋了為什麼在 Rails 應用中執行 system 程序會非常慢的原因.

弄清楚 bundler 的執行過程是每一個高級 Ruby 工程師的必經之路, 希望大家可以掌握和了解它.

## 四. 介紹使用 Rails5 快速開發高體驗性的 wechat APP 的經驗

https://speakerdeck.com/windy/ru-he-li-yong-rails-zai-21-tian-dan-qiang-pi-ma-shang-xian-ge-chan-pin

這是我的主題的主旨. Rails5 在 turbolink5 和 actioncable 支援下已經變成一個完全全面的 web 開發框架, 也是極致開發效率的代表者了.

選型 Rails5 做快速的原因, 以及 Rails5 如何讓我們用低成本的方案, 並且開發出的應用是用戶極致體驗的. 都是這個主題要講述的故事.

希望對大家對 Rails5 的認識能夠更加全面.

我在這裡提出一個觀點: **每一個 Rails 工程師都應該擁有一個長期維護的項目**

ps: 我們正在啟動一個 Rails5 遠程教學產品: 80學院, [www.80academy.com](http://www.80academy.com/) 有興趣學習的同學可以來仔細看看並和我們交流.

## 五.   ActionCable 與實時交互

https://speakerdeck.com/shiningray/actioncablehe-shi-shi-jiao-hu

曹總的話題一開始我以為是我的主題的全面解讀, 後面發現並不是...

個人覺得一開始講的非常不錯, 但後面偏題了啊...

ActionCable 從接口設計上我認為是非常不錯的, 應用起來非常簡便有效. 我認為它必須是 pub/sub 方式的. 要異步的啊.

它解決的主要問題:

* 要與 Rails5 一致性, 所以可以直接 render 回 html 片斷, 和讀取 cookie
* 接口要接近 rails5 風格, 所以用了類似於 RPC 的封裝.

當然也有一些問題:

* 佈署有些複雜
* 本身也較為複雜

整體而言, 是值得為 Rails5 立本的, 有了它, Rails5 才全面和完整.

## 六. 函數式 Ruby 編程介紹

https://speakerdeck.com/jcouyang/functional-ruby

歐陽繼超的演講讓我們認識到函數式編程在 Ruby 中的體現. 不過由於個人對函數式編程理解還不深, 不做過多評論.

有興趣的朋友可以進一步瞭解.

## 七. 介紹 Ruby 在逐漸擴大規模的團隊中的應用

https://speakerdeck.com/zmbacker/da-zao-ruby-kai-fa-tuan-dui-de-hang-mu

趙明是一個電商團隊的技術負責人, 為我們分享了他在團隊中對 Ruby 方方面面的應用. 可以說他的能力非常全面, 是 Ruby 和 Rails 在團隊中深度應用的體現, 個人以為很受用.

用 Ruby 定義規範, 而不是文檔, 是一個非常好的技術化思維,

在此, 他介紹了內部用 Rails 開發自用的 、用戶系統、權限系統、基礎 API、前端框架等.

每個主題講師介紹可以直接看 [這裡](http://rubyconfchina.org/#_3), 後續官方應該會釋出每一個主題的 slide 鏈接.

以上是兩天裡主題演講的一些情況, 希望對沒能前往的朋友有所幫助.

趕忙之作, 難免有錯誤, 再更新.

再次感謝主辦方的辛苦付出.

[](https://ruby-china-files.b0.upaiyun.com/photo/2016/5adb5cdccfd32c9592a2a8bc14a40c33.jpg!large)

[![](https://ruby-china-files.b0.upaiyun.com/photo/2016/5adb5cdccfd32c9592a2a8bc14a40c33.jpg!large)](https://ruby-china-files.b0.upaiyun.com/photo/2016/5adb5cdccfd32c9592a2a8bc14a40c33.jpg!large)
