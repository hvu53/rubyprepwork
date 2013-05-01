 class Book
  attr_reader :title

  def title=(titles)
  
    words = titles.split(" ")
    remaining_word = words[1..-1].map do |w|
      if %w(the and over a of an in).include?(w)
        w
      else
        w.capitalize
      end
    end
    words = [words[0].capitalize] + remaining_word
    @title = words.join(" ")
  end

end
