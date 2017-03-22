class FixIoService
  include HTTParty

  class NoneSupportedTypeError < StandardError; end

  base_uri 'api.fixer.io'

  attr_reader :base, :symbols

  def initialize(converter)
    raise NoneSupportedTypeError unless converter.is_a?(Converter)
    @base = converter.base
    @symbols = converter.symbols
    @amount = converter.amount
  end

  def execute
    response = self.class.get('/latest', request_params)
    response.parsed_response
  rescue HTTParty::Error => e
    logger.error "HTTParty Error: #{e.message}"
  end

  private

  def request_params
    { query: { base: base, symbols: symbols } }
  end
end
