---
layout: post
comments: true
title: display= none, block
tags: 
---
```
<!DOCTYPE html>
<html>
<body>

<h1>What Can JavaScript Do?</h1>

<p>JavaScript can show hidden HTML elements.</p>

<p id="demo" style="display:none">Hello JavaScript!</p>

<button id='b1' type="button" onclick="document.getElementById('demo').style.display='block', document.getElementById('b2').style.display='block', document.getElementById('b1').style.display='none'">Show</button>
<button id='b2' style="display:none" type="button" onclick="document.getElementById('demo').style.display='none', document.getElementById('b1').style.display='block', document.getElementById('b2').style.display='none'">Hide</button>

</body>
</html>
```

xxx
External JavaScript Advantages

Placing scripts in external files has some advantages:

It separates HTML and code
It makes HTML and JavaScript easier to read and maintain
Cached JavaScript files can speed up page loads


