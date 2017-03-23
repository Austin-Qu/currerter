require 'rails_helper'

RSpec.describe 'Converter API', type: :request do
  describe 'convert method' do
    let(:valid_params) {{amount: 123.50, base: 'AUD', symbols: 'USD'}}
    before do
      post '/api/v1/converter/convert', params: valid_params
    end

    context 'when this request is valid' do
      it 'has ok status' do
        expect(response).to have_http_status(200)
      end

      it 'returns rates' do
        expect(JSON.parse(response.body)['rates']).not_to be_empty
      end
    end
  end
end
