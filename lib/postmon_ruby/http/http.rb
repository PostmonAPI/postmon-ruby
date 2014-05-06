module PostmonRuby
  class Http
    def self.get(uri)
      instance = PostmonRuby::Http.new
      instance.instance_variable_set("@response", Net::HTTP.get_response(uri))
      instance
    end

    def [](key)
      @json = json unless @json 
      @json[key]
    end

    def not_found?
      @response.is_a?(Net::HTTPNotFound)
    end

    private

    def json
      return {} if not_found? 
      JSON.parse(@response.body)
    end

  end
end
