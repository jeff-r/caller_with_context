require 'awesome_print'
require 'colorize'

module CallerWithContext
  class Caller
    attr_reader :options

    def initialize(options={})
      @options = {
        colorize: true,
        only_cwd: false,
        lines_of_context: 1
      }.merge(options)
    end

    def locations
      return @locations if @locations
      locations = caller_locations
      if @options[:only_cwd]
        locations.select! { |l| l.to_s.include?(Dir.pwd) }
      end
      @locations ||= locations.map { |location| Location.new(location, options[:lines_of_context]) }
    end

    def show
      locations.each do |location|
        format_single_location location
      end
    end

    def output(string, color)
      if options[:colorize]
        puts string.send(color)
      else
        puts string
      end
    end

    def format_single_location(location)
      output(location.to_s, :light_blue)
      if options[:lines_of_context] > 0
        location.context_lines.each do |line|
          puts line
        end
        puts
      end
    end
  end
end
