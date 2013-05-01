def echo(a)
  a
end
def shout(b)
  b.upcase
end

def repeat(x,y =2)
  ([x]*y).join(" ") 
end

def start_of_word(letter,number)
  letter[0...number]
end

def first_word(c)
  c.split(" ").first
end

def titleize(d)
  words = d.split.map do |word|
    if %w(the and over).include?(word)
      word
    else
      word.capitalize
    end
  end
  words.first.capitalize!
  words.join(" ")
end

