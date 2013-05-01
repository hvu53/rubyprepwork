def reverser
  #yield.split(' ').map(&:reverse).join(' ')
  yield.split(' ').map do |word|
  	word.reverse
  end.join(' ')
end

def adder n=1
  yield + n
end

def repeater n=1
  n.times do
    yield
  end
end

# result =reverser do
#   "hello dolly"
# end
# puts result

# result2 = adder(3) do 5
# end
# puts result2


# repeater(4) do
# 	puts "hello".reverse
# end
