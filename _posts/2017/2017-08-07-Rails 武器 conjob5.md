---
layout: post
comments: true
title: Rails 武器 conjob
---


> 所以目前自已身上很小的事務我才會丟到 conjob 去，類似開開發票備存些啥鬼或清理有的沒的


# 簡易工作排程

每天 12 點該做些什麼東西，每一秒鐘該做什麼東西，類似有人問的廣告推播系統，機器人整點回應等等，這種東西一般來說大都會寫成 conjob / contab，Linux 下的老問題了，類似每天每週的安全性更新 / 清理 / Log分段等等，所以用 conjob 系列可以找到一票的文章，Ruby 下有 conjob 的 tool 叫 whenever

# Rails

適合大量併發，工作彼此獨立：簡單的來說一個人來網站 / 登入 / 操作，都是一件事情，然後做到完就結束，把結果回傳而已，而 Web 上面 80% 都是這樣的工作，包括 API 系列也可以勝任

# Sidekiq

等待執行，不要卡住，其實就是他真正的名稱：Delay Job，Rails 上面有一票工作需要等待的，類似傳送簡訊，寄送 mail，這些動作都需要依些時間才能完成，可是你又不該讓這些時間卡住使用者的操作和回應，所以就 push 到 Redis 的 queue 內（可以看成 Array）讓 Sidekiq 可以定時去 pop 出來做完後續的工作而已，而 Sidekiq 一次會開類似 25 個 thread pool 來把 pop 出來的工作彼此分配掉，所以一次可以做 25 件煩人的工作，且做完重取即可

Ref
http://railsfun.tw/t/ruby-rails/1226
