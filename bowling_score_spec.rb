require './bowling_score'
require 'rspec-given'
require 'pry-rails'

describe BowlingScore do
  context "#frame" do
    Given(:bowling) { BowlingScore.new('1 2 3 4 10') }
    Then { bowling.frame(0) == [1, 2] }
    And { bowling.frame(1) == [3, 4] }
    And { bowling.frame(2) == [10] }
    And { bowling.frame(3) == [0, 0] }
  end

  context "#score" do
    context "Easy" do
      Given(:bowling) { BowlingScore.new('1 2 3 4') }
      Then { bowling.score == 10 }
    end
    context "strike" do
      Then { BowlingScore.new('6 2 7 1 10 9 0').score == 44 }
    end

    context "spare" do
      Then { BowlingScore.new('9 1 9 1').score == 29 }
    end

    context "other" do
      Then { BowlingScore.new("1 1 1 1 10 1 1").score == 18 }
      Then { BowlingScore.new('10 10 10 10 10 10 10 10 10 10 10 9').score == 299 }
      Then { BowlingScore.new('10 10 10 10 10 10 10 10 10 9 1 9').score == 278 }
      Then { BowlingScore.new('10 10 10 8 1 10 10 10 10 10 9 1 9').score == 244 }
    end

  end


end
