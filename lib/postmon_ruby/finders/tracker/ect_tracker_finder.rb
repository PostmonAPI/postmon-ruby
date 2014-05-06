module PostmonRuby
  module Finders
    module Tracker
      class ECTTrackerFinder < PostmonRuby::Finders::Finder
        def endpoint
          "rastreio/ect"
        end

        def arguments_size
          1
        end

        def search(*arguments)
          arguments.flatten!
          PostmonRuby::Track.new( PostmonRuby::Http.get(self.arguments_uri(arguments)) )
        end
      end
    end
  end
end