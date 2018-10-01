VALUE = 'toplevel'.freeze

class Foo
  #VALUE = 'in Foo class'.freeze

  class Bar
    def self.value
      VALUE
    end
  end
end

puts Foo::Bar.value
