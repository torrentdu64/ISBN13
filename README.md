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

### Step 2: Call the call Method

Once the instance is created, you can calculate the checksum by calling the call method on the instance. This method internally invokes the necessary steps to calculate the final result.
