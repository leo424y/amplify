---
layout: post
comments: true
title: Array#bsearch
---



```

require 'benchmark'



data = (0..50_000_000)



Benchmark.bm do |x|

  x.report(:find) { data.find {|number| number > 40_000_000 } }

  x.report(:bsearch) { data.bsearch {|number| number > 40_000_000 } }

end

```

