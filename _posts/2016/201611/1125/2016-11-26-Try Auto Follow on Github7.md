---
layout: post
comments: true
title: Try Auto Follow on Github
---

```
var FollowButtomCN = 'btn btn-sm  js-toggler-target';
var items = document.getElementsByClassName(FollowButtomCN);
var nextpg = document.getElementsByClassName('next_page');
(function nextPg() {
  var btCounter = 0;
  var i = -1;
  (function nextBt() {
    i++;
    setTimeout(function() {
      if (i++ < items.length ) {
        items[i].click();
        nextBt();
      }else{
        nextpg.click();
        nextPg();
      }
    }, 3000);
  })();
})();

```

follow one page
```
var FollowButtomCN = 'btn btn-sm  js-toggler-target';
var items = document.getElementsByClassName(FollowButtomCN);
var btCounter = 0;
var i = -1;
(function nextBt() {
  i++;
  setTimeout(function() {
    if (i++ < items.length ) {
      items[i].click();
      nextBt();
    }
  }, 5000);
})();
```

```
var items = document.getElementsByClassName('btn btn-sm  js-toggler-target');
var btCounter = 0;
var i = -1;
(function nextBt() {
  i++;
  setTimeout(function() {
    if (i++ < items.length ) {
      items[i].click();
      nextBt();
    }
  }, 2000);
})();
```

$('.btn.btn-sm.js-toggler-target').click();

var items = document.getElementsByClassName('btn btn-sm  js-toggler-target');

click_follow(i){
  items[i].click();
};

for (var i = 0; i < items.length; i++) {
}


var items = document.getElementsByClassName('btn btn-sm  js-toggler-target');
var myVar = setInterval(myTimer, 1000);
function myTimer(i) {
  items[i].click();
}

var items = document.getElementsByClassName('btn btn-sm  js-toggler-target');
for (var i = 0; i < items.length; i++){
  setInterval(function () { items[i].click(); }, 1000);
}


setInterval(function () { document.getElementsByClassName("btn btn-sm  js-toggler-target").click(); }, 1000);

var items = document.getElementsByClassName('btn btn-sm  js-toggler-target');

function sleep(milliseconds) {
  var start = new Date().getTime();
  for (var i = 0; i < 1e7; i++) {
    if ((new Date().getTime() - start) > milliseconds){
      break;
    }
  }
}

for (var i = 0; i < items.length; i++){
    sleep(3000);
    items[i].click();
}

var items = document.getElementsByClassName('btn btn-sm  js-toggler-target');
var btCounter = 0;
var i = -1;
(function nextBt() {
  i++;
  setTimeout(function() {
    if (i++ < items.length ) {
      items[i].click();
      nextBt();
    }
  }, 1500);

})();

&& items[i].value == 'Follow'

&& items[i].value == 'Follow'

var myVar = setInterval(myTimer, 1000);
function myTimer(i) {
  items[i].click();
}

