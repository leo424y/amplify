---
layout: post
comments: true
title: 自己的 current_user 自己刻
---

### Rails 5

**Declare a module**

```
module Current
  thread_mattr_accessor :user
end
```

**Assign the current user**

```
class ApplicationController < ActionController::Base
  around_action :set_current_user
  def set_current_user
    Current.user = current_user
    yield
  ensure
    # to address the thread variable leak issues in Puma/Thin webserver
    Current.user = nil
  end
end
```

Now you can refer to the current user as `Current.user`

Documentation about [thread_mattr_accessor](http://blog.bigbinary.com/2016/09/05/rails-5-adds-ability-to-create-module-and-class-level-variables-on-per-thread-basis.html?utm_source=rubyweekly&utm_medium=email)

### Rails 3,4

It is not a common practice to access the `current_user` within a model. That being said, here is a solution:

```
class User < ActiveRecord::Base
  def self.current
    Thread.current[:current_user]
  end

  def self.current=(usr)
    Thread.current[:current_user] = usr
  end
end
```

Set the `current_user` attribute in a `around_filter` of `ApplicationController`.

```
class ApplicationController < ActionController::Base
  around_filter :set_current_user

  def set_current_user
    User.current = User.find_by_id(session[:user_id])
    yield
  ensure
    # to address the thread variable leak issues in Puma/Thin webserver
    User.current = nil
  end
end
```

Set the `current_user` after successful authentication:

```
def login
  if User.current=User.authenticate(params[:username], params[:password])
    session[:user_id] = User.current.id
    flash[:message] = "Successfully logged in "
    redirect_to( :action=>'home')
  else
    flash[:notice] = "Incorrect user/password combination"
    redirect_to(:action=>"login")
  end
end
```

Finally, refer to the `current_user` in `update_history` of `Item`.

```
class Item < ActiveRecord::Base
  has_many :histories
  after_create :update_history
  def update_history
    histories.create(:date=>Time.now, :username=> User.current.username)
  end
end
```
