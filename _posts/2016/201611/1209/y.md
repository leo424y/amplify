5 個 JavaScript 面試常見問題

以下內容為閱讀 [5 Typical JavaScript Interview Exercises](http://www.sitepoint.com/5-typical-javascript-interview-exercises/) 文章後的觀後感。

這幾個問題說基本也滿基本的但是有些地方一不小心可能就會犯錯！

## [](https://yulun.me/2014/5-typical-javascript-interview-questions/#問題一：Scope "問題一：Scope")問題一：Scope

<figure class="highlight js">
    col 1
    ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    <pre data-original-code="(function() {

      var a = b = 5;

    })();



    console.log(b);

    " data-snippet-id="ext.b528ff3e769cc945fd7838d3ca73684f" data-snippet-saved="false" data-codota-status="done">
    (function() {
      var a = b = 5;
    })();

    console.log(b);
    </pre>
</figure>

請問 `console.log(b);` 印出來的結果是？

**答案**
`5`

在這個 IIFE 中，變數 `a` 使用了 `var` 關鍵字來宣告成為 local variable，而 `b` 則沒有 `var` 修飾所以宣告成為 global variable。

那如何避免這個問題呢？只需要在 IIFE 中加入 `'use strict'`，如此一來只要有任何變數試圖宣告為全域變數都會出現錯誤警告。

<figure class="highlight js">
    col 1
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    <pre data-original-code="(function() {

      'use strict';

      var a = window.b = 5;

    })();



    console.log(b);

    " data-snippet-id="ext.8c1dd24da1b7a9041fa8f54ea4370bdb" data-snippet-saved="false" data-codota-status="done">
    (function() {
      'use strict';
      var a = window.b = 5;
    })();

    console.log(b);
    </pre>
</figure>

所以假若你還是要把 `b` 宣告為全域變數 (global variable) 則可以透過 `window.b` 來指定。

## [](https://yulun.me/2014/5-typical-javascript-interview-questions/#問題二：Create-“native”-methods "問題二：Create “native” methods")問題二：Create “native” methods

擴充 String 的 method 使其能呼叫 `.repeatify(num)` 來產生重複的字串

<figure class="highlight js">
    col 1
    -------------------------------------------------
    <pre>
    console.log('hello'.repeatify(3));
    </pre>
</figure>

並且印出 `hellohellohello`

**答案**

<figure class="highlight js">
    col 1
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    <pre data-original-code="String.prototype.repeatify = String.prototype.repeatify || function(times) {

       var str = '';



       for (var i = 0; i < times; i++) {

          str += this;

       }



       return str;

    };

    " data-snippet-id="ext.3272f5c25ad0301bb36650c41af3cb2f" data-snippet-saved="false" data-codota-status="done">
    String.prototype.repeatify = String.prototype.repeatify || function(times) {
       var str = '';

       for (var i = 0; i < times; i++) {
          str += this;
       }

       return str;
    };
    </pre>
</figure>

這題應該就比較簡單了，直接從 `String.prototype` 下手，並使用 `String.prototype.repeatify || function(times)` 來避免覆寫已經存在的方法。

這個技巧很常用在一些 `shim` 的功能 (用來擴充本來瀏覽器沒有提供的功能)。

## [](https://yulun.me/2014/5-typical-javascript-interview-questions/#問題三：Hoisting "問題三：Hoisting")問題三：Hoisting

寫出以下程式碼執行結果，並說明原因。

<figure class="highlight js">
    col 1
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    <pre data-original-code="function test() {

       console.log(a);

       console.log(foo());



       var a = 1;

       function foo() {

          return 2;

       }

    }



    test();

    " data-snippet-id="ext.39e0c0f6fc84077d7440df7c499ddd56" data-snippet-saved="false" data-codota-status="done">
    function test() {
       console.log(a);
       console.log(foo());

       var a = 1;
       function foo() {
          return 2;
       }
    }

    test();
    </pre>
</figure>

**答案**
第一個 `undefined`
第二個 `2`

所有的變數 (Variable) 與 函式 (Function) 都會被往上提 hoisted 至 Function 的頂端。但是要注意的是，變數往上提**並不會一起賦值**。所以 `a` 印出來是 `undefined`，我們把上面的 code 轉換成提升後等價的 code 如下：

<figure class="highlight js">
    col 1
    ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    <pre data-original-code="function test() {

       var a;

       function foo() {

          return 2;

       }



       console.log(a);

       console.log(foo());



       a = 1;

    }



    test();

    " data-snippet-id="ext.55c7db36875cbf448ea4ace9ef94eec4" data-snippet-saved="false" data-codota-status="done">
    function test() {
       var a;
       function foo() {
          return 2;
       }

       console.log(a);
       console.log(foo());

       a = 1;
    }

    test();
    </pre>
</figure>

這樣是否更能明白了呢？其實我看這篇文章之前對於這個 `hosited` 概念十分陌生，可以參見另一篇文章 [Back to Basics: JavaScript Hoisting](http://www.sitepoint.com/back-to-basics-javascript-hoisting/)

## [](https://yulun.me/2014/5-typical-javascript-interview-questions/#問題四：How-this-work-in-JavaScript "問題四：How this work in JavaScript")問題四：How `this` work in JavaScript

寫出以下程式碼執行結果，並說明原因。

<figure class="highlight js">
    col 1
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    <pre data-original-code="var fullname = 'John Doe';

    var obj = {

      fullname: 'Colin Ihrig',

      prop: {

        fullname: 'Aurelio De Rosa',

        getFullname: function() {

           return this.fullname;

        }

      }

    };



    console.log(obj.prop.getFullname());



    var test = obj.prop.getFullname;



    console.log(test());

    " data-snippet-id="ext.eeeb132d08bf04b78196893f8f52fc29" data-snippet-saved="false" data-codota-status="done">
    var fullname = 'John Doe';
    var obj = {
      fullname: 'Colin Ihrig',
      prop: {
        fullname: 'Aurelio De Rosa',
        getFullname: function() {
           return this.fullname;
        }
      }
    };

    console.log(obj.prop.getFullname());

    var test = obj.prop.getFullname;

    console.log(test());
    </pre>
</figure>

第一個 `Aurelio De Rosa` 原錯誤答案`Colin Ihrig`

第二個 `John Doe`

JavaScript 很不一樣的一點就是 `this` 並**不是跟著 instance 走**。而是**依據誰呼叫 (invoke)** 來決定 `this` 的參考值。(這也常讓不熟稔 JS 的人嘗盡苦頭)…

第一個 `Colin Ihrig` 是因為 `getFullname()` 呼叫是由 `obj.prop` 發出，此時 `this.fullname` 即為 `obj.fullname`；而第二個 `John Doe` 則是由 `window` 呼叫 `test` 實際上是 `obj.prop.getFullname` 因此 `this.fullname === window.fullname` 於是便印出 `John Doe`。

## [](https://yulun.me/2014/5-typical-javascript-interview-questions/#問題五：call-and-apply "問題五：call() and apply()")問題五：`call()` and `apply()`

修正上面題目，要把第二個印出的答案變為 `Colin Ihrig` 該如何做？

2016.03.07 訂正:

<figure class="highlight js">
    col 1
    -------------------------------------------
    <pre>
    console.log(test.call(obj));
    </pre>
</figure>

錯誤答案:

<figure class="highlight js">
    col 1
    ------------------------------------------------
    <pre>
    console.log(test.call(obj.prop));
    </pre>
</figure>

基本上 `call()` 與 `apply()` 用法差異如下：

<figure class="highlight js">
    col 1
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    <pre data-original-code="function.call(thisArg[, argument1[, argument2[, ...]]]);
    function.apply(thisArg[, argumentArray]);


    " data-snippet-id="ext.a65d463538e33df9e173eaae8fc10c26" data-snippet-saved="false" data-codota-status="done">
    function.call(thisArg[, argument1[, argument2[, ...]]]);
    function.apply(thisArg[, argumentArray]);
    </pre>
</figure>

> 所有語法大致上與 apply() 相同，他們基本上不同處只有 call() 接受一連串的參數，而 apply() 單一的array作為參數 — [MDN](https://developer.mozilla.org/zh-TW/docs/Web/JavaScript/Reference/Global_Objects/Function/call)

以上簡單分享，自己也重新複習一遍了…Q_Q

ps. 原文的下面還有一些回覆，並且提供另一些題目。我們改天再一起來研究看看！

* http://tomhicks.github.io/code/2014/09/12/javascript-interview-questions.html


xxx
想要提升記憶力／思考力／工作能力，要鍛鍊海馬迴

多看多聽多做

<!-- content S -->

<font style="font-size:14pt"></font>

<font style="font-size:14pt"><span data-offset-key="3qjbo-0-0" style="font-family: inherit;">想要提升記憶力／思考力／工作能力，要鍛鍊海馬迴</span></font>

<font style="font-size:14pt"><span data-offset-key="tc5q-0-0" style="font-family: inherit;"><br data-text="true"></span></font>

<font style="font-size:14pt"><span data-offset-key="3r85i-0-0" style="font-family: inherit;">文／Ｚｅｎ大（歡迎分享）</span></font>

<font style="font-size:14pt"><span data-offset-key="fjvq2-0-0" style="font-family: inherit;"><br data-text="true"></span></font>

<font style="font-size:14pt"><span data-offset-key="7o6ku-0-0" style="font-family: inherit;">海馬迴是人腦用來吸收與整理資訊的器官，海馬迴有個特色是，越用就會越多越強，越不用就越萎縮退化甚至最後壞死（附帶一說，睡眠是人腦用來整理資訊的時刻，海馬迴在此時展開資訊整理，將吸收的資訊化為記憶儲存在腦中，如果不睡覺，海馬迴無法運作，無法整理記憶，記憶資訊能力將會崩壞，另外，人也會開始產生幻覺，因為海馬迴被迫在人清醒的時候展開資訊整理工作，但這會傷害海馬迴）！</span></font>

<font style="font-size:14pt"><span data-offset-key="e0nnp-0-0" style="font-family: inherit;"><br data-text="true"></span></font>

<font style="font-size:14pt"><span data-offset-key="b9kh9-0-0" style="font-family: inherit;">那麼，鍛鍊強化海馬迴的方法是什麼？</span></font>

<font style="font-size:14pt"><span data-offset-key="evumo-0-0" style="font-family: inherit;"><br data-text="true"></span></font>

<font style="font-size:14pt"><span data-offset-key="9vm4k-0-0" style="font-family: inherit;">大量吸收資訊，活用所吸收的資訊，人腦為了活用資訊就必須整理所吸收的資訊，海馬迴在不斷使用中逐漸強化升級。</span></font>

<font style="font-size:14pt"><span data-offset-key="ac142-0-0" style="font-family: inherit;"><br data-text="true"></span></font>

<font style="font-size:14pt"><span data-offset-key="525l3-0-0" style="font-family: inherit;">（附帶一說，運動後二十四小時內使用海馬迴，可以提升效率）</span></font>

<font style="font-size:14pt"><span data-offset-key="4u1v7-0-0" style="font-family: inherit;"><br data-text="true"></span></font>

<font style="font-size:14pt"><span data-offset-key="brpdg-0-0" style="font-family: inherit;">另外一個方法，就是情緒高漲或低落時，海馬迴和掌管情緒的大腦部門連動，也會強化記憶與資訊整理，所以我們特別容易就能記得情緒特別高漲或低落的時刻的時候發生的事情！</span></font>

<font style="font-size:14pt"><span data-offset-key="cn24l-0-0" style="font-family: inherit;"><br data-text="true"></span></font>

<font style="font-size:14pt"><span data-offset-key="4a52c-0-0" style="font-family: inherit;">大量資訊輸入靠閱讀，大量資訊產出靠寫作（將想法轉化為文字符號），且利用方法提高閱讀和寫作的速度與數量，也能強化海馬迴的能力！</span></font>

xxx
don't forget

### 如何吸收大量資訊卻不會遺忘？

<!-- content S -->

<font style="font-size:14pt"></font>

<font style="font-size:14pt"><span data-offset-key="cllte-0-0" style="font-family: inherit;"><b>如何吸收大量資訊卻不會遺忘？</b></span></font>

<font style="font-size:14pt"><span data-offset-key="86fmd-0-0" style="font-family: inherit;"><br data-text="true"></span></font>

<font style="font-size:14pt"><span style="font-family: inherit;">文/Zen大（歡迎分享）</span></font>

<font style="font-size:14pt"><span data-offset-key="duu93-0-0" style="font-family: inherit;"><br data-text="true"></span></font>

<font style="font-size:14pt"><span data-offset-key="8221l-0-0" style="font-family: inherit;">首先 你要有明確的問題意識，知道自己現在正在接收哪一個領域的資訊？</span></font>

<font style="font-size:14pt"><span data-offset-key="6c73g-0-0" style="font-family: inherit;"><br data-text="true"></span></font>

<font style="font-size:14pt"><span data-offset-key="9veaf-0-0" style="font-family: inherit;">其次 你要有分類資訊的完整架構，對於該領域並非一無所知！</span></font>

<font style="font-size:14pt"><span data-offset-key="bl3gl-0-0" style="font-family: inherit;"><br data-text="true"></span></font>

<font style="font-size:14pt"><span data-offset-key="et19m-0-0" style="font-family: inherit;">第三 具備足以嫁接/鑲嵌/定位/連結新資訊的既有知識庫！</span></font>

<font style="font-size:14pt"><span data-offset-key="7ujsh-0-0" style="font-family: inherit;"><br data-text="true"></span></font>

<font style="font-size:14pt"><span data-offset-key="cj3ap-0-0" style="font-family: inherit;">當一個資訊進入大腦，能夠順利與其他資訊和資訊背後的架構與主題連接時，就能順利歸檔，進行消化吸收整理歸納反芻乃至再生產的工作，將新資訊與舊資訊與資訊系統融合，內化為生命血肉的一部分。</span></font>

<font style="font-size:14pt"><span data-offset-key="c3hc7-0-0" style="font-family: inherit;"><br data-text="true"></span></font>

<font style="font-size:14pt"><span data-offset-key="4ff72-0-0" style="font-family: inherit;">沒有上述三點者，資訊進入大腦後創造了一個位置卻無法跟其他資訊連結，也無法使用時，最後就會被大腦視為無用而排除消滅！</span></font>
