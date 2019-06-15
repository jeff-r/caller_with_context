# CallerWithContext

Adds lines of context from the source file around each of the lines in a stack trace.

So, this:

```
/home/jeff/projects/backtrace/caller_with_context/lib/caller_with_context/caller.rb:24:in `show'
/home/jeff/projects/backtrace/caller_with_context/spec/caller_spec.rb:13:in `block (2 levels) in <module:CallerWithContext>'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/example.rb:254:in `instance_exec'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/example.rb:254:in `block in run'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/example.rb:500:in `block in with_around_and_singleton_context_hooks'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/example.rb:457:in `block in with_around_example_hooks'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/hooks.rb:464:in `block in run'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/hooks.rb:602:in `run_around_example_hooks_for'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/hooks.rb:464:in `run'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/example.rb:457:in `with_around_example_hooks'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/example.rb:500:in `with_around_and_singleton_context_hooks'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/example.rb:251:in `run'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/example_group.rb:629:in `block in run_examples'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/example_group.rb:625:in `map'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/example_group.rb:625:in `run_examples'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/example_group.rb:591:in `run'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/runner.rb:116:in `block (3 levels) in run_specs'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/runner.rb:116:in `map'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/runner.rb:116:in `block (2 levels) in run_specs'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/configuration.rb:2008:in `with_suite_hooks'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/runner.rb:111:in `block in run_specs'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/reporter.rb:74:in `report'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/runner.rb:110:in `run_specs'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/runner.rb:87:in `run'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/runner.rb:71:in `run'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/lib/rspec/core/runner.rb:45:in `invoke'
/home/jeff/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.1/exe/rspec:4:in `<top (required)>'
/home/jeff/.rvm/gems/ruby-2.6.3/bin/rspec:23:in `load'
/home/jeff/.rvm/gems/ruby-2.6.3/bin/rspec:23:in `<main>'
/home/jeff/.rvm/gems/ruby-2.6.3/bin/ruby_executable_hooks:24:in `eval'
/home/jeff/.rvm/gems/ruby-2.6.3/bin/ruby_executable_hooks:24:in `<main>'
```

becomes this:

```
/home/jeff/projects/backtrace/caller_with_context/lib/caller_with_context/caller.rb:24:in `show'
    def show
      locations.each do |location|
        format_single_location location

/home/jeff/projects/backtrace/caller_with_context/spec/caller_spec.rb:13:in `block (2 levels) in <module:CallerWithContext>'
    it 'adds lines of context to each element' do
      Caller.new(only_cwd: true, lines_of_context: 1).show
    end
```

Usage:

```
CallerWithContext::CallerWithContext::Caller.new.show
```

## Options

There are three options:

* only_cwd: filter out stack trace lines that don't arise from the current directory tree (default: false)
* lines_of_context: the number of lines of context above and below (default: 1)
* colorize: Colorize the stack trace line (default: true)

```
CallerWithContext::Caller.new(colorize: true, only_cwd: true, lines_of_context: 1).show
```

