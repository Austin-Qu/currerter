class Converter
  include HTTParty
  include ActiveModel::Validations

  base_uri 'api.fixer.io'

  attr_accessor(
    :amount,
    :base,
    :symbols
  )

  validates :amount, numericality: true
  validates_presence_of :base, :symbols, :amount

  def initialize(base = 'AUD', symbols = 'USD', amount)
    @symbols = symbols
    @options = { query: { base: base, symbols: symbols } }
    @amount = amount
  end

  def execute
    get_latest_rate ? {amount: get_latest_rate[:rate] * @amount, fixer_code: get_latest_rate[:code]} : 'error'
  end

  private

  def get_latest_rate
    begin
      response = self.class.get('/latest', @options)
    rescue HTTParty::Error => e
      logger.error e.message
    rescue StandardError => e
      logger.error e.message
    end
    {rate: JSON.parse(response.body)['rates'][@symbols], code: response.code}
  end
end
