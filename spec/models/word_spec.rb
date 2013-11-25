require 'spec_helper'
  before :each do
    Event.any_instance.stub(:get_random_word).and_return("watermelon")
  end
  let(:word){ Word.create }

describe Word do
  it "should have a default correct score of 0"

  it "should have a default incorrect score of 0"

  it "should have a default percentage of 0"

  it "should automatically get a word from wordnik"

end
