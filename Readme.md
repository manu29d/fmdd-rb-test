# Dice Rolling Application

## Overview

The Dice Rolling Application is a Ruby script that simulates rolling a set of dice with specified numbers of sides. It uses a command-line interface (CLI) for user input and displays the results of the dice rolls, including individual die results and the total.

## Features

- Roll a specified number of dice.
- Specify the number of sides for each die.
- Display results for each die and the overall total.

## Prerequisites

Ensure you have Ruby installed on your system. You can download Ruby from [the official Ruby website](https://www.ruby-lang.org/en/downloads/).
This application is tested on `Ruby 3.2.2`

## Running the Application

To use this script from the command line:

1. Save the script to a file, e.g., dice_rolling_app.rb.
2. Make sure to include the DiceRoller module definition in the same file or require it if defined elsewhere.
3. Run the script with arguments, e.g.,:

```sh
ruby dice_rolling_app.rb -n2 -s6,12
```

This command will roll 2 dice with 6 and 12 sides, respectively, and display the results.

You can run the application directly from the command line with the following syntax:

```sh
ruby dice_rolling_app.rb -nNUMBER_OF_DICE -sSIDES
```

### Options

- `-n NUMBER_OF_DICE` : The number of dice to roll. This is a required option.
- `-s SIDES` : A comma-separated list of integers specifying the number of sides for each die. This is a required option.

### Examples

1. Roll a single 6-sided die:

```sh
ruby dice_rolling_app.rb -n1 -s6
```

Output example:
```
Number of dice rolled: 1
Total result: 4
Die with 6 sides: rolled 4
```

2. Roll two dice, one with 6 sides and one with 12 sides:

```sh
ruby dice_rolling_app.rb -n2 -s6,12
```

Output example:
```
Number of dice rolled: 2
Total result: 15
Die with 6 sides: rolled 4
Die with 12 sides: rolled 11
```

## Running Tests

To ensure the application is working correctly, you can run the tests using Minitest. Follow these steps:

1. **Install Dependencies**: Make sure you have Minitest installed. You can install it using:

```sh
gem install minitest
```

2. **Run Tests**: Execute the test suite by running the following command in the directory containing your test files:

```sh
ruby -Ilib:test dice_roller_test.rb
```

This command runs the tests defined in `dice_roller_test.rb` using Minitest.

## Error Handling

- If the number of dice is not specified or is less than or equal to 0, the application will display an error message.
- If the list of sides is empty or contains invalid side counts (less than or equal to 0), the application will display an error message.

## Contact

For any questions or feedback, you can reach me at [manu29.d@gmail.com](mailto:manu29.d@gmail.com).
