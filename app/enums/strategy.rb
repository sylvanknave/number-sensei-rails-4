class Strategy < ClassyEnum::Base
  def self.enum
    self.name.split('::').last.underscore.to_sym
  end

  # @abstract
  def name
    self.class.to_s.demodulize.titleize
  end

  # @abstract
  def hint
    'Nobody knows how to do this.'
  end

  # @return true if current trick can be used for given question
  # @abstract
  def question_qualifies?(question)
    false
  end

end


# Default
class Strategy::None < Strategy
  def hint
    'Good luck!'
  end
end

# This will allow reload! in Rails console to work
# [Reference] https://github.com/beerlington/classy_enum/issues/9
Strategy::MultiplyBy5 #includes 5, 25, 125
Strategy::CompareFractions
Strategy::ReadRomanNumeral

class Strategy::GCD < Strategy
  def name
    'Greatest Common Denominator'
  end

  def hint
    'Find the biggest of all divisors from the numbers given.'
  end
end

class Strategy::Memorize < Strategy
  def name
    'Basic Memorization'
  end

  def hint
    'Just memorize whenever possible, like in the shower.'
  end
end
