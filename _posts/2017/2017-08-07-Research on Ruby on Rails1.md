---
layout: post
comments: true
title: Research on Ruby on Rails
---


 (Ruby, method, Class, Rails, object)

ActiveRecord::ConnectionAdapters::TableDefinition

Adds index options to the indexes hash, keyed by column name This is primarily used to track indexes that need to be created after the table
方法與程式碼區塊（block） 為你自己學 Ruby on Rails

在 Ruby 方法裡，最後一行的執行結果會自動被回傳
在 Ruby 中如果最後一個參數是 Hash 的話，它的大括號是可以省略的
在 Ruby 執行方法，經常省略小括號，目的是為了讓程式碼看起來更不像程式碼，反而像是一般的文章
而使用驚嘆號，通常是表示使用這個方法可能會有「副作用」或「驚喜」
答案是 18，因為 Ruby 在同一個範圍內，如果遇到同名的區域變數及方法，會以區域變數優先。
其實也是可以把 Block 物件化，例如使用 Proc 類別
在通常會使用問號，慣例上是表示這個方法會回傳布林值（true 或 false）
上面這段程式碼執行之後不會有任何錯誤，但 Block 裡要執行的動作也不會執行
僅能放在方法名字的最後面
大括號的優先順序較高
Block 並不是一個方法，所以它不知道你要 Return 到哪裡去而造成錯誤
Rails 國際化 API — Ruby on Rails Guides

translate 方法接受 :scope 選項，選項的值可以包含一個或多個附加鍵，用於指定翻譯鍵（translation key）的「命名空間」或作用域：
帶有 '_html' 後綴的鍵和名為 'html' 的鍵被認為是 HTML 安全的。當我們在視圖中使用這些鍵時，HTML 不會被轉義
作為用戶，我們應該始終只訪問 I18n 模塊的公開方法
Ruby on Rails 實戰聖經 | 錦囊妙計

Rake 用來編寫任務腳本，讓我們在CLI中可以執行。它的好處在於提供良好的任務編寫結構，並且很方便設定各個任務的相依性，例如執行任務C前，需要先執行任務A、B。在 Rails 之中就內建了許多 rake 指令，除了你已經使用過的 rake db:migrate 之外，你可以輸入 rake -T 看到所有的 rake 指令。
Ruby及Rails當中的:symbol代表什麼意思？ - iT 邦幫忙::一起幫忙解決難題，拯救 IT 人的一天

Ruby在處理每一個物件時，會在記憶體中產生一個新的物件，所以每一個東西都不相同，這點可以使用object_id這個method來證明
在定義method時，Ruby會自動幫我們為method產生一個symbol
Controller 為你自己學 Ruby on Rails

使用 puts 方法把資料直接輸出在畫面上，看起來很直覺，但這樣不會有效果。事實上並不是 puts 方法不能用，它的確可以把東西印出來，只是不是印在瀏覽器上給你看到，而是印在 Rails 的 log 裡
不管是 GET 或是 POST 方式傳過來的參數，都會被收集到這個 params 裡
在 hello 方法裡要把文字輸出到瀏覽器上，不是使用 return 也不是使用 puts，而是使用 render 方法，後面的 plain 參數是指要輸出一個一般的文字內容到畫面上
計算完的結果存成實體變數 @bmi，以便讓 View 可以取用
如果這個活動網站是用 Rails 開發的，Rails 預設在處理表單的時候會檢查這個 authenticity_token 是不是由本站所產生的，如果沒有這個欄位，或是這個欄位的值經 Rails 核對後發現並不是本身所產生，就會出現這個錯誤訊息
Active Job 基礎 — Ruby on Rails 指南

Active Job 支持使用 GlobalID 作為參數。這使得任務可以傳入 Active Record 物件，而不只是需要額外處理的類別名稱或 ID
類別（Class）與模組（Module） 為你自己學 Ruby on Rails

是活在每個實體裡的變數，而且每個實體之間互不相影響
類別的名字規定必須是常數，也就是必須是大寫英文字母開頭
Ruby p vs puts vs print | Gareth Rees: Ruby on Rails and Front End Web Developer from Cardiff, Wales UK

print calls to_s on the object and spits it out to $stdout
It is similar to puts in that it adds a newline, but rather than calling to_s, p calls inspect
p can be more useful for debugging. As puts calls to_s, you can’t be exactly sure of what class an object is
puts is similar to print – calling to_s – but adds a newline to the output
ruby - Can I put hash as the first parameter in method? - Stack Overflow

To get a repeatable rule from this: always remember to use paranthesis around method calls when the first argument is a literal hash with braces.
Active Record Associations — Ruby on Rails Guides

You should use has_many :through if you need validations, callbacks or extra attributes on the join model.
A has_and_belongs_to_many association creates a direct many-to-many connection with another model, with no intervening model
The simpler way is to use has_and_belongs_to_many, which allows you to make the association directly
The second way to declare a many-to-many relationship is to use has_many :through
The simplest rule of thumb is that you should set up a has_many :through relationship if you need to work with the relationship model as an independent entity. If you don't need to do anything with the relationship model, it may be simpler to set up a has_and_belongs_to_many relationship (though you'll need to remember to create the joining table in the database).
The distinction is in where you place the foreign key (it goes on the table for the class declaring the belongs_to association), but you should give some thought to the actual meaning of the data as well
Using t.integer :supplier_id makes the foreign key naming obvious and explicit. In current versions of Rails, you can abstract away this implementation detail by using t.references :supplier instead.
使用套件（gem）讓開發更有效率 為你自己學 Ruby on Rails

如果要在 Rails 專案中使用 gem 的話，需要把要使用的 gem 標註在專案目錄下的 Gemfile
Ruby Classes and Objects

You can pass parameters to method new and those parameters can be used to initialize class variables.
A class variable belongs to the class and is a characteristic of a class. They are preceded by the sign @@ and are followed by the variable name
The initialize method is a special type of method, which will be executed when the new method of the class is called with parameters.
Local variables begin with a lowercase letter or _
The method name always preferred in lowercase letters
Class variables are not available across classes. If you want to have a single variable, which is available across classes, you need to define a global variable. The global variables are always preceded by the dollar sign ($)
Class variables are available across different objects
hat means that instance variables change from object to object. Instance variables are preceded by the at sign (@) followed by the variable name
The new method belongs to the class methods
Instance variables are available across methods for any particular instance or object
Objects are instances of the class
Model Migration 為你自己學 Ruby on Rails

因為 bin/rails db:migrate 這個指令只會針對還沒執行過的 Migration 檔案有效果，已經做過的 Migration ，再做一次是不會有反應的，所以即使修改同一個 Migration 檔再重新執行是沒用的
執行 Rollback 指令，把執行過的 Migration 倒回去
每個 Migration 都是一個描述檔案
因為 Rollback 通常會造成刪除資料表或是刪除欄位的效果，所以如果原本該資料表或該欄位已經有資料的話，請儘量不要使用 Rollback 方式來修正 Migration，建議直接再新增一個 Migration 來進行修正。
我個人比較偏好開一個 Migration 再慢慢自己寫，反正也不會慢到哪裡去
add_column 這個方法，第一個參數是「資料表名稱」（注意：不是 Model 名稱喔），第二個參數是「要新增的欄位名稱」，第三個參數是這個欄位的「資料型態」
你不需要也沒必要手動修改這個檔案
建議使用一眼就看得出意圖的寫法跟單字，日後在維護的時候比較容易依檔名就知道到底這次 Migration 做了什麼事
有了 Migration，記得要執行 rails db:migrate 指令，這樣就會把這些描述轉換成真實的資料表
Migration 是用來描述「資料庫的架構長什麼樣子」的檔案，它會隨著專案開發的過程中逐漸增加
ActionView::Helpers::TextHelper

pluralize
Updating Views | Ruby on Rails 5 Basics | Treehouse

it takes the "post" object we passed in
Following the name of the partial is a hash that sets up local variables for use within the partial. So this will make the @post instance variable available within the partial as the "post" local variable.
The underscore at the start of the file name indicates that a file holds a partial template
When "render" is called from either of these templates, it looks up a "partial". "Partial" is short for "partial view". And it's this partial that contains the HTML code for the form.
The "f" variable here will hold a Ruby object representing the HTML form. We can call methods on that object to add elements to the HTML form.
When calling "render", you can leave the underscore and the ".html.erb" extension off. Rails can add those automatically. That leaves just "render 'form'".
You can take the HTML code that's identical between two templates, and move it to a partial view.
Ruby Syntactic Sugar: Ruby Study Notes - Best Ruby Guide, Ruby Tutorial

syntactic sugar to refer to special rules that let you write your code in a way that doesn't correspond to the normal rules but that is easier to remember how to do and looks better
Ruby allows you to define methods that end with an equal sign (=)
For Loops | Ruby Loops | Treehouse

Most Ruby programmers don't use the for loop very often, instead preferring to use an "each" loop and do iteration. The reason for this is that the variables used to iterate in the for loop exist outside the for loop, while in other iterators, they exist only inside the block of code that’s running
It's important to note that the variable will exist outside of the for loop after it runs
Module: Enumerable (Ruby 2_4_0)

The inject and reduce methods are aliases. There is no performance benefit to either.
Can someone explain Ruby's use of pipe characters in a block? - Stack Overflow

the only difference is the block is defined on the fly and not stored
Tokens between the pipe are the arguments of this block
Braces define an anonymous function, called a block
What's returned depends on the method requiring the block
We use anonymous blocks because the majority of functions passed as a block are usually specific to your situation and not worth defining for reuse
How To Setup Ruby on Rails with Postgres | DigitalOcean

Rails expects the name of the database user to match the name of the application, but you can easily change that if need be
Why does 'puts bank_account' return the value of the overwritten to_s method? | Treehouse Community

By default, Ruby returns an object's class with the object id as a to_s method unless you specify a to_s method
Model 驗證及回呼 為你自己學 Ruby on Rails

資料驗證這件事在 Rails 的 MVC 三分天下的架構中，Controller 跟 Model 都可以做這件事，要在 View 裡寫 JavaScript 做檢查也可以，但這件事如果交給 Controller 或 View 來做的話，一來會讓程式碼的邏輯變得更複雜，二來這個驗證也不容易被重複使用，也不容易被測試，所以資料機制寫在 Model 裡是比較合理而且單純的
其實上不用寫入資料表也可以知道這筆資料是否有效
before_save 跟 before_create 的差別，在於 before_save 是每次存檔的時候都會經過，但 before_create 只有在「新增」的時候才會觸發
要寫這樣的驗證器需要符合 Rails Validator 的命名規則
資料在要存到資料表的過程中，其實不是直接把資料放進去這麼簡單
有驚嘆號版本的，如果驗證未通過會產生錯誤訊息，而沒有驚嘆號版本則僅會回傳該 Model 的一個空物件
Why can you write #{name} instead of #{@name} when doing the string interpolation? | Treehouse Community

Local variables begin with a lowercase letter or _
ActionView::Helpers::UrlHelper

Note that if the user has JavaScript disabled, the request will fall back to using GET
link_to
Understanding Ruby symbol as method call - Stack Overflow

The send() and method() methods can take strings or symbols, one is converted to the other in the inner workings (not sure which) and then ruby executes the method with the matching name
Overwriting to_s function in a class | Treehouse Community

So balance is actually calling the balance method. The returned balance is then what is inserted into that part of the string.
This is simply a getter method which returns the instance variable @name So in the to_s method, name is actually a call to that method. The returned name is what gets inserted into the string
Rails 起步走 — Ruby on Rails 指南

我們必須將 controller parameters 設置白名單來避免錯誤的 mass assignment
View 的功能是將資訊用普通人可讀的方式呈現出來。View 跟 controller 最大的差別就是 controller 負責資訊的收集，而 view 只是負責資訊的呈現
控制器的功能是去接收對於應用程式的 HTTP 請求
當表單被提交時，表單的欄位值會被當作 parameters (參數) 送到 Rails
require
action 是用來處理表單送出的資料
Rails 一開始會試著尋找這個相對應的 template ，如果找不到才會試著載入另一個名為 application/new 的 template ，這是因為 ArticlesController 是繼承 ApplicationController的關係
這個特別的語法 :id 告訴了 rails 這個 route 規則預期會收到一個 :id parameter
而 parameters 的部份習慣上會被提出來變成一個 method ，如此一來便可被這個 controller 中的其他 actions 使用，如 create 和 update
我們還使用了一個 instance variable（實例變數） (以@開頭) 來參考到一個文章物件。我們會這麼做是因為 Rails 會將所有的 instance variable 送到 view 中
除了解決 mass assignment 問題之外，我們通常會將 method 設為 private ，來確保不會在非預期的地方被呼叫
第一個副檔名是 template 的 format 名稱，而第二個則是表示使用了什麼 handler 來處理
用 f 表示的 FormBuilder 物件
這個 route 規則需要有一個 controller 來處理請求
permit
當你呼叫 form_for 時，你必須傳遞一個 identifying object (識別物件) 給這個表單
在 Ruby 中類別名稱都是以開頭為大寫的方式命名
這個 link_to method 是 Rail 內建的其中一個 view helpers。他是用來建立一個文字超連結，並連結指定頁面
每個 Rails 模型都可以根據各自的屬性來初始化（實體化）， 這些屬性都被自動的對應到各自的資料庫的欄位
對於 Rails 中的模型來說，我們習慣用單數來命名，而且所對應的資料庫資料表，我們則是習慣用複數來命名
Migrations 是 Ruby 的一種類別，使得來建立和修改資料庫中的表格能夠更容易。Rails 使用 rake 命令來執行 migrations ，即使資料庫已經套用設定但還是可以回復 migration 動作。Migration 的檔名中包含著時間戳記，如此可以確保依照檔案建立的順序來先後執行
路由動作 (Routing) 則是決定由那一個控制器去接收請求，通常一個 控制器會有一個以上的路由 (route) 規則對應，藉由不同的 actions 來處理這些不同的路由 (routes) 所決定的請求。Action 的功能就是收集資訊並提供給 view 使用
Ruby on Rails 實戰聖經 | Rails 起步走

除了修改config或vender目錄下的檔案需要重新啟動之外，其他修改通常不需要重新啟動，修改的檔案會自動重新載入
如果是 production正式上線模式的話，修改任何檔案都必須重新啟動伺服器才會有效果
Rails內建支援SQLite這是一套非常輕量的非伺服器型資料庫程式，它的資料庫就只是一個檔案而已。流量大的正式上線環境雖然不適合SQLite，不過拿來開發和測試卻非常好用。Rails預設也使用SQLite資料庫來建立新的專案
Ruby on Rails 實戰聖經 | Active Record - 資料庫遷移(Migration)

使用 Migrations 可以讓我們有記錄地進行資料庫修改，每次變更就是一筆 Migration 記錄
Migrations 會自動追蹤哪些變更已經執行過了、那些還沒有，你只要新增 Migration 檔案，然後執行 rake db:migrate 就搞定了
Migration 是獨立於資料庫系統的，所以你不需要煩惱各種資料庫系統的語法差異，像是不同型態之類的。當然，如果要針對某個特定資料庫系統撰寫專屬功能的話，還是可以透過直接寫 SQL 的方式
ruby - What does the equal ('=') symbol do when put after the method name in a method definition? - Stack Overflow

Note that the object "f" has no attribute or instance variable named "foo" (nor does it need one), so the "foo=" method is just syntactic sugar for allowing a method call that looks like an assignment. Note also that such setter methods always return their argument, regardless of any return statement or final value.
Module: Kernel (Ruby 2.4.0)

sprintf(format_string [, arguments...] ) → string
CRUD 分解動作 - 簡易票選系統實作 為你自己學 Ruby on Rails

但因為這個方法沒有要給外部存取，所以通常會放在 private 區塊
default: 0
請儘量先考慮使用區域變數而不要使用實體變數，以上面這個例子來說，因為稍後要在 View 使用 @candidates 變數所以才使用實體變數
orm_for 除了可以產生 <form> 標籤之外，它的 action，也就是當你按下送出按鈕要去的那個地方，會根據傳給它的這個物件是新的還是舊的而自己判斷。
RVM: Ruby Version Manager - Gemset Basics

RVM gives you a separate gem directory for each and every Ruby version and gemset.
If you don't use a gemset at all, you get the gems in the 'default' set. If you use a specific gemset (say @testing), it will inherit gems from that ruby's @global. The 'global' gemset is to allow you to share gems to all your gemsets. The word 'default' quite literally says it all, eg. the gemset used without selecting one for a specific installed ruby
RVM: Ruby Version Manager - RVM Basics

We can not stress this enough! RVM does not control the system Ruby or its gems. Only Rubies and gems installed by RVM are under it's control!
Programming Ruby: The Pragmatic Programmer's Guide

Ruby provides a shortcut for creating these simple attribute setting methods
To the outside world, durationInMinutes seems to be an attribute like any other. Internally, though, there is no corresponding instance variable
These attribute accessing methods do not have to be just simple wrappers around an object's instance variables
In fact, defining a method name ending in an equals sign makes that name eligible to appear on the left-hand side of an assignment
duration=
File: control_expressions.rdoc [Ruby 2.2.0]

if and unless can also be used to modify an expression. When used as a modifier the left-hand side is the "then" expression and the right-hand side is the "test" expression
Active Record Validations — Ruby on Rails Guides

The easiest way to add custom validators for validating individual attributes is with the convenient ActiveModel::EachValidator
變數、常數、流程控制、迴圈 為你自己學 Ruby on Rails

nil 跟 false 都是真實存在的物件，只是他們在 Ruby 裡「被當做 false」而已。 特別是 nil，你有想過要怎麼用一個存在的東西來表示一個不存在的東西嗎？其實這有點玄。nil 是一個實實在在存在的物件，Ruby 只是用它來表示「空的」、「不存在」的概念而已，所以在 Ruby 裡你還是可以對 nil 物件呼叫一些方法
在 Ruby 裡因為所有的東西都是物件，在 Ruby 只有 nil 跟 false 會被當假的（false），除此這兩個之外，其它都是真的（true），包括數字 0、空陣列、空字串都是 true
所有的類別、模組的名字都必需是常數
在 Ruby 的常數的內容是可以修改而且不會發生錯誤
把常數的內容整個換掉會出現警告訊息，但就僅是警告而已，不是錯誤訊息，程式仍可正常執行，這點跟其它程式語言有很大的不同
常數用起來其實跟變數差不多，也不需要特別宣告它是常數，但在 Ruby 對常數有特別的命名規定，就是「常數必須要是大寫英文字母開頭」
Rails Paperclip: update vs. update_attributes - Stack Overflow

ActiveRecord.update has a behavior that may be throwing you off: "Updates an object (or multiple objects) and saves it to the database, if validations pass. The resulting object is returned whether the object was saved successfully to the database or not."
However the update_attributes will just return false.
Routes 為你自己學 Ruby on Rails

如果你有翻一下 public 目錄的話，就會發現找不到頁面的 404.html 頁面跟伺服器錯誤的 500.html 頁面都在這裡面喔。
像是會員個人 profile，如果想要設計「使用者只能檢視、更新、刪除自己的 profile」的效果就可使用單數 resource
如果想要設計的是「系統管理員可以檢視、更新、刪除每個使用者的 profile」的話，則使用複數 resources，
當你對某個網址使用 POST 方法存取表示是新增資料；當使用 PUT 或 PATCH 方法表示是更新資料，使用 DELETE 方法則是表示刪除資料
這個跟複數的 resources 方法的差別在於「單數 resource 方法不會做出含有 :id 的路徑」
在前面先查到的就會先生效，也就是說寫在後面的會被覆蓋
就是把每個網址當做資源（Resource）來看待，對同一個資源做不同的動作（HTTP Verb）會得到不同的結果。符合 REST 概念設計的網址，又稱之 RESTFul Route
其實並不是所有的 HTTP Request 都會經過 Route，如果是放在專案的 public 目錄裡的檔案是不用經過 Route 的
Rails Internationalization (I18n) API — Ruby on Rails Guides

Rails adds all .rb and .yml files from the config/locales directory to the translations load path, automatically.
Keys with a '_html' suffix and keys named 'html' are marked as HTML safe. When you use them in views the HTML will not be escaped
ruby - What does the equal ('=') symbol do when put after the method name in a method definition? - Stack Overflow

Note also that such setter methods always return their argument, regardless of any return statement or final value
What is the "_path" method in ruby on rails? - Stack Overflow

the resources of your application are the pools of data you can add to, and pull from
Class: String (Ruby 2.4.0)

ljust(integer, padstr=' ') → new_str
Ruby on Rails 實戰聖經 | Action View - Helpers 方法

Rails預設採用了全部逸出的方式來防睹這個安全性。不過，也因此開發者必須了解如何正確地關閉這個功能，當你想要顯示出HTML不要逸出的時候
@person.errors
Helper指的是可以在Template中使用的輔助方法
Controller裡面定義的方法，也可以用helper_method曝露出來當作Helper
@person.errors
另一個使用Helper的理由是可以簡化Template中的複雜結構，將Template中較為複雜的程式都用Helper包裝起來，最好讓Template只包含單純的變數以及最簡單的條件邏輯和迴圈，這樣就算是不會程式的網頁設計師，也能夠輕易了解套版甚至修改Template樣板
Ruby 語法放大鏡之「有的變數變前面有一個冒號(例如 :name)，是什麼意思?」 - 高見龍

帶有名字的物件
不過 Symbol 本身是不能被修改的，但字串可以
定義一個新的類別或是方法也都會產生新的 Symbol
Ruby on Rails從零開始自學，要用哪一份教材呢？ | Motion Express | Ruby, Rails, Crystal & developers' techniques

Rails有太多東西不能用三言兩語講清楚，所以建議初學者要先把東西死記起來，未來再理解，這才是最快的學習方法。如果硬要把所有細節都了解再繼續往下學，很容易鑽牛角尖繞不出來，進度也會太慢
Class: String (Ruby 2.2.0)

chomp
Model 基本操作 為你自己學 Ruby on Rails

不需要擔心連續兩次的 where 方法或是這樣一直連下去會造成多次的查詢，事實上 Rails 在處理這行語法的時候，是先整行語法解讀完才向資料庫進行查詢
在於 destroy 方法在執行的時候，會執行完整的回呼（Callback，在稍後的章節會介紹），但 delete 方法僅直接執行 SQL 的 delete from ... 語法，不會觸發任何回呼
new 方法只是先把物件做出來，尚未存入資料表，而 create 方法則是直接把存入資料表
id 欄位你在 Migration 沒看到任何資訊，這是 Rails 自動幫每個資料表加的流水編號欄位，這個欄位稱為資料表的主鍵（Primary Key）
scope 本身也是可以連在 scope 裡一起用的
Model 不是資料表（Table），Model 只是疊在資料表上面的一個抽象類別，負責跟實體的資料表溝通。
通常我們會把這種所謂的「商業邏輯」儘量的包到 Model 裡
因為 where 或 order 本身都可以回傳 ActiveRecord::Relation 的物件，你可以把 all 方法當做「當沒有其它方法組合的時候」才在用的方法
差別是 find_by 方法如果找不到指定 id 的資料，僅會回傳 nil，但 find 方法會直接產生 ActiveRecord::RecordNotFound 的錯誤訊息
要取消預設的 scope，必須使用 unscope 方法
且不需要再呼叫 save 方法
Model 預設使用 id 流水編號做為排序
通常如果是簡單的條件，我個人會偏好把它放在 scope 裡，如果是比較複雜的條件，則會建議放在類別方法裡（其實要放 scope 也是可以）
Model 的命名是單數（而且必須大寫，因為在 Ruby 的類別名稱必須是大寫），而資料表的命名則是複數（因為可以放很多資料？）、小寫並以底線分隔
File: methods.rdoc [Ruby 2.4.0]

By default, a method returns the last expression that was evaluated in the body of the method
When mixing keyword arguments and positional arguments, all positional arguments must appear before any keyword arguments.
The return keyword can be used to make it explicit that a method returns a value
Methods that end with a question mark by convention return boolean, but they may not always return just true or false. Often, they will return an object to indicate a true value (or “truthy” value).
It may contain letters, numbers, an _ (underscore or low line) or a character with the eight bit set
You can use a * to collect the remaining arguments
The array argument must be the last positional argument, it must appear before any keyword arguments
The parentheses around the arguments are optional
Methods that end with an equals sign indicate an assignment method. For assignment methods, the return value is ignored and the arguments are returned instead.
The default value does not need to appear first, but arguments with defaults must be grouped together
The block argument is indicated by & and must come last
When Ruby encounters the def keyword, it doesn’t consider it an error if the method already exists: it simply redefines it. This is called overriding
Unary methods accept zero arguments
Classes are objects, so adding class methods is simply adding methods to the Class object
Methods have an implied exception handling block
for assignment methods the return value will always be ignored. Instead, the argument will be returned
In ruby core library the dangerous method implies that when a method ends with a bang (!), it indicates that unlike its non-bang equivalent, permanently modifies its receiver
If the argument is not an Array it will be assigned to the first argument in the decomposition and the remaining arguments in the decomposition will be nil
you cannot alter the precedence of the operators
Both can take one or more arguments, and element reference can take none
adds the method to a class. You can define an instance method on a specific class with the class keyword
Arguments may have default values
A method may be defined on another object
The convention is to use underscores to separate words in a multiword method name
A method defined like this is called a “singleton method”. broaden will only exist on the string instance greeting. Other strings will not have broaden
methods for element reference and assignment may be defined: [] and []= respectively
Method names may end with a ! (bang or exclamation mark), a ? (question mark) or = equals sign
If you are only going to call the block and will not otherwise manipulate it or send it to another method using yield without an explicit block parameter is preferred
You may define a “class method” (a method that is defined on the class, not an instance of the class) like this:
self is a keyword referring to the current object under consideration by the compiler, which might make the use of self in defining a class method above a little clearer
a bare * can be used to ignore arguments
To define unary methods minus, plus, tilde and not (!) follow the operator with an @ as in +@ or !@
Bundler: Using Bundler In Application

Bundler uses this file to save names and versions of all gems. It guarantees that you always use the same exact code, even as your application moves across machines
After specified gem is installed for the first time, Bundler will lock its version. To update it, you must use: bundler update or/and modify its version in Gemfile
Action Mailer Basics — Ruby on Rails Guides

:user_name
Mailers are really just another way to render a view. Instead of rendering a view and sending out the HTTP protocol, they are just sending it out through the email protocols instead
:openssl_verify_mode
:authentication
:enable_starttls_auto
:password
:port
:address
plataformatec/simple_form: Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup.

simple_form
prompts
.association
include_blank: false
Simple Form will always look for a default attribute translation under the "defaults" key if no specific is found inside the model key
required: false
disabled: true
label_method:
collection_check_boxes
error_html:
label
Form labels, hints and placeholders for those attributes, though, should be placed under admin_user:
value_method:
collection_radio_buttons
form_for
edit
inline_label
Wrapping Rails Form Helpers
as:
placeholder
boolean_style: :inline
priority:
collection:
labels
based on the action being rendered
group_method:
If you want to pass the same options to all inputs in the form (for example, a default class), you can use the :defaults option in simple_form_for. Specific options in input call will overwrite the defaults
hint
label_html
as:
By default all inputs are required. When the form object includes ActiveModel::Validations (which, for example, happens with Active Record models), fields are required only when there is presence validation
render errors by default when you render the form with invalid data (after submitting for example)
Collection inputs accept two other options beside collections: label_method => the label method to be applied to the collection to retrieve the label (use this instead of the text_method option in collection_select) value_method => the value method to be applied to the collection to retrieve the value Those methods are useful to manipulate the given collection. Both of these options also accept lambda/procs in case you want to calculate the value or label in a special way eg. custom translation. You can also define a to_label method on your model as Simple Form will search for and use :to_label as a :label_method first if it is found. All other options given are sent straight to the underlying helper
placeholders
You can also add a hint, an error, or even a placeholder.
Since Simple Form generates a wrapper div around your label and input by default, you can pass any html attribute to that wrapper as well using the :wrapper_html option
hint: false
By default, Simple Form will look at the column type in the database and use an appropriate input for the column
input_html:
f.input_field
.button
hints
Simple Form inputs accept the same options as their corresponding input type helper in Rails
retrieved from the column definition in the database
include_blanks
pass any html attribute straight to the input, by using the :input_html
It should be noted that translations for labels, hints and placeholders for a namespaced model, e.g. Admin::User, should be placed under admin_user, not under admin/user
Collections can be arrays or ranges
when a :collection is given the :select input will be rendered by default
prompt:
defaults
For :prompt and :include_blank the I18n lookup is optional and to enable it is necessary to pass :translate as value
:translate
label: false
Getting Started with Rails — Ruby on Rails Guides

Routing decides which controller receives which requests
Often, there is more than one route to each controller, and different routes can be served by different actions. Each action's purpose is to collect information to provide it to a view
Ruby on Rails 實戰聖經 | Ruby on Rails 簡介

Rails是一套網站開發框架幫助你建立網站應用程式，它不是程式語言
您可以指定任意URL對應到任一個Controller的動作，跟檔案位置是無關的
靜態語言和動態語言的差別在於，前者的變數型別需要事前宣告，後者則是執行期才動態決定
高階的動態腳本語言可以幫助我們： 用更少程式碼做更多事情，大大增加生產力 更快因應客戶開發需求，敏捷開發 不過，動態語言也不是沒有缺點： 執行效能是絕對比不上靜態語言的 沒有編譯期可以檢查型別錯誤
Git - 與遠端協同工作

需留意的是 fetch 命令僅僅將資料拉到本地端的儲存庫，並未自動將它合併進來，也沒有修改任何目前工作的項目。 讀者得在必要時將它們手動合併進來
若讀者設定一個會追蹤遠端分支的分支（參考下一節及第三章，取得更多資料），可使用 git pull 命令自動擷取及合併遠端分支到目錄的分支
Active Record Migrations — Ruby on Rails Guides

db:migrate:redo
Model 關連性 為你自己學 Ruby on Rails

這個第三方資料表的名字是有規定的，預設是「兩個資料表依照英文字母先後順序排序，中間以底線分格」，所以以我們這個例子來說，這個資料表的名字就是「products_stores」。
store:references product:references
在 Rails 裡的慣例，是「要被對到的那個 Model 的名字」加上 _id
不需要另外新增第三方 Model 即可完成多對多關連。注意，我是說「不需要第三方 Model」，不是「不需要第三方資料表」，畢竟還是要有一個資料表存放雙方的資訊，只是這個資料表因為不重要也不會存取它，所以可以不需要 Model 對應。
多對多關連的概念大概就有點像這樣，沒辦法單純的在兩邊的 Model 設定 has_many 或 belongs_to 就搞定，多對多的關連會需要一個第三方的資料表來存放這兩邊 Model 的資訊，也就是「約診簿」的概念
我個人是比較偏好 has_many ... through 的寫法，雖然寫起來比較囉嗦，但會比較清楚清楚一點
如果你有需要使用這個第三方 Model 再做其它事情（例如你想知道這筆商品是在什麼時間店出貨到商店裡），選用 has_many ... through 的寫法；如果不介意也不會用到這個第三方 Model，那使用 has_and_belongs_to_many 的方式也是可以的
在 Rails 裡所謂的關係，是指在 Model 層級的關係，主要是透過 Model 的方法（例如 has_many 或 belongs_to）搭配 Rails 的資料表慣例設定主鍵（Primary Key）及外部鍵（Foreign Key），讓這些資料表串在一起
主要的用途是用來對應到 User Model 的 id 欄位，又稱它叫外部鍵（Foreign Key）
Layouts and Rendering in Rails — Ruby on Rails Guides

When using html: option, HTML entities will be escaped if the string is not marked as HTML safe by using html_safe method.
If you want Rails to put the text into the current layout, you need to add the layout: true option and use the .txt.erb extension for the layout file.
從其他程式語言到 Ruby

一個 symbol 就代表它是”誰”了，而不是代表它是”什麼”
程式碼整理 為你自己學 Ruby on Rails

在開發 Rails 專案的時候，以 MVC 的結構來說，儘量不要讓 View 有邏輯判斷，View 的工作，就是乖乖的輸出資料就好
如果這個邏輯可能跟其它同一個 View 的變數有關，我會選擇第 1 種做法；如果就只是像這個例子一樣，資料的呈現僅與自身 Model 有關，我個人會比較偏好第 2 種寫法
syntax - What is Ruby's double-colon `::`? - Stack Overflow

:: is basically a namespace resolution operator. It allows you to access items in modules, or class-level items in classes.
What is double colon (::) operator in Ruby and how is it used? - Quora

The operator allows you to access a module, class or constant that is defined in a different class or module than the one you are currently in
Object Oriented Ruby

Once a constant is defined, you can not change its value but you can access a constant directly inside a class much like a variable but if you want to access a constant outside of the class then you would have to use classname::constant
Ruby does not support multiple levels of inheritances but Ruby supports mixins. A mixin is like a specialized implementation of multiple inheritance in which only the interface portion is inherited.
subclassing
The class variables is a variable which is shared between all instances of a class. In other words, there is one instance of the variable and it is accessed by object instances
A class method is defined using def self.methodname() which ends with end delimiter and would be called using class name as classname.methodname
The initialize method is a standard Ruby class method and works almost same way as constructor works in other object oriented programming languages
Every value in Ruby is an object, even the most primitive things: strings, numbers and even true and false
Any class you define should have a to_s instance method to return a string representation of the object
Just add a < character and the name of the superclass to your class statement
Every object's attributes are assigned individually and share no value with other objects. They are accessed using the @ operator within the class but to access them outside of the class we use public methods which are called accessor methods. If we take above defined class Box then @width and @height are instance variables for the class Box
Class variables are prefixed with two @ characters (@@)
we want to prevent an object from being changed. The freeze method in Object allows us to do this, effectively turning an object into a constant
There may be a situation when you want to create an object without calling its constructor initialize
Similar to accessor methods, which are used to access the value of the variables, Ruby provides a way to set the values of those variables from outside of the class using setter methods
Even a class itself is an object that is an instance of the Class class
The data and methods within a class are called members of the class
Ruby gives you three levels of protection at instance methods level which may be public, private, or protected. Ruby does not apply any access control over instance and class variables
Object.freeze
his existing class is called the base class or superclass, and the new class is referred to as the derived class or sub-class.
By convention we keep constant names in upper case
To make the variables available from outside the class, they must be defined within accessor methods, these accessor methods are also known as a getter methods.
Their functionality is not limited to access the instance variables, but also they can do a lot more as per your requirement
The name must begin with a capital letter and by convention names that contain more than one word are run together with each word capitalized and no separating characters
Inheritance allows us to define a class in terms of another class, which makes it easier to create and maintain an application
The instance variables are kind of class attributes and they become properties of objects once we objects are created using the class
Layout, Render 與 View Helper 為你自己學 Ruby on Rails

這樣就只有這個 index 的頁面會套用 backend 版型，其它沒特別交待的還是會用預設版型
csrf_meta_tags 方法會在頁面上產生 <csrf-param> 跟 <csrf-token> 兩個 <meta> 標籤，用途主要是確保網站較不容易受到 CSRF（Cross-site request forgery）攻擊
View 的主要用途是輸出結果在畫面上，邏輯判斷越少越好。像上面這個例子，我們就可以把這段 if .. else 判斷，搬到 View Helper 放著
View Helper 主要是放在 app/helpers 目錄裡
局部樣版的檔名必須是那包資料的「單數」，而且放在對的位置，例如檔名必需是 _candidate.html.erb，而且放在 app/views/candidates 裡
局部樣版裡不需要寫迴圈（寫了反而會多跑一層迴圈），裡面用到的區域變數必須是單數，例如 candidate
如果要讓 ``<%= render @candidates %>` 可以正常運作的話，需要
CSRF（Cross-site request forgery）中文翻譯成「跨站請求偽造」。通常 CSRF 攻擊的目的不一定是直接獲取使用者帳戶的控制權或個資，但可以用其它使用者的名義執行某些操作
這個局部樣版就會得到一個 content 的區域變數
注意：這樣的寫法 partial 就不能省略了。
也就是說，這個 _banner.html.erb 會自己去空氣中抓看看有沒有 @content 這個實體變數給它，有的話就印出來。但事實上不是每個頁面都有這東西可以抓，所以不見得容易重複使用。比較建議的設計會是這樣
真正的預設版型應該是「跟 Controller 同名」的版型
因為傳了 collection 參數的關係，在局部樣版裡即使拿掉了 each 迴圈，它還是可以正常運作，而且呈現的畫面還是跟原來的一樣
通常局部渲染適用於「可以重複使用」的程式碼
注意這個檔案必需要是底線開頭的
Bundler: The best way to manage a Ruby application's gems

If any of the needed gems are already installed, Bundler will use them. After installing any needed gems to your system, bundler writes a snapshot of all of the gems and versions that it installed to Gemfile.lock.
Bundler will connect to rubygems.org (and any other sources that you declared), and find a list of all of the required gems that meet the requirements you specified. Because all of the gems in your Gemfile have dependencies of their own (and some of those have their own dependencies), running bundle install on the Gemfile above will install quite a few gems.
