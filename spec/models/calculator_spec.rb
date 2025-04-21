# spec/models/calculator_spec.rb

require 'rails_helper'

RSpec.describe Calculator, type: :model do
  describe '#add' do
    it 'returns 0 for an empty string' do
      calculator = Calculator.new
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the number itself for a single number' do
      calculator = Calculator.new
      expect(calculator.add('5')).to eq(5)
    end

    it 'returns the sum of two numbers separated by comma' do
      calculator = Calculator.new
      expect(calculator.add('1,2')).to eq(3)
    end

    it 'handles new lines between numbers' do
      calculator = Calculator.new
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'supports different delimiters' do
      calculator = Calculator.new
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'throws an exception for negative numbers' do
      calculator = Calculator.new
      expect { calculator.add('1,-2,3') }.to raise_error('Negative numbers not allowed: -2')
    end

    it 'throws an exception for multiple negative numbers and includes them in the message' do
      calculator = Calculator.new
      expect { calculator.add('1,-2,-3') }.to raise_error('Negative numbers not allowed: -2, -3')
    end
  end
end
