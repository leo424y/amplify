# React

---

# Setup

[counter](https://github.com/reactjs/redux/tree/master/examples/counter)

[real-world](https://github.com/reactjs/redux/tree/master/examples/real-world)

----

## package.json
`npm install` 安裝相關 library 在`node_modules`folder裡

`npm start`執行`"start": "node server.js"` 預設 port `var port = 3000`

---

# Simplify React Project

----

# index.js - import
```
import React, { Component } from 'react'
import ReactDOM from 'react-dom'
```

----

# index.js - class - render
主要元件，使用 render return html

```
class Examples extends Component {
  render() {
    return (
      <div>Simple React</div>
    )
  }
}
```

----

# index.js - class - render - from prototype
發源於 prototype 模式

```
class Examples extends Component {
}
Examples.prototype.render = function(){
  return (
    <div>Simple React</div>
  )
}
```

`class Examples extends Component {}` 亦可代換成

`function Examples(){}`

----

# index.js - ReactDOM
使用 getElementById 把該id覆寫

index.js
```
ReactDOM.render(
  <Examples/>,
  document.getElementById('root')
)
```

index.html
`<div id="root"></div>`

---

JSX:

Webpack:

Babel:

---

---

# JSX: 讓你把 Tags 寫在 JavaScript 裡
JSX is a preprocessor step that adds XML syntax to JavaScript. You can definitely use React without JSX but JSX makes React a lot more elegant. Just like XML, JSX tags have a tag name, attributes, and children. If an attribute value is enclosed in quotes, the value is a string.

React components are typically written in JSX, a JavaScript extension syntax allowing quoting of HTML and using HTML tag syntax to render subcomponents. HTML syntax is processed into JavaScript calls of the React library. Developers may also write in pure JavaScript.

----

# JSX Error -  @ multi main
return的根元件只能有1個
```
<div>這樣</div>
<div>不OK</div>
```
```
<div>
  <div>這樣</div>
  <div>OK</div>
</div>
```

----

# JSX
在Tag裡要加屬性使用`{{}}`
```
<div>
  <div>這樣</div>
  <div style={{color:"red"}}>紅的OK</div>
</div>
```
----

# JSX
在Tag間要加JS使用`{}`

含 function 要用 this 指位在同一個 Class 底下
```
<div>
  <div>這樣</div>
  <div>執行function {this.func01()} OK</div>
</div>
```

---

# Webpack 熱除錯, Babel 說人話

----

# Webpack: Update displaying after saving file.
省掉每次 debug 都重覆按 F5 就是爽快

----

# Babel: ES6(Chrome, Firefox, Safari)+JSX > ES5 (General Browser)
讓其它 IE 啥的都聽得懂 ES6

---

# State

----

# Setup React
node_modules 由 `npm install`產生

render return 中
- <p> <br> 要改成 <p/> <br/>
- button onclick/onchange 要改成 onClick/onChange... (CamelCase)
----

# constructor 宣告與使用
```
constructor(props){
  super(props)
  this.state = {a: 0, b: 1, c: 2}
  //使用 bind(this)，才能調用自定 function
  `this.decrease = this.decrease.bind(this);`
}

decrease(){
  ...
}
```
---

# 於是 render return 變數可調用
`this.state.a, this.state.b ...`
## event 傳入後使用(e)代稱
`onChange={(e)=>this.setState({a: e.target.value})}`

----

# Number()
把字串型態的數字轉成正牌數字

---

# React Developer Tools
[Chrome外掛，雙向同步 React Component State ](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi?hl=en)

---

# Component

----

# Child Component 大寫 Tag 引用
使用大寫開頭 Tag ex. `<Counter/>`

----

# import, export, export default
重構 Component 用法：

index.js `'import Counter from './Components/Counter'` 免用`.js`但記得加`./`，代換成`import Counter2`也行，`Counter2`供該 Component 使用

Counter.js `'export default class Counter extends Component{...}'`

export default 1個Component限1次
export 不限，可匯出指定變數，使用`as`代換變數回傳後稱呼。`a as a2`使用`a2`代稱`a`

---
