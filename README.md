# Lineprof

Easy-to-use line profiler for Ruby.

## What's this?

[tmm1/rblineprof](https://github.com/tmm1/rblineprof) is a powerful line profiler for Ruby.
But rblineprof does not include a result formatter and its API is difficult to use.
This lineprof gem has a colored formatter, which is the same as [rack-lineprof](https://github.com/kainosnoema/rack-lineprof),
and simple API.

## Usage

```rb
require 'lineprof'

Lineprof.profile do
  sleep 0.001
  100.times do
    sleep 0.001
    1*2*3
    4*5*6
    7*8*9*10*11*12*13*14*15
    2**32
    2**128
  end
end
```

![](http://i.gyazo.com/2fe139b45cd73dc9a3295d4b37b0063b.png)

## License

MIT License
