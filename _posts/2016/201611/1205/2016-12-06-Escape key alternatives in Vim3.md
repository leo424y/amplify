---
layout: post
comments: true
title: Escape key alternatives in Vim
tags: vim
---
<header class="post-header">
    # Escape key alternatives in Vim

    <section class="post-meta">
        <time class="post-date" datetime="2014-07-27">27 July 2014</time>  on [Vim](https://eduardobautista.com/tag/vim/), [Tips](https://eduardobautista.com/tag/tips/)
    </section>
</header>

<section class="post-content">
    I have been using vim for almost two years now and one thing that has always bothered me has been the escape key.  According to the [Vim Tips Wiki](http://vim.wikia.com/wiki/Avoid_the_escape_key):

    > The Vi editor was originally written on an ADM-3A terminal, which had the Escape key positioned where the Tab key occurs on most modern keyboards.

    Well, I guess it would be a good idea to use something other than the escape key to return to normal mode.  Luckily, `Ctrl-[` does the exact same thing as the escape key in vim.  Although it does require you to use two fingers, I have felt that it doesn't cause as much of a disturbance to your vim workflow as the escape key does.

    Another alternative would be `Ctrl-c`, which lets you return to normal mode.  One of the things that I like most about `Ctrl-c` is that it doesn't show any lag in returning to normal mode like `Ctrl-[` and the escape key do.  The downsides to using `Ctrl-c` is that it does not expand any abbreviations or trigger the **InsertLeave** event, so it could cause some issues with plugins or with your .vimrc config.

    Of course, you can always create your own custom mapping (e.g. `:inoremap jj <Esc>`) for the escape key if you don't like any of the alternatives.  I am probably going to play around with the alternatives and see which one I like most for a bit longer though.

    **Edit:** Updated `:imap jj <Esc>` to `:inoremap jj <Esc>`.  Thanks to [bilalq's comment on HN](https://news.ycombinator.com/item?id=13101691).
</section>


