---
layout: post
comments: true
title: 如何幫Rails Application套版
tags: rails
---


我在去年曾經寫過一篇幫Rails網站套版的文章([傳送門](http://kenny-on-rails.blogspot.tw/2015/10/rorrailsbootstrap-template.html))，基本上那篇文章描述的方法並不算正確(面壁中)，而且那個版也有針對Rails開發gem，所以使用的方法並不是一般套版的方式。只是市面上有許多漂亮還免費的bootstrap版可以用，卻又沒有gem可以用的，所以在參考一些文章後補寫一篇

<strike>贖罪文</strike>正確的套版方式。


## 套版開始1.首先你要先有一個bootstrap 版，可以在Google上隨便找就可以找到一堆免費的版，真的要精緻一些的可以上[wrapbootstrap](https://wrapbootstrap.com/)上面買，折合台幣大約300~500元，也不算貴。本文使用的版是[ALMSAEED STUDIO](https://almsaeedstudio.com/)所推荐的[10 Free Responsive Bootstrap Templates For 2016](https://almsaeedstudio.com/blog/10-Free-Responsive-Bootstrap-Templates-For-2016)中的Photography。

[![](https://3.bp.blogspot.com/-fAymdeY_NYQ/V4VuHWQb7pI/AAAAAAAAREY/_6veANAQve0E4CNqGMO0AHUDzqLtIByEgCLcB/s320/%25E6%2593%25B7%25E5%258F%2596%25E9%2581%25B8%25E5%258F%2596%25E5%258D%2580%25E5%259F%259F_008.png)](https://3.bp.blogspot.com/-fAymdeY_NYQ/V4VuHWQb7pI/AAAAAAAAREY/_6veANAQve0E4CNqGMO0AHUDzqLtIByEgCLcB/s1600/%25E6%2593%25B7%25E5%258F%2596%25E9%2581%25B8%25E5%258F%2596%25E5%258D%2580%25E5%259F%259F_008.png)

2.接著你也要有一個要套版的Rails Application，如果在開發時就已經有套basic bootstrap，那會省事很多。


3.在把下載回來的版解壓縮後，裡面會包含CSS、Javascript、圖檔跟幾個拿來demo的html，通常我會習慣把原本的Template完整的還原在自己的Web App上，而不是先挑自己想要在實作，這是因為一方面我對Fontend並沒有很熟悉，沒有信心只套部份的樣板，另一方面也可以互相比較原生版與套版後的差異。


4.在原生的rails app/vendor/assets下會有javascripts與stylesheets兩個folder，這裡我針對要套版的template在vendor/assets/下新增了一個custom的folder(這名稱沒有固定，可以隨意指定)，然後將素材複製到custom中。


5.因為rails會將/app/assets/與/vendor/assets/的下一層自動納入assets path，所以在上一個步驟建立的custom會被include進來，

可以在console使用Rails.application.config.assets.paths指令來檢視

[![](https://1.bp.blogspot.com/-Uo-xnv9b00g/V46nP35kakI/AAAAAAAARFI/uVbWrqf4ddc_LVraIEqry_gFYuZI3h3BwCLcB/s400/%25E6%2593%25B7%25E5%258F%2596%25E9%2581%25B8%25E5%258F%2596%25E5%258D%2580%25E5%259F%259F_008.png)](https://1.bp.blogspot.com/-Uo-xnv9b00g/V46nP35kakI/AAAAAAAARFI/uVbWrqf4ddc_LVraIEqry_gFYuZI3h3BwCLcB/s1600/%25E6%2593%25B7%25E5%258F%2596%25E9%2581%25B8%25E5%258F%2596%25E5%258D%2580%25E5%259F%259F_008.png)


6.所以接下來只要把css跟javascript引用近來就可以了，在app/assets/javascripts/application.js中添加

<pre class="prettyprint linenums prettyprinted" data-original-code="//= require gallery/jquery.blueimp-gallery.min.js
//= require mobile/touchSwipe.min
//= require respond/respond
//= require wow/wow.min
//= require script
" data-snippet-id="ext.6470e5c150792d42cee8d395b09742d3" data-snippet-saved="false" data-codota-status="done">
1.  //= require gallery/jquery.blueimp-gallery.min.js
2.  //= require mobile/touchSwipe.min
3.  //= require respond/respond
4.  //= require wow/wow.min
5.  //= require script
</pre>

在app/assets/stylesheets/application.css中添加

<pre class="prettyprint linenums prettyprinted" data-original-code="@import "animate/animate";
@import "animate/set";
@import "gallery/blueimp-gallery.min";
@import "style";
" data-snippet-id="ext.2bde4442ea7295de3732fd3eb698ff18" data-snippet-saved="false" data-codota-status="done">
1.  @import "animate/animate";
2.  @import "animate/set";
3.  @import "gallery/blueimp-gallery.min";
4.  @import "style";
</pre>

  7.接下來我的作法會把template中的html code貼上來，開始檢視看看哪裡有沒套上來的，大多會是css參考的路徑或是圖片路徑錯誤，修正後在跟原template比對，確認沒問題後就可以開始加工版面了。

套版前

[![](https://2.bp.blogspot.com/-zw9kSGm47ug/V46rgg0MtQI/AAAAAAAARFg/7U_0DWFCjNkrOBH8HB9boHnKFKhHT4hdgCLcB/s400/%25E6%2593%25B7%25E5%258F%2596%25E9%2581%25B8%25E5%258F%2596%25E5%258D%2580%25E5%259F%259F_011.png)](https://2.bp.blogspot.com/-zw9kSGm47ug/V46rgg0MtQI/AAAAAAAARFg/7U_0DWFCjNkrOBH8HB9boHnKFKhHT4hdgCLcB/s1600/%25E6%2593%25B7%25E5%258F%2596%25E9%2581%25B8%25E5%258F%2596%25E5%258D%2580%25E5%259F%259F_011.png)
套版後

[![](https://3.bp.blogspot.com/-IXNwwHECNmQ/V46q-LVJpuI/AAAAAAAARFY/euk7FFcjFE0yAyWWJnqCElBPqFtR_CE0QCLcB/s400/%25E6%2593%25B7%25E5%258F%2596%25E9%2581%25B8%25E5%258F%2596%25E5%258D%2580%25E5%259F%259F_010.png)](https://3.bp.blogspot.com/-IXNwwHECNmQ/V46q-LVJpuI/AAAAAAAARFY/euk7FFcjFE0yAyWWJnqCElBPqFtR_CE0QCLcB/s1600/%25E6%2593%25B7%25E5%258F%2596%25E9%2581%25B8%25E5%258F%2596%25E5%258D%2580%25E5%259F%259F_010.png)

## 參考連結

* [How to load vendor asset folder in Rails 4?](http://stackoverflow.com/questions/25983283/how-to-load-vendor-asset-folder-in-rails-4)
* [Rails 4 上 Asset 的一團爛賬](http://blog.xdite.net/posts/2014/01/29/rails4-asset-mess)

