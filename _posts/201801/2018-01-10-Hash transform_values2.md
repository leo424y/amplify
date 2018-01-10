---
layout: post
comments: true
title: Hash transform_values
---

```

> hash = { a: 1, b: 2, c: 3 }

 #=> {:a=>1, :b=>2, :c=>3}



> hash.transform_values! { |v| v * 2 }

 #=> {:a=>2, :b=>4, :c=>6}



> hash

 #=> {:a=>2, :b=>4, :c=>6}



> hash = { a: "B", c: "D", e: "F" }

 #=> {:a=>"B", :c=>"D", :e=>"F"}



> hash.transform_values!(&:downcase)

 #=> {:a=>"b", :c=>"d", :e=>"f"}



> hash

 #=> {:a=>"b", :c=>"d", :e=>"f"}

```
