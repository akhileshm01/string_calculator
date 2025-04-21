class Calculator < ApplicationRecord
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ','
    if numbers.start_with?("//")
      custom_delimiter = numbers.match(/\/\/\[(.+?)\]/)
      if custom_delimiter
        delimiter = Regexp.escape(custom_delimiter[1])
        numbers = numbers.split("\n")[1]
      else
        delimiter = numbers[2]
        numbers = numbers.split("\n")[1]
      end
    end

    numbers_array = numbers.split(/#{delimiter}|\n/).map(&:to_i)
    negative_numbers = numbers_array.select { |num| num.negative? }

    raise "Negative numbers not allowed: #{negative_numbers.join(', ')}" if negative_numbers.any?

    numbers_array.sum
  end
end
