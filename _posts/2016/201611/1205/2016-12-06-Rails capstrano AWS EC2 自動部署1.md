---
layout: post
comments: true
title: Rails capstrano AWS EC2 自動部署
tags: deploy
---
## [Rails capstrano AWS EC2 自動部署](http://fifiteen82726-blog.logdown.com/posts/1169940)

## 部屬是一件非常麻煩的事情

## 前置作業

安裝 Rails 的環境
確認 Passenger, 確認Rails 可以安好的手動部署在EC2上
可參考之前的

[Rails 用 passenger + nginx 部署在 google compute engine 上](http://fifiteen82726-blog.logdown.com/posts/314214-passenger-for-rails-nginx-deployments-on-the-google-compute-engine)

## CAPIstrano

是Rails社群中最常使用的佈署工具

用到的 Gem

<figure class="figure-code code">
    <figcaption></figcaption>

    <pre data-original-code="gem 'cAPIstrano', '~> 3.6'
    gem 'cAPIstrano-rails', '~> 1.2'
    gem 'cAPIstrano-passenger'
    gem 'cAPIstrano-rvm'
    gem 'cAPIstrano3-puma'
    " data-snippet-id="ext.c1ef7b1684f2c364efe6d91f125860e3" data-snippet-saved="false" data-codota-status="done">
    gem'cAPIstrano', '~> 3.6'
    gem 'cAPIstrano-rails', '~> 1.2'
    gem 'cAPIstrano-passenger'
    gem 'cAPIstrano-rvm'
    gem 'cAPIstrano3-puma'
    </pre>
</figure>

產生相關檔案

<figure class="figure-code code">
    <figcaption></figcaption>

    <pre>
    bundle exec cap install
    </pre>
</figure>

基本的會有3個檔案

<figure class="figure-code code">
    <figcaption></figcaption>

    <pre data-original-code="Capfile     # 把要require的套件寫這

    config/deploy.rb  # deploy的相關設定放這, ex: ssh, user

    config/deploy/production.rb # 針對 production 的設定 ex: ruby version, ip
    " data-snippet-id="ext.4447c7a11b6df86442f43771b35f4c78" data-snippet-saved="false" data-codota-status="done">
    Capfile\# 把要require的套件寫這
    config/deploy.rb  \# deploy的相關設定放這, ex: ssh, user
    config/deploy/production.rb \# 針對 production 的設定 ex: ruby version, ip
    </pre>
</figure>

如果還有 release 機器 or staging, 就自己新增 `deploy/release.rb` 之類

**Capfile**

<figure class="figure-code code">
    <figcaption></figcaption>

    <pre data-original-code="# Load DSL and set up stages

    require "cAPIstrano/setup"

    # Include default deployment tasks

    require "cAPIstrano/deploy"

    # Include tasks from other gems included in your Gemfile

    #

    # For documentation on these, see for example:

    #

    #   https://github.com/cAPIstrano/rvm

    #   https://github.com/cAPIstrano/rbenv

    #   https://github.com/cAPIstrano/chruby

    #   https://github.com/cAPIstrano/bundler

    #   https://github.com/cAPIstrano/rails

    #   https://github.com/cAPIstrano/passenger

    #

    require 'cAPIstrano/rvm'
    # require 'cAPIstrano/rbenv'

    # require 'cAPIstrano/chruby'

    require 'cAPIstrano/bundler'
    require 'cAPIstrano/rails/assets'
    require 'cAPIstrano/rails/migrations'
    require 'cAPIstrano/puma'
    require 'cAPIstrano/passenger'
    require 'rollbar/cAPIstrano3'


    # Load custom tasks from `lib/cAPIstrano/tasks` if you have any defined

    Dir.glob("lib/cAPIstrano/tasks/*.rake").each { |r| import r }
    " data-snippet-id="ext.6af466ad52bdfd2d62bff154866773a4" data-snippet-saved="false" data-codota-status="done">
    \# Load DSL and set up stagesrequire"cAPIstrano/setup"\# Include default deployment tasks
    require "cAPIstrano/deploy"

    \# Include tasks from other gems included in your Gemfile
    \#
    \# For documentation on these, see for example:
    \#
    \#   https://github.com/cAPIstrano/rvm
    \#   https://github.com/cAPIstrano/rbenv
    \#   https://github.com/cAPIstrano/chruby
    \#   https://github.com/cAPIstrano/bundler
    \#   https://github.com/cAPIstrano/rails
    \#   https://github.com/cAPIstrano/passenger
    \#
    require 'cAPIstrano/rvm'
    \# require 'cAPIstrano/rbenv'
    \# require 'cAPIstrano/chruby'
    require 'cAPIstrano/bundler'
    require 'cAPIstrano/rails/assets'
    require 'cAPIstrano/rails/migrations'
    require 'cAPIstrano/puma'
    require 'cAPIstrano/passenger'
    require 'rollbar/cAPIstrano3'


    \# Load custom tasks from `lib/cAPIstrano/tasks` if you have any defined
    Dir.glob("lib/cAPIstrano/tasks/*.rake").each { |r| import r }
    </pre>
</figure>

**deploy.rb**

<figure class="figure-code code">
    <figcaption></figcaption>

    <pre data-original-code="lock '3.6.1'
    set :application, 'app_name'
    set :repo_url, 'git@gitlab.com:xxxxx/xxxxx.git'
    set :user, "ubuntu"
    set :rails_env, "production"
    set :deploy_to, '/home/ubuntu/app_name'
    append :linked_files, 'config/database.yml', 'config/secrets.yml', 'config/API_key.yml', 's3secret.json' # 一些加到git ignore的東西, 如果production需要, 就放在這

    append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'
    set :ssh_options, {
      forward_agent: true,
      auth_methods: ["publickey"],
      keys: ["#{Dir.pwd}/xxxxx.pem"]
    } # AWS 需要 ssh 才能連線


    # rollbar的偵測

    set :rollbar_token, 'xxxxtoken'
    set :rollbar_env, Proc.new { fetch :stage }
    set :rollbar_role, Proc.new { :app }
    " data-snippet-id="ext.245e64ef971717c5b42e33957dc47069" data-snippet-saved="false" data-codota-status="done">
    lock '3.6.1'set :application, 'app_name'
    set :repo_url, 'git@gitlab.com:xxxxx/xxxxx.git'
    set :user, "ubuntu"
    set :rails_env, "production"
    set :deploy_to, '/home/ubuntu/app_name'
    append :linked_files, 'config/database.yml', 'config/secrets.yml', 'config/API_key.yml', 's3secret.json' \# 一些加到git ignore的東西, 如果production需要, 就放在這
    append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'
    set :ssh_options, {
      forward_agent: true,
      auth_methods: ["publickey"],
      keys: ["\#{Dir.pwd}/xxxxx.pem"]
    } \# AWS 需要 ssh 才能連線

    \# rollbar的偵測
    set :rollbar_token, 'xxxxtoken'
    set :rollbar_env, Proc.new { fetch :stage }
    set :rollbar_role, Proc.new { :app }
    </pre>
</figure>

**production.rb**

<figure class="figure-code code">
    <figcaption></figcaption>

    <pre data-original-code="role :app, %w{ubuntu@ip}
    role :web, %w{ubuntu@ip}
    role :db,  %w{ubuntu@ip}

    set :rvm_type, :auto
    set :rvm_ruby_version, '2.3.1@rails5.0.0.1'   # 如果用 rvm 和 gemset的話

    set :passenger_rvm_ruby_versionw
    " data-snippet-id="ext.8d5043256234121172f3e48ce98a8ad2" data-snippet-saved="false" data-codota-status="done">
    role:app, %w{ubuntu@ip}
    role :web, %w{ubuntu@ip}
    role :db,  %w{ubuntu@ip}

    set :rvm_type, :auto
    set :rvm_ruby_version, '2.3.1@rails5.0.0.1'   \# 如果用 rvm 和 gemset的話
    set :passenger_rvm_ruby_versionw
    </pre>
</figure>

## 檢查

在**本機端**
輸入  `cap production deploy:check`

## 部署

在**本機端**
輸入  `cap production deploy`

我有遇到一個問題是 gem 2.5.1 的bug
`undefined method`this' for #<:specification:0x9b54b0 passenger-5.0.30>`
我問了這篇 stackoverflow
http://stackoverflow.com/questions/40945373/rails-capstrano-rvm-method-missing
<!--:specification:0x9b54b0-->

最後沒人回答 我自己解決了, 更新 gem 就行了

<figure class="figure-code code">
    <figcaption></figcaption>

    <pre data-original-code="gem install rubygems-update -v 2.6.3
    update_rubygems
    gem update --system
    " data-snippet-id="ext.b649f8f24042e96ccc87098436b59030" data-snippet-saved="false" data-codota-status="done">
    gem install rubygems-update -v 2.6.3
    update_rubygems
    gem update --system
    </pre>
</figure>

