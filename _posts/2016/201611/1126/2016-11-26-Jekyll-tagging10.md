---
layout: post
comments: true
title: Jekyll-tagging
tags: Jekyll tagging
---

# jekyll-tagging

By Arne Eilermann <[arne@kleinerdrei.net](mailto:arne@kleinerdrei.net)> and Jens
Wille <[jens.wille@uni-koeln.de](mailto:jens.wille@uni-koeln.de)>

jekyll-tagging is a Jekyll plugin, to add a tag cloud and per tag pages
plus feeds to your Jekyll generated Website.

## [<svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg>](https://github.com/pattex/jekyll-tagging/blob/master/README.rdoc#tags)Tags

This plugin does not reinvent Jekyll's tagging feature. It just makes
it easy to use. <[jekyllrb.com/docs/frontmatter](https://jekyllrb.com/docs/frontmatter)/>

Add space-delimited lowercase tags to FrontMatter, e.g.

<pre>
---
author: Willow Rosenberg
tags: feminism anti-capitalism witchcraft
---
</pre>

## [<svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg>](https://github.com/pattex/jekyll-tagging/blob/master/README.rdoc#usage)Usage

Install it:

<pre>
gem install jekyll-tagging
</pre>

Add this line to your Jekyll project's Gemfile:

<pre>
gem 'jekyll-tagging'
</pre>

Add the following to your
<tt>_plugins/ext.rb</tt> file:

<pre>
require 'jekyll/tagging'
</pre>

And in your
<tt>_config.yml</tt> you have to define your layout used to
generate tag pages like:

<pre>
tag_page_layout: tag_page
tag_page_dir: tag
</pre>

This will look for
<tt>_layouts/tag_page.html</tt>, and use it to generate
tag pages into the
<tt>_site/tag</tt> directory.

Now you have a new filter called
<tt>tag_cloud</tt> which you can use with
the
<tt>site</tt> object as argument in your layout to get a cloud of all
your site's tags. The tags are linked to their related tag page.
Furthermore, you have a
<tt>tags</tt> filter which you can feed with a
<tt>post</tt> or a
<tt>page</tt> object to get a link list of all its tags.

You can optionally define a per tag Atom/RSS feed.  In your
<tt>_config.yml</tt> define the following:

<pre>
tag_feed_layout: tag_feed
tag_feed_dir: tag
</pre>

(
<tt>tag_page_dir</tt> and
<tt>tag_feed_dir</tt> can have the same value.)

### [<svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg>](https://github.com/pattex/jekyll-tagging/blob/master/README.rdoc#pretty-page-links)Pretty page links

If your Jekyll
<tt>permalink</tt> configuration is set to something other
than
<tt>:pretty</tt>, and you still want to have pretty tag links define
the following in your
<tt>_config.yml</tt>:

<pre>
tag_permalink_style: pretty
</pre>

### [<svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg>](https://github.com/pattex/jekyll-tagging/blob/master/README.rdoc#ignoring-tags)Ignoring tags

Sometimes you don't want tag pages generated for certain pages.
That's ok! Just add
<tt>ignored_tags: [tags,to,ignore]</tt> to your
<tt>_config.yml</tt>

### [<svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg>](https://github.com/pattex/jekyll-tagging/blob/master/README.rdoc#extra-data-on-tag-pages)Extra data on tag pages

You can attach extra data to generated tag pages by specifying
<tt>tag_page_data</tt> in
<tt>_config.yml</tt> (this also works for
<tt>tag_feed_data</tt>). For example, you might want to exclude tag pages
from being picked up by `jekyll-sitemap`:

<pre>
tag_page_data:
  sitemap: false
</pre>

### [<svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg>](https://github.com/pattex/jekyll-tagging/blob/master/README.rdoc#example-tag-page-layout)Example tag page layout

(Save this to
<tt>_layouts/tag_page.html</tt> if using the
<tt>_config.yml</tt> snippet above.)

<pre>
---
layout: default
---
<h2>{{ page.tag }}</h2>
<ul>
{% for post in page.posts %}
  <li><a href="{{ post.url }}">{{ post.title }}</a> ({{ post.date | date_to_string }} | Tags: {{ post | tags }})</li>
{% endfor %}
</ul>

<div id="tag-cloud">
  {{ site | tag_cloud }}
</div>
</pre>

### [<svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg>](https://github.com/pattex/jekyll-tagging/blob/master/README.rdoc#example-layout-of-an-atom-feed)Example layout of an Atom feed

(Save this to
<tt>_layouts/tag_feed.xml</tt> if using the
<tt>_config.yml</tt> snippet above.)

<pre>
---
layout: nil
---
<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
 <title>Your Title - {{ page.tag }}</title>
 <link href="http://example.com{{ page.url }}" rel="self"/>
 <link href="http://example.com/tag/{{ page.tag }}.html"/>
 <updated>{{ site.time | date_to_xmlschema }}</updated>
 <id>http://example.com/tag/{{ page.tag }}.html</id>
 <author>
   <name>Author Here</name>
 </author>
 {% for post in page.posts %}
 <entry>
   <title>{{ post.title }}</title>
   <link href="http://example.com{{ post.url }}"/>
   <updated>{{ post.date | date_to_xmlschema }}</updated>
   <id>http://example.com{{ post.id }}</id>
   <content type="html">{{ post.content | xml_escape }}</content>
 </entry>
 {% endfor %}
</feed>
</pre>

## [<svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg>](https://github.com/pattex/jekyll-tagging/blob/master/README.rdoc#links)Links

col 1         | col 2
------------- | -------------------------------------------------------------------------------------------
Documentation | <[rubydoc.info/gems/jekyll-tagging/frames](http://rubydoc.info/gems/jekyll-tagging/frames)>
Source code   | <[github.com/pattex/jekyll-tagging](http://github.com/pattex/jekyll-tagging)>
RubyGem       | <[rubygems.org/gems/jekyll-tagging](http://rubygems.org/gems/jekyll-tagging)>

## [<svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg>](https://github.com/pattex/jekyll-tagging/blob/master/README.rdoc#license)License

### [<svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg>](https://github.com/pattex/jekyll-tagging/blob/master/README.rdoc#the-mit-license)The MIT License

Copyright © 2010-2012 University of Cologne, Albertus-Magnus-Platz, 50923
Cologne, Germany

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the “Software”),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
