class Brownie
  def initialize
    @baked = false
  end

  def bake!
    @baked = true

    self
  end

  def baked?
    @baked
  end
end

b = Brownie.new
p b.baked?
p b.bake!
p b.baked?
