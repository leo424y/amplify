# 此檔案可以將一文字檔單檔切成 Github Page 用的 Markdown 檔案，可方便直推Github BLOG 詳 https://jekyllrb.com/
# v1.0.170320
# TODO 重要日子倒數
# TODO tags 補完
# TODO 重構，通用化，對不起它很髒XD
# TODO 檔名不要有數字
# 將此檔另存後執行 $ ruby spliter.rb 即將同資料夾內的 "-2016-11-05-.md" 切出下面格式檔案

require 'date'
require 'faker'

def random_emoji
	$people_random_emoji = Faker::SlackEmoji
	.people
end

# date calculate
def date_now_calculater(enddate)
	now = Date.today
	enddate_conutdown = (enddate - now).to_i
end
def date_calculater
	wedding_date = Date.new(2019, 4, 24)
	newyear_date = Date.new(2018, 2, 15)
	go17_date = Date.new(2017, 10, 4)
	# bike_date = Date.new(2017, 3, 20)
	$wedding_countdown = date_now_calculater(wedding_date)
	$newyear_countdown = date_now_calculater(newyear_date)
	$go17_countdown = date_now_calculater(go17_date)
	# $bike_countdown = date_now_calculater(bike_date)
end

def chunker(f_in, out_pref)
  # 切檔記號
  splitter = ";"

  File.open(f_in, 'r') do |fh_in|
    $title = ''
    $tags = ''
    filename = 1
    until fh_in.eof?
      unless File.exist?("#{out_pref}#{$title}#{filename}.md")
        File.open("#{out_pref}#{filename}.md", 'w+') do |fh_out|
          $title = fh_in.readline.chomp!
          # $tags = fh_in.readline.chomp! tags: #{$tags}
          File.rename("#{out_pref}#{filename}.md", "#{out_pref}#{$title}#{filename}.md")
					random_emoji

          head = <<HEAD
---
layout: post
comments: true
title: #{$title}
---

#{$people_random_emoji} 義大利行：#{$wedding_countdown} 天；新年：#{$newyear_countdown} 天；大假： #{$go17_countdown}天

HEAD
          fh_out << head
          puts '❤️'
        end
      end
      # puts ">>打開#{filename}.md"
      # File https://www.tutorialspoint.com/ruby/ruby_input_output.htm
      File.open("#{out_pref}#{$title}#{filename}.md", 'a+') do |fh_out|
        line_context = fh_in.readline
        # puts '下一行'
        # 碰到splitter開新檔案
        if line_context == "#{splitter}\n"
          filename += 1
          # puts ">>換至#{filename}"
        else
          fh_out << line_context
          # puts ">>寫進#{line_context}"
        end
      end
    end
  end
end
today = Time.now.to_s.split(' ')[0]
# timenow = Time.now.to_s.split(' ')[1]
date_calculater
chunker '0.md', "#{today}-"

# TODO: 簡化 !!
# HACK 讀取第一行到標題 完成 只是要refacotring!@! 太醜了
# TODO: 模組化
# TODO title進檔名

# 年月日取得
# puts Time.now
# puts Time.now.to_s.class
# puts Time.now.to_s
# puts Time.now.to_s.split(' ')[0]

#
# arr = IO.readlines(f_in)
# puts arr
# arr.each do |i|
#   title = (arr[i + 1]).to_s if arr[i] == spliter.to_s
# end
