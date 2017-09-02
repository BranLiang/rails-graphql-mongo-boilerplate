module ApiHelper
  def json_response
    JSON.parse(response.body, object_class: OpenStruct)
  end
end
