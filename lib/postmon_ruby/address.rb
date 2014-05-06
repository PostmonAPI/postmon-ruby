module PostmonRuby
  class Address
    @@address_attributes = [ :complemento, :bairro, :cidade, :logradouro, :estado, :cep ]

    attr_reader :not_found, *@@address_attributes

    def initialize(options={})
      @not_found = true if options.not_found?
      @@address_attributes.each do |attribute|
        send(:"#{attribute}=", options[attribute.to_s] || "")
      end
    end

    private
    attr_writer *@@address_attributes
  end
end
