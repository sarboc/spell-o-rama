class WordsController < ApplicationController
  respond_to :json # AJAX only

  def index
    words = Word.all.where("percent > ?", 0.75)
    respond_with words
  end

  def show
    word = Word.all.sample
    respond_with word
  end

  def create
    word = Word.all.sample
    url = Wordnik.word.get_audio("#{word.word}")

    definitions = []

    Wordnik.word.get_definitions("#{word.word}", limit: 3).each do |definition|
      definitions << definition["text"]
    end

    NewWord.perform_async
    render json: {word: word, url: url.last["fileUrl"], definitions: definitions}
  end

  def update
    word = Word.find(params[:id])
    word.update_attributes(correct: params[:correct], incorrect: params[:incorrect])
    respond_with word
  end
end
