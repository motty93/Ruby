module Sweet
  def self.lot
    %w(brownie apple-pie bavarois pudding).sample
  end

  module Chocolate; end

  module Brownie; end
end

puts Sweet.lot
p Sweet::Chocolate
p Sweet::Brownie
