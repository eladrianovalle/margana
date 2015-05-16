class Word < ActiveRecord::Base
  
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

    combinations = Array.new

    length.times do 
      first_letter = word_array.first
      word_array.shift
      word_array.push(first_letter)
      combinations.push(word_array * "")
      combinations.push(word_array.reverse * "")
    end

    combinations.delete_if { |item| item == word }
    
    anagrams = []
    combinations.each do |combo|
      if Word.find_by_text(combo.downcase).present?
        anagrams << combo
      end
    end

    if anagrams.empty?
      anagrams << "This word has no anagram!"
    else
      anagrams
    end
    anagrams
  end

end