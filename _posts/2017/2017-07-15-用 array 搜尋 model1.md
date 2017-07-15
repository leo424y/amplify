---
layout: post
comments: true
title: 用 array 搜尋 model
---

# 法一

```
Model.where('id IN (?)', [array of values])
```

# 法二
```
Model.where(id: [array of values])
```
