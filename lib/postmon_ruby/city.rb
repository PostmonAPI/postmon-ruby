module PostmonRuby
  class City
    @@city_attributes = [ :area_km2, :codigo_ibge ]

    attr_reader :not_found, *@@city_attributes

    def initialize(options={})
      @not_found = true if options.nil?
      @@city_attributes.each do |attribute|
        send(:"#{attribute}=", options[attribute.to_s] || "") 
      end
    end

    private
    attr_writer *@@city_attributes
  end
end