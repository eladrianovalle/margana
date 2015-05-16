get '/' do
  erb :index
end

get '/anagrams/:word' do
  @word = params[:word].upcase
  @anagrams = Word.find_anagrams(@word)
  erb :show
end

post '/' do 
  @word = params[:word]

  word = @word

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

  if Word.valid_input?(word)
    redirect "/anagrams/#{word}"
  else
    @error = "Error.  I'll need a 3 letter word."
    erb :index
  end
end
