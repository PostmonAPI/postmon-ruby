module PostmonRuby
  class Client
    def self.search(cep)
      PostmonRuby::Address.new( HTTParty.get("#{ENDPOINT}/cep/#{cep}") )
    end
  end
end