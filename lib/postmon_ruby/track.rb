module PostmonRuby
  class Track
    #TODO criar um model para salvar o historico do rastreio
    @@track_attributes = [ :codigo, :servico ]

    attr_reader :not_found, *@@track_attributes
    attr_reader :historico

    def initialize(options={})
      @not_found = true if options.nil?
      @@track_attributes.each do |attribute|
        send(:"#{attribute}=", options[attribute.to_s] || "") 
      end
      @historico = options["historico"] || []
    end

    private
    attr_writer *@@track_attributes
  end
end