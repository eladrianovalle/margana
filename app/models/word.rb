class Word 
  
  def self.reverse_letters(letters)
    length = letters.length
    reversed_letters = Array.new(length)

    letters.each_with_index do |letter, index|
      reversed_letters[length - index - 1] = letter
    end

    reversed_letters
  end

  def self.find_anagrams(word)
    word_array = word.upcase.chars
    length = word_array.length

    rev_array = reverse_letters(word_array)

    anagrams = Array.new

    length.times do 
      first_letter = word_array.first
      word_array.shift
      word_array.push(first_letter)
      anagrams.push(word_array * "")
      anagrams.push(word_array.reverse * "")
    end

    anagrams.delete_if { |item| item == word }
    
    p anagrams

  end

end