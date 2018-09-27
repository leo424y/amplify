---
layout: post
comments: true
title: 用 Line Notify 做一個元氣彈書籤
---



- 申請 LINE Notify 權杖

  "https://notify-bot.line.me/zh_TW/"

- 個人頁面>發行「權杖」> 指定權杖名稱 ( 傳送通知訊息時所顯示的名稱 ) > 選擇是要一對一接收，或是讓群組也可以接收通知。權杖只出現一次，需好好保管。

- 建立Script

  "https://script.google.com/home"

- 貼上Script，填入你的權杖

```

function doPost(e) {



      var param = e.parameter;

      var msg = param.msg;



      UrlFetchApp.fetch('https://notify-api.line.me/api/notify', {

          'headers': {

              'Authorization': 'Bearer ' + '你的權杖',

          },

          'method': 'post',

          'payload': {

              'message':msg

          }

      });

  }

```

- Publish > Deploy as web app > Project version(專案版本) 每次修改都要選 New(新增) > 存取權選 Anyone,even anonymous 任何人包括匿名>更新 update

- 得到APP_KEY

`https://script.google.com/macros/s/APP_KEY/exec`

- 製作功能性書籤

  "https://bookmarkify.it"

- Name it 填上書籤的名字 > 換APP_KEY成你自己的，然貼到Javascript it 框框裡

```

var url_string = window.location.href; var jq = document.createElement('script'); jq.src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"; document.getElementsByTagName('head')[0].appendChild(jq);jQuery.noConflict();jQuery.post('https://script.google.com/macros/s/APP_KEY/exec', {msg: url_string}, function(e){ console.log(e); });

```

- 得到書籤網址，就能分享出去囉！使用你的書籤的朋友，都能把正在瀏覽的頁面直接 Line 給你！https://bookmarkify.it/你的序號

- 如果使用 Chrome可能不能直接拉到書籤列，將下面這段的「你的序號」換成自己的，接著新增到書籤即可

```

javascript:(function(){window.s0=document.createElement('script');window.s0.setAttribute('type','text/javascript');window.s0.setAttribute('src','https://bookmarkify.it/bookmarklets/你的序號/raw');document.getElementsByTagName('body')[0].appendChild(window.s0);})();

```

- 參考

  "https://www.oxxostudio.tw/articles/201806/line-notify.html"

