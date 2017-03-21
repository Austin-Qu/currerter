module Api::V1
  class ConverterController < ApiController
    #TODO error handling?
    def convert
      @result = Converter.new(convert_params[:base], convert_params[:symbols], convert_params[:amount].to_f).execute
      response_json(@result)
    end

    private

    def convert_params
      params.permit(:base, :symbols, :amount)
    end
  end
end
