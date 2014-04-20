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

```ruby
require 'postmon_ruby'
resultado = PostmonRuby::Client.search "01330000"
puts resultado.logradouro
puts resultado.bairro
puts resultado.cidade
puts resultado.estado
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request