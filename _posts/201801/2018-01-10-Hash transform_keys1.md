---
layout: post
comments: true
title: Hash transform_keys
---



```

>> h = { name: "John", email: "john@example.com" }

=> {:name=>"John", :email=>"john@example.com"}



>> h.transform_keys { |k| k.to_s }

=> {"name"=>"John", "email"=>"john@example.com"}

```

