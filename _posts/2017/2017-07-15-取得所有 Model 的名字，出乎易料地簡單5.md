---
layout: post
comments: true
title: 取得所有 Model 的名字，出乎易料地簡單
---

:kissing_heart: 義大利行：648 天；新年：215 天；大假： 81天


大神們都幫我們準備好啦

# 解答
For **Rails5** models [are now subclasses](http://blog.bigbinary.com/2015/12/28/application-record-in-rails-5.html) of `ApplicationRecord` so to get list of all models in your app you do:

```
ApplicationRecord.descendants.collect { |type| type.name }
```

Or shorter:

```
ApplicationRecord.descendants.collect(&:name)
```

If you are in dev mode, you will need to eager load models before:

```
Rails.application.eager_load!
```

# 注意不同開發環境的設定

The whole answer for Rails 3, 4 and 5 is:

If `cache_classes` is off (by default it's off in development, but on in production):

```
Rails.application.eager_load!
```

Then:

```
ActiveRecord::Base.descendants
```

This makes sure all models in your application, regardless of where they are, are loaded, and any gems you are using which provide models are also loaded.

This should also work on classes that inherit from `ActiveRecord::Base`, like `ApplicationRecord` in Rails 5, and return only that subtree of descendants:

```
ApplicationRecord.descendants
```

If you'd like to know more about _how_ this is done, check out [ActiveSupport::DescendantsTracker](http://api.rubyonrails.org/classes/ActiveSupport/DescendantsTracker.html).
