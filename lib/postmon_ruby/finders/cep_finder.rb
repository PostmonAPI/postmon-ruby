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
        PostmonRuby::Address.new( HTTParty.get("#{ENDPOINT}/#{self.endpoint}/#{arguments.join("/")}") )
      end
    end
  end
end