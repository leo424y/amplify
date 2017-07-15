---
layout: post
comments: true
title: to_json
---

:point_left: 義大利行：648 天；新年：215 天；大假： 81天




```
require 'erb'
require 'json'

h = Hash.new
h["first"] = "First"
h["second"] = "Second"

template = ERB.new <<-EOF
  {
    "key": "value",
    "foo": 1,
    "Hash": <%= h.to_json %>,
    "bar": 2
  }
EOF

puts template.result(binding)
```

**output**

```
[arup@Ruby]$ ruby a.rb
  {
    "key": "value",
    "foo": 1,
    "Hash": {"first":"First","second":"Second"},
    "bar": 2
  }
[arup@Ruby]$
```
