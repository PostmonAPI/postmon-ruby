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
A comand-line-interface para consultar ceps, informações do IBGE e rastreio de pacotes diretamente do terminal foi separada em outro projeto. PostmonCLI(https://github.com/PostmonAPI/postmon-cli)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
