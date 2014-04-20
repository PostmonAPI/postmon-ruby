module PostmonRuby
  module Finders
    class Finder
      def endpoint
        raise NotImplementedError
      end

      def arguments_size
        raise NotImplementedError
      end      

      def search(finder, *arguments)
        arguments.flatten!
        finder = PostmonRuby::Finders::Finders.get_finder(finder)
        raise ArgumentError.new("wrong number of arguments (#{arguments.size} for #{finder.arguments_size})") if finder.arguments_size != arguments.size
        finder.search(arguments)
      end
    end
  end
end