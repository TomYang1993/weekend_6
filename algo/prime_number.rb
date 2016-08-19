# Use RSpec to test the following exercise! You may wish to wrap the methods below in a class to help facilitate this.
require 'rspec'
# First, implement the is_prime? method below. It should accept a number as an argument and return
# true if the number is prime and false if it is not. A prime number is a number that is only
# divisible by itself and the number 1.
class Prime
  def is_prime?(number)
    divisor = []
    (1..number).each do |num|
      if number % num == 0
        divisor << num
      end
    end
    if divisor.count > 2
      return false
    else
      return true
    end
  end

# Second, implement the highest_prime_number_under method below. It should accept a number as
# an argument and return the highest prime number under that number. For example, the
# highest prime number under 10 is 7.

  def highest_prime_number_under(number)
    start = number - 1
    start.downto(1) do |num|
      if is_prime?(num)
        return num
      end
    end
  end
end

RSpec.describe Prime do
  describe '#is_prime?' do
    it 'returns true if an argument is a prime number' do
      prime = Prime.new
      expect(prime.is_prime?(5)).to eq(true)
    end
  end

  describe '#is_prime?' do
    it 'returns false if an argument isn\'t a prime number' do
      prime = Prime.new
      expect(prime.is_prime?(8)).to eq(false)
    end
  end

  describe '#highest_prime_number_under?' do
    it 'returns 5 if 7 is taken in' do
      prime = Prime.new
      expect(prime.highest_prime_number_under(7)).to eq(5)
    end
  end

  describe '#highest_prime_number_under?' do
    it 'returns 5 if 7 is taken in' do
      prime = Prime.new
      expect(prime.highest_prime_number_under(100)).to eq(97)
    end
  end
end
