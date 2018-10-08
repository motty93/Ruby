# ラムダ式
lambda { |n| n * n }
suquare = ->n{ n * n }

proc { |n| n * n }
Proc.new { |n| n * n }

suquare.call(8)

def print_func(arg, fun)
  fun.call(arg)
end

puts print_func(8, ->n{ n * n })
