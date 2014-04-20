module PostmonRuby
  module Finders
    class Finders
      @finders = { 
        cep:    PostmonRuby::Finders::CepFinder.new,
        cidade: PostmonRuby::Finders::CityFinder.new
      }

      def self.get_finder(finder)
        @finders[finder.to_sym]
      end
        
    end
  end
end