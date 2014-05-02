module PostmonRuby
  class GemOutput
    def self.get_info(options)
      unless options[:cep].nil?
        cep(options[:cep])
      end

      unless options[:cidade].nil?
        cidade(options[:cidade].first, options[:cidade].last)
      end

      unless options[:estado].nil?
        estado(options[:estado])
      end
    end

    private
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

    def self.output_variables(resultado)

      if resultado.not_found == true
        puts "Nenhum resultado encontrado."
      else
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
end
