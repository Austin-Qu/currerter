require 'rails_helper'

RSpec.describe 'Converter API', type: :request do
  describe 'POST /api/v1/converter/convert' do
    let(:valid_params) {{amount: 123.50, base: 'AUD', symbols: 'USD'}}

    context 'when this request is valid' do
      before {post '/api/v1/converter/convert', params: valid_params}

      it 'has ok status' do
        expect(response).to have_http_status(200)
      end

      it 'returns rates' do
        body = JSON.parse(response.body)
        expect(body['amount']).to be_a(Float)
      end
    end
  end
end
