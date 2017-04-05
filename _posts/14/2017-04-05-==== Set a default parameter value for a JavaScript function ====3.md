---
layout: post
comments: true
title: ==== Set a default parameter value for a JavaScript function ====
---

:pensive: 單： -16 婚： 749 年： 316 旅： 182

https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Functions/default_parameters
<code>
function foo(a, b)
{
  a = typeof a !== 'undefined' ? a : 42;
  b = typeof b !== 'undefined' ? b : 'default_b';
  ...
}
</code>


