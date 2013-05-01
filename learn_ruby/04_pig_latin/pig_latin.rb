
def translate(words)
  words.split.map do |word|
  	start_index =first_vowel(word)
  	word.slice(start_index..-1) + word[0,start_index] + "ay"
	end.join(" ")
end

def first_vowel(word)
	if word =~ /^qu/
		2
	elsif word =~ /qu.*$/
		2 + word.gsub(/qu.*$/, '').size
	else
		word.gsub(/[aeiou].*$/,'').size
	end
end

