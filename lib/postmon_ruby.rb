require "postmon_ruby/version"
require "postmon_ruby/client"
require "postmon_ruby/city"
require "postmon_ruby/state"
require "postmon_ruby/address"
require "postmon_ruby/finders/finder"
require "postmon_ruby/finders/cep_finder"
require "postmon_ruby/finders/city_finder"
require "postmon_ruby/finders/state_finder"
require "postmon_ruby/finders/finders" 

require "httparty"

module PostmonRuby
  ENDPOINT = "http://api.postmon.com.br/v1"
end
