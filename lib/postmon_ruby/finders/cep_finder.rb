module PostmonRuby
  module Finders
    class CepFinder < PostmonRuby::Finders::Finder
      def endpoint
        "/cep"
      end

      def arguments_size
        1
      end

      def search(*arguments)
        arguments.flatten!
        PostmonRuby::Address.new( HTTParty.get(self.arguments_uri(arguments)) )
      end
    end
  end
end