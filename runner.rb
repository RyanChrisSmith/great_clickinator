require './lib/click_counter'

year = ARGV[0].to_i

click_counter = ClickCounter.new('./data/encodes.csv', './data/decodes.json')
click_counts = click_counter.count(year)

p click_counts
