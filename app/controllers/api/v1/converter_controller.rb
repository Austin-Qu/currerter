module Api
  module V1
    class ConverterController < ApiController
      def convert
        converter = Converter.new(convertion_params)
        result = FixIoService.new(converter).execute if converter.valid?
        render json: result
      end

      private

      def convertion_params
        params.permit(:base, :symbols, :amount)
      end
    end
  end
end
