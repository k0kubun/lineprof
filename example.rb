require_relative './lib/lineprof'

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
