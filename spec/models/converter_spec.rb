require 'rails_helper'

RSpec.describe 'Converter API', type: :model do
  describe 'create a Converter instance' do
    let(:valid_params) {{amount: 123.50, base: 'AUD', symbols: 'USD'}}
    let(:invalid_params_1) {{ base: 'AUD', symbols: 'USD' }}

    context 'validation' do
      it 'is a valid instance' do
        expect(Converter.new(valid_params)).to be_valid
      end

      it 'is an invalid instance' do
        expect(Converter.new(invalid_params_1)).to be_invalid
      end
    end
  end
end
