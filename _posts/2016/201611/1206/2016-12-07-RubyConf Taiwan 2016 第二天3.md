---
layout: post
comments: true
title: RubyConf Taiwan 2016 第二天
tags: 
---
* [利用Ruby撰寫勒索軟體並探討如何安全的使用密碼系統](https://2016.rubyconf.tw/#Zong-Yu%20Wu)
* [Ruby, facing the change of world-wide server-class microprocessors](https://2016.rubyconf.tw/#Luba%20Tang)
* [Building maintainable command-line tools with MRuby](https://2016.rubyconf.tw/#Eric%20Hodel)
* [Buidling HUGE web apps: Rails at 1,000,000 Lines of Code](https://2016.rubyconf.tw/#Brad%20Urani)
* [Solving your onboarding problems with Ruby](https://2016.rubyconf.tw/#Layne%20McNish)
* [利用 Sidekiq Enterprise 打造高效率與高可靠度的爬蟲系統](https://2016.rubyconf.tw/#Chien-Wei%20Chu)
* [What is the Rack Hijacking API](https://2016.rubyconf.tw/#Kiyoshi%20Nomo)
* [Large scale Rails applications](https://2016.rubyconf.tw/#Florian%20Dutey)
* [How we replaced salary negotiations with a Sinatra app](https://2016.rubyconf.tw/#Konstantin%20Hasse)

之後如有提供投影片再補充連結

<!--more-->

### [利用Ruby撰寫勒索軟體並探討如何安全的使用密碼系統](https://2016.rubyconf.tw/#Zong-Yu%20Wu)

這場說明勒索軟體如何加密電腦檔案

加密的演算法不建議 rc4, des

建議使用 AES CBC 模式或 RSA 長度大於 2048

在這場看到有趣的 gem:

[RansomRB](https://github.com/zongyuwu/RansomRB)

**務必看完說明並使用 VM 或 docker 測試，不然檔案系統被加密就 GG 了**

### [Ruby, facing the change of world-wide server-class microprocessors](https://2016.rubyconf.tw/#Luba%20Tang)

cloud server 市場 arm 有成長趨勢

Adapterive compiler = iterative compiler +workload

[Skymizer](http://skymizer.com/) 與[女人迷](https://womany.net/)合作，正在 AWS 上研究，預計未來會提供 benchmark for real-world workload

### [Building maintainable command-line tools with MRuby](https://2016.rubyconf.tw/#Eric%20Hodel)

可以透過 [mruby-cli](http://mruby-cli.org/) 跨平台編譯

[mruby](http://mruby.org/) 很像 ruby，但並不是 ruby

可以透過一些方法，加速測試

[mruby](http://mruby.org/) 提供 `bintest` 測試編譯後的執行檔

資源：

[mruby](http://mruby.org/)

[mruby-cli](http://mruby-cli.org/)

[mrbgems](http://mruby.org/libraries/)

[mruby-mtest](https://github.com/iij/mruby-mtest)

### [Buidling HUGE web apps: Rails at 1,000,000 Lines of Code](https://2016.rubyconf.tw/#Brad%20Urani)

跟自行創業不同，為企業建立網站系統，面對的挑戰是實現上千個功能，而不只是做好一件事

面對開發效率，以及客戶的需求變更，講者分享一些經驗：

Autonomy, trust.

Always start with the simplest code that works:

* Do not over-engineer
* Do not build things you do not need yet

Always start with the simplest process that works

* Simple tools
* Simple git

Code review

* Estimate style
* Meeting schedule

Encourage full stack developing.

Prioritize training

* Technical
* Business

Do not over-automate, wait until it becomes a problem.

Internal open source.

Architectural consistency

### [Solving your onboarding problems with Ruby](https://2016.rubyconf.tw/#Layne%20McNish)

如何讓團隊的新成員能夠儘早加入開發？

除了寫文件之外還有什麼能做的呢？

還記得剛上工時，第一件事就是要建立開發環境，這通常都要弄上一整天

_Automate all the things_

像是寫個 `install.sh`  或是 `rake` !!!

這裡有一些資源提供參考：

[Scripts To Rule Them All](https://github.com/github/scripts-to-rule-them-all)

[Laptop - A script to set up an macOS laptop for web development.](https://github.com/thoughtbot/laptop)

[Vagrant](https://www.vagrantup.com/)

在開發方面可以提供 git pre-push hooks，提醒新成員開發規範

給予新成員一些小且能快速取得成就感的任務，能使他更快融入團隊的開發環境

想想還有什麼能做的呢？

### [利用 Sidekiq Enterprise 打造高效率與高可靠度的爬蟲系統

](https://2016.rubyconf.tw/#Chien-Wei Chu)

目前台灣上市股票有 2000 多家公司，每家都要提供 1000 多種數據給使用者

而且這 1000 多種數據的更新頻率不一樣

過去只依賴 `cron`，效率不夠好，資源利用也有問題

後來選擇了用 [sidekiq enterprice](http://sidekiq.org/)

[sidekiq](http://sidekiq.org/) 有三種版本

* [sidekiq (OSS)](http://sidekiq.org/)
* [sidekiq pro](http://sidekiq.org/)
* [sidekiq enterprise](http://sidekiq.org/)

建立一張資料表紀錄每個任務的下次開始執行的時間，再利用 `cron` 每天定時從表中取出需要開始執行的任務，放進 [sidekiq](http://sidekiq.org/) 的 Queue 中

透過 enterprice 版本所提供的功能，可以解決像是每秒連線數上限的任務排程問題

透過 proxy server 變更來源ip 來突破目標網站的 ip 封鎖

### [What is the Rack Hijacking API](https://2016.rubyconf.tw/#Kiyoshi%20Nomo)

這場演講我跟不太上，就自行上網找資料了

[參考資料](http://old.blog.phusion.nl/2013/01/23/the-new-rack-socket-hijacking-api/)

程式碼：

<figure class="figure-code code">
    <figcaption></figcaption>

    <pre data-original-code="# file: config.ru

    # encoding: utf-8

    require 'thread'

    # Streams the response "Line 1" .. "Line 10", with

    # 1 second sleep time between each line.

    #

    # Non-Phusion Passenger users may have to turn off their

    # web servers' buffering options for streaming to work.

    # Phusion Passenger 4 users don't have to do anything, it

    # works out-of-the-box thanks to our real-time response

    # buffering feature.

    app = lambda do |env|
      # Fully hijack the client socket.

      env['rack.hijack'].call
      io = env['rack.hijack_io']
      begin
        io.write("Status: 200\r\n")
        io.write("Connection: close\r\n")
        io.write("Content-Type: text/plain\r\n")
        io.write("\r\n")
        10.times do |i|
          io.write("Line #{i + 1}!\n")
          io.flush
          sleep 1
        end
      ensure
        io.close
      end
    end

    run app
    " data-snippet-id="ext.3672109f32c17eaabf4ddd7932b43cb6" data-snippet-saved="false" data-codota-status="done">
    \# file: config.ru\# encoding: utf-8require 'thread'

    \# Streams the response "Line 1" .. "Line 10", with
    \# 1 second sleep time between each line.
    \#
    \# Non-Phusion Passenger users may have to turn off their
    \# web servers' buffering options for streaming to work.
    \# Phusion Passenger 4 users don't have to do anything, it
    \# works out-of-the-box thanks to our real-time response
    \# buffering feature.
    app = lambda do |env|
      \# Fully hijack the client socket.
      env['rack.hijack'].call
      io = env['rack.hijack_io']
      begin
        io.write("Status: 200\r\n")
        io.write("Connection: close\r\n")
        io.write("Content-Type: text/plain\r\n")
        io.write("\r\n")
        10.times do |i|
          io.write("Line \#{i + 1}!\n")
          io.flush
          sleep 1
        end
      ensure
        io.close
      end
    end

    run app
    </pre>
</figure>

執行

<figure class="figure-code code">
    <pre data-original-code="$ rackup
    Puma starting in single mode...
    * Version 3.6.0 (ruby 2.2.5-p319), codename: Sleepy Sunday Serenity
    * Min threads: 0, max threads: 16
    * Environment: development
    * Listening on tcp://localhost:9292
    " data-snippet-id="ext.8bc230eeb177b5ce042529b622559849" data-snippet-saved="false" data-codota-status="done">
    $ rackup
    Puma starting in single mode...
    * Version 3.6.0 (ruby 2.2.5-p319), codename: Sleepy Sunday Serenity
    * Min threads: 0, max threads: 16
    * Environment: development
    * Listening on tcp://localhost:9292
    </pre>
</figure>

在另一個 terminal 測試

<figure class="figure-code code">
    <pre data-original-code="$ curl http://localhost:9292
    Status: 200
    Connection: close
    Content-Type: text/plain

    Line 1!
    Line 2!
    Line 3!
    Line 4!
    Line 5!
    Line 6!
    " data-snippet-id="ext.d99740a89e6a725738c65a66ceff1baa" data-snippet-saved="false" data-codota-status="done">
    $ curl http://localhost:9292
    Status: 200
    Connection: close
    Content-Type: text/plain

    Line 1!
    Line 2!
    Line 3!
    Line 4!
    Line 5!
    Line 6!
    </pre>
</figure>

按 `CTRL + c` 跳出

### [Large scale Rails applications](https://2016.rubyconf.tw/#Florian%20Dutey)

看到了 Fat models 與 Skinny controllers

使用一些方式來重構：

* Single Responsibility Principle(SRP)
* Domain specific language
* Services
* Forms. like Model
* Policies
* Adapter model

### [How we replaced salary negotiations with a Sinatra app](https://2016.rubyconf.tw/#Konstantin%20Hasse)

[簡報](https://speakerdeck.com/rkh/how-we-replaced-salary-negotiations-with-a-sinatra-app)

談論薪資，為你的能力與貢獻給予酬勞

提到[22k夢想高飛](https://zh.wikipedia.org/wiki/22K%E5%A4%A2%E6%83%B3%E9%AB%98%E9%A3%9B)

開發了一個 sinatra salary framework

列了一張等級表，每個等級標示需符合的能力與對應的薪水

員工每年應該至少升一級

還需要考慮員工所在地區的生活品質所需要的薪資

參考[大麥克指數](https://zh.wikipedia.org/zh-tw/%E5%B7%A8%E7%84%A1%E9%9C%B8%E6%8C%87%E6%95%B8)

在這場看到有趣的資源:

[同樣生活品質所需的薪水換算](http://rkh.im/move)

[income_tax](https://github.com/rkh/income-tax)

