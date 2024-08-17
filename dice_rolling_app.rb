require 'optparse'
require './dice_roller'

# Main class for dice rolling that uses the DiceRoller module.
class DiceRollingApp
  include DiceRoller

  # Initializes and processes command-line arguments to roll dice.
  def self.run
    options = parse_options
    new(options).run
  end

  # Initializes the DiceRollingApp with options.
  #
  # @param options [Hash] A hash containing the number of dice and their sides.
  def initialize(options)
    @num_dice = options[:num_dice] || 1
    @sides = options[:sides].empty? ? [6] : options[:sides]
  end

  # Executes the dice rolling and displays the results.
  def run
    result = roll_set(@num_dice, @sides)
    display_result(result)
  end

  private

  # Parses command-line options.
  #
  # @return [Hash] A hash containing the number of dice and their sides.
  def self.parse_options
    options = { sides: [] }

    OptionParser.new do |opts|
      opts.banner = "Usage: dice_rolling_app.rb [options]"

      opts.on("-nN", "--number-of-dice N", Integer, "Number of dice to roll. Default is 1") do |n|
        options[:num_dice] = n
      end

      opts.on("-sSIDES", "--sides SIDES", "Comma-separated list of sides for each die. Default is 6") do |sides|
        options[:sides] = sides.split(',').map(&:to_i) if sides
      end

      opts.on_tail("-h", "--help", "Show this help message") do
        puts opts
        exit
      end
    end.parse!

    # Validate options
    if !options[:num_dice].nil? && options[:num_dice] <= 0
      puts "Error: Number of dice must be specified and greater than 0."
      exit 1
    end

    if !options[:sides].empty? && options[:sides].any? { |side| side <= 0 }
      puts "Error: Side count must be specified and all must be greater than 0."
      exit 1
    end

    options
  end

  # Displays the result of rolling dice.
  #
  # @param result [Hash] The result of the dice roll.
  def display_result(result)
    puts "Number of dice rolled: #{result[:count]}"
    puts "Total result: #{result[:total]}"
    result[:dice].each do |die|
      puts "Die with #{die[:sides]} sides: rolled #{die[:result]}"
    end
  end
end

# Run the application if this script is executed directly.
if __FILE__ == $0
  DiceRollingApp.run
end
