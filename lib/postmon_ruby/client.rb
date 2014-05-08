module PostmonRuby
  class Client
    def self.search(finder, *arguments)
      arguments.flatten!
      PostmonRuby::Finders::Finder.new.search(finder, arguments)
    end
  end
end
