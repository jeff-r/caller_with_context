require 'caller_with_context/location'
require 'awesome_print'

def get_caller_location
  caller_locations.first
end

RSpec.describe CallerWithContext::Location do
  let(:location) { CallerWithContext::Location.new(get_caller_location) }

  describe '#context_lines' do
    it 'adds lines of context' do
      expect(location.context_lines.length).to eq 3
      expect(location.context_lines.first).to eq 'RSpec.describe CallerWithContext::Location do'
      expect(location.context_lines.last).to eq ''
    end
  end

  describe '#line_indexes' do
    it 'returns the range of lines to show' do
      expect(location.line_indexes(3)).to eq 2..4
    end

    it 'truncates negative numbers to 0' do
      expect(location.line_indexes(0)).to eq 0..1
    end

    it 'trims positive values to not exceed the file' do
      lines_count = File.readlines(__FILE__).count
      min = lines_count-1
      max = lines_count
      expect(location.line_indexes(lines_count)).to eq min..max
    end
  end
end
