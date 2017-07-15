---
layout: post
comments: true
title: Rails: find_by_id 只要用 find 即可啦！才怪
---

:woman: 義大利行：648 天；新年：215 天；大假： 81天


# 有點不一樣

`Model.find()` can accept array of ids, and will return all records which matches.
`Model.find_by_id(123)` also accept array but will only process first id value present in array

```
Model.find([1,2,3]) # find 給你全部
Model.find_by_id([1,2,3]) # find_by 只給你第一個
```

Use whichever one you feel suits your needs best.

# 源碼
**where** returns ActiveRecord::Relation

Now take a look at find_by implementation:

```
def find_by
  where(*args).take
end
```

As you can see **find_by** is the same as **where** but it returns only one record. This method should be used for getting 1 record and **where** should be used for getting all records with some conditions.

# find 用 id 來找
The `find` method is usually used to retrieve a row by ID:

```
Model.find(1)
```

Other uses of `find` are usually replaced with things like this:

```
Model.all
Model.first
```

`Find_by` is used as a helper when you're searching for information within a column, and it maps to such with naming conventions.  For instance, if you have a column named `name` in your database, you'd use the following syntax:

```
Model.find_by_name("Bob")
```

However, I believe `find_by` is being deprecated.

`.where` is more of a catch all that lets you use a bit more complex logic for when the conventional helpers won't do.

# where 不是一開始就是 where

```
https://github.com/rails/activerecord-deprecated_finders
```

x哥覺得 xxxx
