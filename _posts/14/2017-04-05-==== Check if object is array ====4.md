---
layout: post
comments: true
title: ==== Check if object is array ====
---

:shit: 單： -16 婚： 749 年： 316 旅： 182

<code>
if( Object.prototype.toString.call( someVar ) === '[object Array]' ) {
    alert( 'Array!' );
}
// or
if( typeof someVar === 'string' ) {
    someVar = [ someVar ];
}
// or low performance way
someVar = [].concat( someVar );

</code>
