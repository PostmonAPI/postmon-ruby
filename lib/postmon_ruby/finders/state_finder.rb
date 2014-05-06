module PostmonRuby
  module Finders
    class StateFinder < PostmonRuby::Finders::Finder
      def endpoint
        "/uf"
      end

      def arguments_size
        1
      end

      def search(*arguments)
        arguments.flatten!
        PostmonRuby::State.new( PostmonRuby::Http.get(self.arguments_uri(arguments)) )
      end
    end
  end
end