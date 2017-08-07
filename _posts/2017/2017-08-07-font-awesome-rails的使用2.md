---
layout: post
comments: true
title: font-awesome-rails的使用
---

介紹
使用font-awesome-rails可以為網頁匯入美術資源，用圖示來代替文字，這樣可以大大提高前段頁面的美化

使用方法
1.在Gemfile中加入font-awesome-rails
```
# Gemfile
gem 'font-awesome-rails'
```
2.在application.scss中匯入font-awesome資源
```
# app/assets/stylesheets/application.scss
@import "font-awesome"
```
3.去font-awesome官網呼叫圖示
`<i class="fa fa-address-book" aria-hidden="true"></i>`

