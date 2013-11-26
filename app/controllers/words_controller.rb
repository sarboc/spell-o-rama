class WordsController < ApplicationController
  respond_to :json # AJAX only

  def index
    words = Word.all
    respond_with words
  end

  def show
    word = Word.all.sample
    respond_with word
  end

  def create
    word = Word.create
    respond_with word
  end

  def update
    word.find(params[:id])
    word.update_attributes(params[:word])
  end
end
