class GamesController < ApplicationController
  require 'open-uri'
  require 'json'

  def new
    @letters = []
    @caracteres = Array('A'..'Z') + Array('a'..'z')
    for index in (0...10)
      @letters << @caracteres.sample
    end
  end

  def score
    @guess = params[:word]
    url_read = URI.open("https://dictionary.lewagon.com/#{@guess}").read
    url_pars = JSON.parse(url_read)
    @result = url_pars['found']

    @exists = @guess.chars.all? { |car| @guess.count(car) <= @letters.count(car) }
  end
end
