require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @range = []
    10.times do
      array = ("A".."Z").to_a
      @range << array.sample
    end
  end

  def score
    @words = params[:text].upcase.split('')
    @range = params[:range].split('')
    @same = true
    @words.each do |letter|
      @same = false if @range.include?(letter) == false
    end
    user_s = open("https://wagon-dictionary.herokuapp.com/#{@words.join.downcase}").read
    user = JSON.parse(user_s)
    @exist = user["found"]
  end
end
