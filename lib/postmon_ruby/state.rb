module PostmonRuby
  class State
    @@state_attributes = [ :area_km2, :codigo_ibge, :nome ]

    attr_reader :not_found, *@@state_attributes

    def initialize(options={})
      @not_found = true if options.nil?
      @@state_attributes.each do |attribute|
        send(:"#{attribute}=", options[attribute.to_s] || "") 
      end
    end

    private
    attr_writer *@@state_attributes
  end
end