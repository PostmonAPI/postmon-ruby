# encoding: utf-8
module PostmonRuby
  module Finders
    class Finders
      @finders = { 
        :cep =>    PostmonRuby::Finders::CepFinder.new,
        :cidade => PostmonRuby::Finders::CityFinder.new,
        :estado => PostmonRuby::Finders::StateFinder.new,
        :rastreio => PostmonRuby::Finders::TrackerFinder.new
      }

      def self.get_finder(finder)
        @finders[finder.to_sym]
      end
        
    end
  end
end
