===== highest-voted-javascript-questions =====
https://stackoverflow.com/questions/tagged/javascript
==== Closures ====
  * [[https://stackoverflow.com/questions/111102/how-do-javascript-closures-work]]
  * [[https://developer.mozilla.org/zh-TW/docs/Web/JavaScript/Closures]]
==== Redirect ====
<code>
// similar behavior as an HTTP redirect
window.location.replace("http://stackoverflow.com");

// similar behavior as clicking on a link
window.location.href = "http://stackoverflow.com";
</code>
==== Check string ====
**1. indexOf** - (see bottom)
<code>
var string = "foo",
    substring = "oo";
console.log(string.indexOf(substring) !== -1);
</code>
**2. (ES6) includes** - [go to answer](http://stackoverflow.com/a/14193950/2689455), or [this answer](http://stackoverflow.com/a/2385801/2689455)

 <code>
var string = "foo",
    substring = "oo";
string.includes(substring); //true
 </code>

**3. search** - [go to answer](http://stackoverflow.com/a/2385801/2689455)

 <code>
var string = "foo",
    expr = "oo";
string.search(expr); //1
 </code>

**4. lodash includes** - [go to answer](http://stackoverflow.com/a/20575032/2689455)

 <code>
var string = "foo",
    substring = "oo";
string.includes(substring) //true or _.includes(string, substring); (old way)
 </code>

**5. RegExp** - [go to answer](http://stackoverflow.com/a/1789980/2689455)

 <code>
var string = "foo",
    expr = /oo/;  // no quotes here
expr.test(string);//true
 </code>

Performance tests (http://jsben.ch/#/RVYk7) are showing that indexOf might be the best choice, if it comes to a point where speed matters.

==== 等號用法 ====
<code>
'' == '0'           // false
0 == ''             // true
0 == '0'            // true

false == 'false'    // false
false == '0'        // true

false == undefined  // false
false == null       // false
null == undefined   // true

' \t\r\n ' == 0     // true

var a = [1,2,3];
var b = [1,2,3];

var c = { x: 1, y: 2 };
var d = { x: 1, y: 2 };

var e = "text";
var f = "te" + "xt";

a == b            // false
a === b           // false

c == d            // false
c === d           // false

e == f            // true
e === f           // true
</code>

==== Deep clone an object (jQuery)====

[`.clone()`](http://api.jquery.com/clone/) method in **jQuery** only clones DOM elements. In order to clone JavaScript objects, you would do:

<code>
// Shallow copy
var newObject = jQuery.extend({}, oldObject);

// Deep copy
var newObject = jQuery.extend(true, {}, oldObject);
</code>

More information can be found in the [jQuery documentation](http://api.jquery.com/jQuery.extend/).

==== Include JS in JS ====
with jQuery
<code>
$.getScript("my_lovely_script.js", function(){

   alert("Script loaded but not necessarily executed.");

});
</code>

without jQuery
<code>
function loadScript(url, callback)
{
    // Adding the script tag to the head as suggested before
    var head = document.getElementsByTagName('head')[0];
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = url;

    // Then bind the event to the callback function.
    // There are several events for cross browser compatibility.
    script.onreadystatechange = callback;
    script.onload = callback;

    // Fire the loading
    head.appendChild(script);
}

var myPrettyCode = function() {
   // Here, do what ever you want
};

loadScript("my_lovely_script.js", myPrettyCode);
</code>

==== For-each over an array ====
forEach
<code>
var a = ["a", "b", "c"];
a.forEach(function(entry) {
    console.log(entry);
});
</code>
for
<code>
let divs = Array.from(document.querySelector("div"));
for (let index = 0; index < divs.length; ++index) {
    div[index].addEventListener(e => {
        alert("Index is: " + index);
    });
}
</code>
for-of
<code>
var val;
var a = ["a", "b", "c"];
for (val of a) {
    console.log(val);
}
</code>


==== Get a timestamp ====
<code>
new Date()

if (!Date.now) {
    Date.now = function() { return new Date().getTime(); }
}

Math.floor(Date.now() / 1000)

Math.round(new Date().getTime()/1000) //in seconds

new Date().valueOf()

</code>

==== Get query string values ====
<code>
function getParameterByName(name, url) {
    if (!url) {
      url = window.location.href;
    }
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}
// query string: ?foo=lorem&bar=&baz
var foo = getParameterByName('foo'); // "lorem"
var bar = getParameterByName('bar'); // "" (present with empty value)
var baz = getParameterByName('baz'); // "" (present with no value)
var qux = getParameterByName('qux'); // null (absent)

</code>

==== Create GUID/UUID ====
<code>
function guid() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
    s4() + '-' + s4() + s4() + s4();
}
</code>

==== Validate email address ====
<code>
function validateEmail(email) {
  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}

function validate() {
  $("#result").text("");
  var email = $("#email").val();
  if (validateEmail(email)) {
    $("#result").text(email + " is valid :)");
    $("#result").css("color", "green");
  } else {
    $("#result").text(email + " is not valid :(");
    $("#result").css("color", "red");
  }
  return false;
}

$("#validate").bind("click", validate);

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<form>
  <p>Enter an email address:</p>
  <input id='email'>
  <button type='submit' id='validate'>Validate!</button>
</form>

<h2 id='result'></h2>
</code>


==== The difference between call and apply ====
See MDN's documentation on [apply](https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Function/apply) and [call](https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Function/call).

Pseudo syntax:
<code>
`theFunction.apply(valueForThis, arrayOfArgs)`

`theFunction.call(valueForThis, arg1, arg2, ...)`

function theFunction(name, profession) {
    console.log("My name is " + name + " and I am a " + profession + ".");
}
theFunction("John", "fireman");
theFunction.apply(undefined, ["Susan", "school teacher"]);
theFunction.call(undefined, "Claude", "mathematician");
theFunction.call(undefined, ...["Matthew", "physicist"]); // used with the spread operator

// Output:

// My name is John and I am a fireman.
// My name is Susan and I am a school teacher.
// My name is Claude and I am a mathematician.
// My name is Matthew and I am a physicist.
</code>

==== make the first letter of a string uppercase ====
<code>
//css
p:first-letter {
    text-transform:capitalize;
}
//js
function ucFirstAllWords( str )
{
    var pieces = str.split(" ");
    for ( var i = 0; i < pieces.length; i++ )
    {
        var j = pieces[i].charAt(0).toUpperCase();
        pieces[i] = j + pieces[i].substr(1).toLowerCase();
    }
    return pieces.join(" ");
}
</code>

==== Replace all occurrences of a string ====
<code>
String.prototype.replaceAll = function(search, replacement) {
    var target = this;
    return target.replace(new RegExp(search, 'g'), replacement);
};

String.prototype.replaceAll = function(search, replacement) {
    var target = this;
    return target.split(search).join(replacement);
};
</code>

==== Append something to an array ====
<code>
// initialize array
var arr = [
    "Hi",
    "Hello",
    "Bonjour"
];

// append new value to the array
arr.push("Hola");

// add array in an array
var arr = [
    "apple",
    "banana",
    "cherry"
];

arr = arr.concat([
    "dragonfruit",
    "elderberry",
    "fig"
]);

console.log(arr);
</code>

==== Get current URL ====
Use:
As noted in the comments, the line below works but is bugged for Firefox.
<code>
window.location.href
//or
document.URL;
</code>
See **[URL of type DOMString, readonly](http://www.w3.org/TR/DOM-Level-2-HTML/html.html#ID-46183437)**.

==== Detecting an undefined object property ====
<code>

if ("undefined" === typeof variable) {
console.log("variable is undefined");
}
//or
if ("undefined" === typeof my_obj.prop){
console.log('the property is not available...');
}

</code>

==== Empty an array ====
<code>
A = [];
//or
var arr1 = ['a','b','c','d','e','f'];
var arr2 = arr1;  // Reference arr1 by another variable
arr1 = [];
console.log(arr2); // Output ['a','b','c','d','e','f']
//or
A.length = 0
//or
A.splice(0,A.length)
//or
while(A.length > 0) {
    A.pop();
}
</code>


==== Validate decimal ====
<code>
//js
function isNumeric(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}
//jQuery
isNumeric: function( obj ) {
    return !jQuery.isArray( obj ) && (obj - parseFloat( obj ) + 1) >= 0;
}
</code>


====  Get the value of the selected radio button in jQuery ====
<code>
$('#myForm input').on('change', function() {
   alert($('input[name=radioName]:checked', '#myForm').val());
});
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<form id="myForm">
<input type="radio" name="radioName" value="1" /> 1 <br />
<input type="radio" name="radioName" value="2" /> 2 <br />
<input type="radio" name="radioName" value="3" /> 3 <br />
</form>
</code>

==== Encode URL ====
<code>
var myUrl = "http://example.com/index.html?param=1&anotherParam=2";
var myOtherUrl = "http://example.com/index.html?url=" + myUrl;

var myOtherUrl = "http://example.com/index.html?url=" + encodeURIComponent(myUrl);
</code>

==== Closure inside loops ====
<code>
//js
var funcs = [];

function createfunc(i) {
    return function() { console.log("My value: " + i); };
}

for (var i = 0; i < 3; i++) {
    funcs[i] = createfunc(i);
}

for (var j = 0; j < 3; j++) {
    funcs[j]();                        // and now let's run each one to see
}

//es5 foreach
var someArray = [ /* whatever */ ];
// ...
someArray.forEach(function(arrayElement) {
  // ... code code code for this one element
  someAsynchronousFunction(arrayElement, function() {
    arrayElement.doSomething();
  });
});

//es6
for (let i = 0; i < 3; i++) {
    funcs[i] = function() {
        console.log("My value: " + i);
    };
}
</code>

==== Checking a key exists in a object ====
<code>
// BAD
var obj = { key: undefined };
obj["key"] != undefined // false, but the key exists!
// GOOD
"key" in obj // true, regardless of the actual value
// GOOD
obj.hasOwnProperty("key") // true
</code>

==== Empty string? ====
<code>
if (strValue){
  // do something
}
</code>
