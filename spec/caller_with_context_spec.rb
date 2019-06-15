RSpec.describe CallerWithContext do
  let(:formatter) { CallerWithContext::Formatter.new }

  it "has a version number" do
    expect(CallerWithContext::VERSION).not_to be nil
  end
end
