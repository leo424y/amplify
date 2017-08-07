---
layout: post
comments: true
title: Rails-Gem-使用 pow配置開發環境的快捷方式
---


摘要
通常我們在 mac 上配置rails開發環境時候,需要經常找自己的各個項目檔案,並要經常來回切換資料夾,來回啟停伺服器,pow 可以幫助我們建立各開發環境的連結,快速訪問和切換

使用
安裝 pow,只要一條命令就可以全部安裝好了.

`curl get.pow.cx | sh`
到 .pow下面可以建立各項目軟連線用於快速訪問.

`cd ~/.pow`
例如建立一個到~/denv/mjschool 的快捷方式

`ln -s ~/denv/mjschool`
再建立到一個到~/denv/Lawfirm的快捷方式

`ln -s ~/denv/LawFirm`
此時再訪問兩個項目就沒有必要一定要切到項目資料夾中啟server 了,直接使用`項目名.dev`就可以訪問了


