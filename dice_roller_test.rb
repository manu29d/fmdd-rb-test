require 'minitest/autorun'
require_relative './dice_roller'

describe DiceRoller do
  include DiceRoller

  describe "#roll_set" do
    it "rolls a single 6-sided die by default" do
      result = roll_set
      expect(result[:count]).must_equal 1
      expect(result[:dice].length).must_equal 1
      expect(result[:dice][0][:sides]).must_equal 6
      expect(result[:dice][0][:result]).must_be :>=, 1
      expect(result[:dice][0][:result]).must_be :<=, 6
      expect(result[:total]).must_equal result[:dice][0][:result]
    end

    it "rolls multiple dice with specified sides" do
      result = roll_set(3, [4, 6, 8])
      expect(result[:count]).must_equal 3
      expect(result[:dice].length).must_equal 3
      expect(result[:dice][0][:sides]).must_equal 4
      expect(result[:dice][1][:sides]).must_equal 6
      expect(result[:dice][2][:sides]).must_equal 8
      expect(result[:total]).must_equal result[:dice].sum { |die| die[:result] }
    end

    it "uses the first side count for extra dice" do
      result = roll_set(3, [10])
      expect(result[:count]).must_equal 3
      expect(result[:dice].length).must_equal 3
      expect(result[:dice].all? { |die| die[:sides] == 10 }).must_equal true
    end

    it "raises ArgumentError for invalid number of dice" do
      expect { roll_set(0) }.must_raise ArgumentError
      expect { roll_set(-1) }.must_raise ArgumentError
    end

    it "raises ArgumentError for empty sides array" do
      expect { roll_set(1, []) }.must_raise ArgumentError
    end

    it "raises ArgumentError for invalid number of sides" do
      expect { roll_set(1, [0]) }.must_raise ArgumentError
      expect { roll_set(1, [-1]) }.must_raise ArgumentError
    end
  end

  describe "#roll_die" do
    it "returns a number between 1 and the number of sides" do
      100.times do
        result = roll_die(20)
        expect(result).must_be :>=, 1
        expect(result).must_be :<=, 20
      end
    end

    it "raises ArgumentError for invalid number of sides" do
      expect { roll_die(0) }.must_raise ArgumentError
      expect { roll_die(-1) }.must_raise ArgumentError
    end
  end
end
