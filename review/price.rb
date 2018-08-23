def larger_than_b(own, opponent, price, name)
  own >= price && opponent < price + 1000
  puts "#{name} #{price}"
end

loop do
    price += 200
    if A_budget >= price && B_budget < price + 1000
        puts "A #{price}"
        return
    end
    price += 300
    if B_budget >= price && A_budget < price + 10
        puts "B #{price}"
        return
    end
end
