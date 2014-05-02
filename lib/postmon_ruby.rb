require "./lib/postmon_ruby/version"
require "./lib/postmon_ruby/client"
require "./lib/postmon_ruby/city"
require "./lib/postmon_ruby/state"
require "./lib/postmon_ruby/address"
require "./lib/postmon_ruby/gem_output"
require "./lib/postmon_ruby/finders/finder"
require "./lib/postmon_ruby/finders/cep_finder"
require "./lib/postmon_ruby/finders/city_finder"
require "./lib/postmon_ruby/finders/state_finder"
require "./lib/postmon_ruby/finders/finders"

require "httparty"

module PostmonRuby
  ENDPOINT = "http://api.postmon.com.br/v1"
end
