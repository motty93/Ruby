# ＆でブロックを受け取れるようになる
def print_func(arg, &fun)
  puts fun.call(arg)
end

# 上と同じ意味
# & + call == yield になる
def puts_func(arg)
  puts yield(arg)
end

print_func(8) { |n| n * n }
puts_func(8) { |n| n * n }
