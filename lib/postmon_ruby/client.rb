module PostmonRuby
  class Client
    def self.search(finder, *arguments)
      arguments.flatten!
      PostmonRuby::Finders::Finder.new.search(finder, arguments)
      # PostmonRuby::Finders::Finders.get_finder(finder).search(arguments)
    end
  end
end