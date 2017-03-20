---
layout: post
comments: true
title: ctrl alt B beautify
tags: 
---
```
<!DOCTYPE html>
<html>

<body>

    <h1>My Web Page</h1>

    <p id="myPar">I am a paragraph.</p>
    <div id="myDiv">I am a div.</div>

    <p>
        <button type="button" onclick="myFunction()">Try it</button>
    </p>

    <script>
        function myFunction() {
            document.getElementById("myPar").innerHTML = "Hello Dolly.";
            document.getElementById("myDiv").innerHTML = "How are you?";
        }
    </script>

    <p>When you click on "Try it", the two elements will change.</p>

</body>

</html>
```

