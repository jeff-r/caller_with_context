require "caller_with_context/caller"

module CallerWithContext
  RSpec.describe Caller do
    let(:the_caller) { Caller.new }

    it 'excludes locations not in current path' do
      the_caller = Caller.new lines_of_context: 0, only_cwd: true
      expect(the_caller.locations.length).to be 1
    end

    # Yes, this spec has no assertions.
    # It just demonstrates passing options.
    it 'adds lines of context to each element' do
      Caller.new(colorize: true, only_cwd: true, lines_of_context: 1).show
    end
  end
end
