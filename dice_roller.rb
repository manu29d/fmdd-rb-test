# A module to provide dice-rolling functionality.
module DiceRoller
  # Rolls a specified number of dice with the given number of sides for each die.
  #
  # @param [Integer] n The number of dice to roll. Default is 1.
  # @param [Array<Integer>] sides An array where each element represents the number of sides on each die. Default is [6].
  #
  # @return [Hash] A hash containing:
  #   * `:count` [Integer] The number of dice rolled.
  #   * `:total` [Integer] The sum of the results of all dice.
  #   * `:dice` [Array<Hash>] An array of hashes, each representing a die rolled, with:
  #     * `:sides` [Integer] The number of sides on the die.
  #     * `:result` [Integer] The result of rolling this particular die.
  #
  # @example
  # roll_set
  #   # => { count: 1, total: <result>, dice: [{ sides: 6, result: <result> }] }
  #
  # @example
  # roll_set(2, [12, 21])
  #   # => { count: 2, total: <sum of results>, dice: [{ sides: 12, result: <result> }, { sides: 21, result: <result> }] }
  #
  # @raise [ArgumentError] If the number of dice is less than or equal to 0.
  # @raise [ArgumentError] If the sides array is empty.
  # @raise [ArgumentError] If any number of sides is less than or equal to 0.
  def roll_set(n = 1, sides = [6])
    raise ArgumentError, "Number of dice must be at least 1" if n <= 0
    raise ArgumentError, "Sides must be a non-empty array" if sides.empty?

    results = []
    total = 0

    # Ensure we do not roll more dice than we have sides specified for
    n.times do |i|
      die_sides = sides[i] || sides[0] # Default to the first side count if not enough specified
      raise ArgumentError, "Number of sides must be greater than 0" if die_sides <= 0
      result = roll_die(die_sides)
      results << { sides: die_sides, result: result }
      total += result
    end

    { count: n, total: total, dice: results }
  end

  # Rolls a single die with the specified number of sides.
  #
  # @param [Integer] n The number of sides on the die.
  #
  # @return [Integer] The result of rolling the die, a random integer between 1 and `n`, inclusive.
  #
  # @raise [ArgumentError] If the number of sides is less than or equal to 0.
  def roll_die(n)
    raise ArgumentError, "Number of sides must be greater than 0" if n <= 0
    rand(1..n)
  end
end
