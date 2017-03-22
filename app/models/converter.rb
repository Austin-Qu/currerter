class Converter
  include ActiveModel::Validations

  attr_reader :base, :symbols, :amount

  validates :amount, numericality: true
  validates_presence_of :base, :symbols, :amount

  def initialize(attrs)
    @base = attrs[:base] || 'AUD'
    @symbols = attrs[:symbols] || 'USD'
    @amount = attrs[:amount] || 1
  end
end
