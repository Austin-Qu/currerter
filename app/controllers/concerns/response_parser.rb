module ResponseParser
  def response_json(obj, status = :ok)
    render json: obj.merge(status: status)
  end
end
