# thunk MIDDLEWARE 好棒棒
![](https://camo.githubusercontent.com/9de527b9432cc9244dc600875b46b43311918b59/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6d656469612d702e736c69642e65732f75706c6f6164732f3336343831322f696d616765732f323438343739302f415243482d5265647578322d657874656e6465642d7265616c2d6465636c657261746976652e676966)


---

# thunk MIDDLEWARE 目的
處理非同步 fucntion 如各種 API


---

# thunk MIDDLEWARE 步驟
- 寫一個MIDDLEWARE 處理非同步function
- 處理非同步function
- 根據 STATE 改變 VIEW 值


---

# 寫一個 MIDDLEWARE 處理非同步function
非同步function需等待API回傳，故MIDDLEWARE需能等回傳後再次讓 DISPATCHER 接著做事
```
const thunk = store => next => action => {
  if(typeof action === 'function'){
      action(store.dispatch, store.getState());
  }else{
      next(action);
  }
}
```


---

# 處理非同步function
```
var asyncIncrease = (dispatch, state) => {
    dispatch({type:"INCREMENT_LOADING"});
    _fakeServerApi.increaseCount(state.count.result,
        data => dispatch({ type: 'INCREMENT' }));
}
```


---

# 模擬API延遲幾秒後處理function
```
var _fakeServerApi = {
    // imitate the server API
    increaseCount :  ( currentCount, cb ) =>
        setTimeout(()=> cb(currentCount + 1), 5000)
    }
```

---

# 用真的API達成非同步
```
var getRandomImages = (dispatch, state) => {
  dispatch({ type: 'IMAGES_LOADING' });
  var imgurAPI = "https://api.imgur.com/3/gallery/random/random/1";
  $.getJSON(imgurAPI).done(data => dispatch({ type: 'IMAGES', data:data.data}))
}
```


---

# 根據 STATE 改變 VIEW 值
定義要在VIEW顯示的值為變數status，待API回傳後讓STATE更新stauts
```
if(state.count.loading){
    $('
---

#status').text("is loading...");
}else{
     $('
---

#status').text("loaded");
}
```


---

# [thunk 是你非同步的好朋友](https://github.com/gaearon/redux-thunk)
- 好好利用，讓debug之路順暢
- 好好利用，讓VIEW聽話
- 好好利用，讓UX提升
