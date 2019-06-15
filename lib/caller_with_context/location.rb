module CallerWithContext
  class Location
    attr_reader :caller_location, :lines_of_context

    def initialize(caller_location, lines_of_context=1)
      @caller_location  = caller_location
      @lines_of_context = lines_of_context
    end

    def context_lines
      line_indexes.each.map {|line_number| lines_in_file[line_number]&.chomp }
    end

    def line_indexes(lineno=caller_location.lineno-lines_of_context)
      min = lineno < lines_of_context ? 0 : lineno - lines_of_context
      max = lineno >= lines_in_file.count ? lines_in_file.count : lineno + lines_of_context
      min..max
    end

    def lines_in_file
      @lines_in_file ||= File.readlines caller_location.absolute_path
    end

    def to_s
      caller_location.to_s
    end
  end
end
