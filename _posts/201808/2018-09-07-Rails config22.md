---
layout: post
comments: true
title: Rails config
---

兩個move就解決啦！



在 Rails 4.2 以上就不需要這麼麻煩自幹，其實 Rails 有幫你做好了配套，這裡順便介紹 config_for8 的用法：



config/application.rb:



module MyRailsExample # 這裏是你本來的 Rails 專案名稱

  class Application < Rails::Application # 寫在 Application 裡面就可以使用 config_for 了

    $settings = config_for(:settings) # 這裡會自動依據你的 Rails.env 來讀取，不需要自己取出

  end

end



這個方法也是 Rails 自己拿來讀取 database.yml 的做法，所以一樣可以使用 ERB 嵌套，例如：



config/settings.yml:



development:

    hello: <%= 1 + 2 %>



讀取出來的 $settings[:hello] 就會是 3 了



如果你不是在 config/application.rb 下面操作也沒關係，也可以用以下的方式召喚：



$settings = Rails::Application.config_for(:settings)





http://railsfun.tw/t/rails-database-yml-global-settings/996/2

