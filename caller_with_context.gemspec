
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "caller_with_context/version"

Gem::Specification.new do |spec|
  spec.name          = "caller_with_context"
  spec.version       = CallerWithContext::VERSION
  spec.authors       = ["Jeff Roush"]
  spec.email         = ["jeff@jeffroush.com"]

  spec.summary       = %q{Pretty-print callstack, including lines of context from the source file around each location.}
  spec.description   = %q{Pretty-print callstack, including lines of context from the source file around each location.}
  spec.homepage      = "https://github.com/jeff-r/caller_with_context"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "colorize"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "awesome_print"
end
