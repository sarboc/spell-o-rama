class Word < ActiveRecord::Base
  attr_accessible :word, :correct, :incorrect

  before_create :add_word
  after_save :calculate_percentage

  def add_word
    self.word = get_random_word.downcase
  end

  def calculate_percentage
    if self.correct > 0 || self.incorrect > 0
      self.percent = self.correct / (self.correct + self.incorrect)
    end
  end

  def get_random_word
    # gets a random Wordnik word with the following options:
    # includePartsOfSpeech: "noun" - calls only nouns
    # excludePartsOfSpeech: "proper-noun" - excludes proper nouns, such as "Paul"
    # excludePartsOfSpeech: "proper-noun-plural" - excludes plural proper nouns such as "Steves"
    # excludePartsOfSpeech: "proper-noun-possessive" - excludes possessive proper nouns such as "Steve's"
    # result is a hash, and we want the value of the ["word"] key
    Wordnik.words.get_random_word(includePartOfSpeech: "noun", excludePartOfSpeech: "noun-plural, proper-noun, proper-noun-plural, proper-noun-posessive", minCorpusCount: 100)["word"]
  end

end
