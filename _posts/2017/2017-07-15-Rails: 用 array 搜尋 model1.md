---
layout: post
comments: true
title: Rails: 用 array 搜尋 model
---

:smiley: 義大利行：648 天；新年：215 天；大假： 81天


# 法一

```
Model.where('id IN (?)', [array of values])
```

# 法二
```
Model.where(id: [array of values])
```
