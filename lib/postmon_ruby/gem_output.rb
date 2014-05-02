module PostmonRuby
  class GemOutput
    def self.cep(cep)
      resultado = Client.search :cep, cep
      output_variables(resultado)
    end

    def self.cidade(uf, cidade)
      resultado = Client.search :cidade, uf, cidade
      output_variables(resultado)
    end

    def self.estado(uf)
      resultado = PostmonRuby::Client.search :estado, uf
      output_variables(resultado)
    end

    private
    def self.output_variables(resultado)
      info = {}

      resultado.instance_variables.each do |var|
        info[var.to_s.delete("@").capitalize] = resultado.instance_variable_get(var)
      end

      info.each do |k, v|
        puts "#{k}: #{v}"
      end
    end
  end
end
