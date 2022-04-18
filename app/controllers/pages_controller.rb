# require 'open-uri'
# require 'json'

class PagesController < ApplicationController

  def index

  end

  def run
    # Create an empty array
    # create an array of all the letters
    # user a random selector method to push 10 words
    # display that word inside the html
    @letters = []
    letters = ('A'..'Z').to_a
    vowles = %w[A E I O U]
    8.times do
      @letters << letters.sample
    end
    puts @letters

    2.times do
      @letters << vowles.sample
    end
    @letters = @letters.shuffle
  end

  def score
    # if answer is not included in the letters
    # if answer is included in the letters but is not in the dictionary
    # if answer is included in the letters and its in the dictionary

    letters = params[:letters] # an array which has the set of letters chosen
    @answer = params[:answer]# users input
    answer_array = @answer.upcase.chars

    valid_word = answer_array.all? { |letter| letters.include?(letter)}

    if valid_word != true || word(letters, answer_array) != true
      @response = "That's not in the grid"
    elsif valid_word == true && dictionary(@answer) != true
      @response = "That's not in the dictionary"
    elsif valid_word == true && dictionary(@answer) == true
      @response = "That is a word"
    end

  end

  def word(grid, answer)
    answer.all? {|letter| answer.count(letter) <= grid.count(letter) }
  end

  def dictionary(attempt)
    url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
    word = JSON.parse(URI.open(url).read)
    word["found"]
  end
end
