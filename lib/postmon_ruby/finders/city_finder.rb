module PostmonRuby
  module Finders
    class CityFinder < PostmonRuby::Finders::Finder
      def endpoint
        "/cidade"
      end

      def arguments_size
        2
      end

      def search(*arguments)
        arguments.flatten!
        PostmonRuby::City.new( HTTParty.get(self.arguments_uri(arguments)) )
      end
    end
  end
end