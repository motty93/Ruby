class Foo
end

foo = Foo.new
bar = Foo.new

def bar.sole_method
  puts 'called'
end

# sole_methodはbarに対してだけ呼べる
bar.sole_method
foo.sole_method # errorになる
