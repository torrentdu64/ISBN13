# ISBNCalculator Documentation

The `ISBNCalculator` class is part of the `Service` module and is used to calculate the checksum for an ISBN-13 number.
The class provides a simple interface for calculating the checksum by applying an alternating multiplier to the digits of the ISBN,
summing them, and then adjusting the checksum accordingly.

## Example Usage

### Step 1: Initialize the ISBNCalculator

To use the `ISBNCalculator`, you first need to create an instance of the class by passing the ISBN-13 number as a string to the constructor.

```ruby
isbn = "9780143007234"
calculator = Service::ISBNCalculator.new(isbn)
```

### Step 2: Call the call Method

Once the instance is created, you can calculate the checksum by calling the call method on the instance. This method internally invokes the necessary steps to calculate the final result.

```ruby
Service::ISBNCalculator.call("9780143007234")
```

### Full Example

```ruby
isbn = "9780143007234"
calculator = Service::ISBNCalculator.call(isbn)
```

## Methods
# initialize(isbn)
Parameters:
isbn (String): The ISBN-13 number to calculate the checksum for.
Description: Initializes a new instance of the ISBNCalculator class.
# `call`
Description: Shortcut method that triggers the checksum calculation process and outputs the final result.
Private Methods
# `apply_alternating_multiplier`: Applies an alternating multiplier of 1 and 3 to each digit of the ISBN.
# `sum_multiplied_digits`: Sums the digits after they have been multiplied.
# `calculate_checksum_modulus`: Calculates the modulus of the sum of the digits.
# `adjust_checksum`: Adjusts the checksum by subtracting it from 10, with a special case for when the result is 10.
Notes
The ISBN must be provided as a string of 13 digits.
The `call` method will print the final checksum directly.n: Initializes a new instance of the ISBNCalculator class.
The `call` method will print the final checksum directly. 
