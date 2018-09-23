VALUE = 'toplevel'.freeze

class Foo
  VALUE = 'in Foo class'

  def self.value
    VALUE
  end
end

Foo.value
