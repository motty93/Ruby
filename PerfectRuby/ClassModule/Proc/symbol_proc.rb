puts %w(amsa armada hitbox).map(&:capitalize)

require 'prime'

puts (1..50).select(&:prime?)

p :**.to_proc[2, 8]
p :+.to_proc['ruby', 'ist']
p :grep.to_proc[['hello', 'world', 'takumi'], /ll/]
