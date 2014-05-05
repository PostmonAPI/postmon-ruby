# PostmonRuby

postmon_ruby permite consultar cep's através da api do postmon

## Installation

Add this line to your application's Gemfile:

    gem 'postmon_ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install postmon_ruby

## Usage
####Consultar CEP:
```ruby
require 'postmon_ruby'
resultado = PostmonRuby::Client.search :cep, "01330000"
puts resultado.logradouro
puts resultado.bairro
puts resultado.cidade
puts resultado.estado
```

####Consultar informações de uma cidade:
```ruby
require 'postmon_ruby'
resultado = PostmonRuby::Client.search :cidade, "SP", "Araraquara"
puts resultado.area_km2
puts resultado.codigo_ibge
```

####Consultar informações de um estado:
```ruby
require 'postmon_ruby'
resultado = PostmonRuby::Client.search :estado, "SP"
puts resultado.area_km2
puts resultado.codigo_ibge
puts resultado.nome
```

###Para consultar pelo terminal
#### Consultar pelo CEP:

    $ postmon-ruby --cep 49015040

    Complemento: lado ímpar
    Bairro: São José
    Cidade: Aracaju
    Logradouro: Avenida Barão de Maruim
    Estado: SE
    Cep: 49015040

#### Consultar informações de uma cidade:

    $ postmon-ruby --cidade SE,Aracaju

    Area_km2: 181,857
    Codigo_ibge: 2800308

#### Consultar informações de um estado:

    $ postmon-ruby --estado SE

    Area_km2: 21.915,116
    Codigo_ibge: 28
    Nome: Sergipe
    
#### Consultar informações de rastreio de um pacote:
    
    $ postmon-ruby --rastreio RF223325059SG
    
    Codigo: RF223325059SG
    Servico: ect
	detalhes: Em trвnsito para UNIDADE DE TRATAMENTO INTERNACIONAL - BRASIL
	local: CINGAPURA
	data: 11/04/2014 14:04
	situacao: Encaminhado

#### Menu de opções:

    $ postmon-ruby -h

    Usage postmon [options]
        --cep CEP                    Consultar CEP
        --cidade UF,Cidade           Consultar informações de uma cidade
        --estado UF                  Consultar informações de um estado
        --rastreio CODIGO_POSTAGEM   Consultar informações de rastreio de um pacote

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
