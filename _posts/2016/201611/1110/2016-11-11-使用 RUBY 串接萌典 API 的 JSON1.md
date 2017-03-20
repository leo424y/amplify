---
layout: post
comments: true
title: 使用 RUBY 串接萌典 API 的 JSON
---

```ruby
module IfoundsHelper
  require 'httparty'
  require 'uri'

  # NOTE 解開並格式化中文解釋內容
  def find_word(body)
    # hash 讀取 JSON 巢狀 DATA 示例 https://www.moedict.tw/a/%E5%B8%A5.json
    body['h'].each do |h|
      h['d'].to_a.each do |d|
        # 去掉不要的字符回傳解釋
        return d['f'].gsub(/[~`]/, '')
      end
    end
  end

  # NOTE 傳入 tag 取得 萌典-moedict 中文解釋
  def got_word(tag)
    @word_to_explanation = tag
    # 中文網址識別
    p final_url = URI.escape("https://www.moedict.tw/a/#{@word_to_explanation}.json")

    # 取回json
    response = HTTParty.get(final_url)

    # 取得 modeict API 回傳狀態
    case response.code
    # 正常
    when 200
      # 進行字串拆解
      body = JSON.parse(response.body)
      find_word(body)
    when 404
      return '😇 👿'
    when 500...600
      return '👿'
      # puts "ZOMG ERROR #{response.code}"
    end
  end
end

```
