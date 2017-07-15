---
layout: post
comments: true
title: 用 increment 改變 model 欄位數值
---

You can use several ways to update the value:

with validation:

```
refund_update.increment('price', 5)
```

or

```
refund_update.update_attributes({'price': refund_update.price+5})
```

without validation:

```
refund_update.increment!('price',5)
```

or

```
refund_update.update_attribute('price', refund_update.price+5)
```
