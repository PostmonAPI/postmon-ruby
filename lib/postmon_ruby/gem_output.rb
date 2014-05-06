require 'pry'
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

      unless options[:rastreio].nil?
        rastreio(options[:rastreio])
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

    def self.rastreio(rastreio)
      resultado = PostmonRuby::Client.search :rastreio, :ect, rastreio
      output_variables(resultado)
    end    

    def self.output_variables(resultado)
      if resultado.not_found
        puts "Nenhum resultado encontrado."
      else
        info = {}

        resultado.instance_variables.each do |var|
          info[var.to_s.delete("@").capitalize] = resultado.instance_variable_get(var)
        end

        print_array_output(info)
      end
    end

    def self.print_array_output(array, level = 0)
      array.each do |k, v|
        print "\t" if level > 0
        if( (!v.kind_of?(String) && v.kind_of?(Enumerable) ) || ( !k.kind_of?(String) &&  k.kind_of?(Enumerable) ))
          print_array_output(v||k, 1)
        else
          puts "#{k}: #{v}"
        end
      end      
    end
  end
end
