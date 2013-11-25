class Word < ActiveRecord::Base
  attr_accessible :word, :correct, :incorrect

  before_create :add_word
  before_save :calculate_percentage

  def add_word
    word = get_random_word.downcase
    self.word = word
    self.save
  end

  def calculate_percentage
    if self.correct > 0 || self.incorrect > 0
      self.percentage = self.correct / (self.correct + self.incorrect)
    end
    self.save
  end

  def get_random_word
    # gets a random Wordnik word with the following options:
    # includePartsOfSpeech: "noun" - calls only nouns
    # excludePartsOfSpeech: "proper-noun" - excludes proper nouns, such as "Paul"
    # excludePartsOfSpeech: "proper-noun-plural" - excludes plural proper nouns such as "Steves"
    # excludePartsOfSpeech: "proper-noun-possessive" - excludes possessive proper nouns such as "Steve's"
    # result is a hash, and we want the value of the ["word"] key
    Wordnik.words.get_random_word(includePartOfSpeech: "noun", excludePartOfSpeech: "proper-noun", excludePartOfSpeech: "proper-noun-plural", excludePartOfSpeech: "proper-noun-posessive")["word"]
  end

end
