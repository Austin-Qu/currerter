class Converter
  include ActiveModel::Validations

  attr_reader :base, :symbols, :amount

  validates :amount, numericality: true
  validates_presence_of :base, :symbols, :amount

  def initialize(attrs)
    @base = attrs[:base]
    @symbols = attrs[:symbols]
    @amount = attrs[:amount]
  end
end
