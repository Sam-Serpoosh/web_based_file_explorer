require_relative "./directory"

class UrlParser
  CURRENT_DIR = "."
  SPACE_IN_PARAM = "%20"

  def self.process_url(request)
    parameter_value = CURRENT_DIR
    params = request.sub(/GET\ /, "").split(/HTTP/)[0]
    params_stripped = params.rstrip
    if params_stripped.include?("?")
      parameter_value = params_stripped.split(/\?/)[1]
    end
    if parameter_value.include?(SPACE_IN_PARAM)
      parameter_value = parameter_value.sub(/\%20/, " ")
    end
    if parameter_value.include?("=")
      parameter_value = parameter_value.split(/=/)[1]
    end
    if File.directory?(parameter_value)
      return Directory.new(parameter_value)
    else
      return PureFile.new(parameter_value)
    end
  end
end
