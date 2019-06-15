class Contextifier
  attr_reader :caller_location, :lines_of_context

  def initialize(caller_location, lines_of_context=1)
    @caller_location  = caller_location
    @lines_of_context = lines_of_context
  end

  def with_context_lines
    line_indexes.each.map {|line_number| lines_in_file[line_number].chomp }
  end

  def line_indexes(lineno=caller_location.lineno-1)
    min = lineno < 1 ? 0 : lineno - 1
    max = lineno >= lines_in_file.count ? lines_in_file.count : lineno + 1
    min..max
  end

  def lines_in_file
    @lines_in_file ||= File.readlines caller_location.absolute_path
  end
end
