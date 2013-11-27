require 'spec_helper'


describe Word do
  before :each do
    Word.any_instance.stub(:get_random_word).and_return("watermelon")
  end
  let(:word){ Word.create }

  it "should have a default correct score of 0" do
    word.correct.should == 0
  end

  it "should have a default incorrect score of 0" do
    word.incorrect.should == 0
  end

  it "should have a default percent of 0" do
    word.percent.should == 0
  end

  it "should automatically get a word from wordnik" do
    word.word.should == "watermelon"
  end

  describe "calculate percentage" do
    it "should recalculate the percent when saved" do
      word.percent.should == 0
      word.correct += 1
      word.save
      word.reload.percent.should == 1
    end
  end

end
