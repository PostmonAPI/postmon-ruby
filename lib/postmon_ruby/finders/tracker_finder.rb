module PostmonRuby
  module Finders
    class TrackerFinder < PostmonRuby::Finders::Finder
      @@trackers = {
        ect: PostmonRuby::Finders::Tracker::ECTTrackerFinder.new
      }
      def arguments_size
        2
      end

      def search(*arguments)
        arguments.flatten!
        @@trackers[arguments.first].search(arguments[1..-1])
      end

    end
  end
end