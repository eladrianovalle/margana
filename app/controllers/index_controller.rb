get '/' do
  erb :index
end

# get '/anagrams/:word' do
#   @word = params[:word].upcase
#   @anagrams = Word.find_anagrams(@word)
#   erb :show
# end

get '/anagrams/:word' do
  @word = params[:word].upcase
  word_array = @word.chars.sort
  alphabetized_string = word_array.join
  @anagrams = Word.where("letters=?", alphabetized_string.downcase)
  erb :show
end

post '/' do 
  word = params[:word]

  begin
    valid_input(word)
    redirect "/anagrams/#{word}"
  rescue Exception => error
    @error = error.message
    erb :index
  end
end


  def valid_input(word)
    letter_array = word.chars
    unique_letters = letter_array.uniq
    if word.length > 3
      raise Exception.new("Word must be less than or equal to 3 characters.")
    elsif unique_letters.length < letter_array.length
      raise Exception.new("Word must only contain unique letters.  No repetition.")
    end
  end

  # def three_letters?(word)
  #   if word.length == 3
  #     true
  #   else
  #     false
  #   end
  # end 

  # def disctinct_letters?(word)
  #   letter_array = word.chars
  #   unique_letters = letter_array.uniq
  #   if unique_letters.length < letter_array.length
  #     false
  #   else
  #     true
  #   end
  # end

  # def valid_input?(word)
  #   if three_letters?(word) && disctinct_letters?(word)
  #     true
  #   else
  #     false
  #   end
  # end

