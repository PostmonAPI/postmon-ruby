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
        PostmonRuby::City.new( HTTParty.get("#{ENDPOINT}/#{self.endpoint}/#{arguments.join("/")}") )
      end
    end
  end
end