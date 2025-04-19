# frozen_string_literal: true

require_relative 'lib/rubocop/dobado/version'

Gem::Specification.new do |spec|
  spec.name = 'rubocop-dobado'
  spec.version = RuboCop::Dobado::VERSION
  spec.authors = ['ippachi']
  spec.email = ['ippachi1018@gmail.com']

  spec.summary = 'Dobado cops for RuboCop'
  spec.description = 'Dobado cops for RuboCop'
  spec.homepage = 'https://github.com/fusic/rubocop-dobado'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['allowed_push_host'] = ''

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/fusic/rubocop-dobado'
  spec.metadata['changelog_uri'] = 'https://github.com/fusic/rubocop-dobado/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.metadata['default_lint_roller_plugin'] = 'RuboCop::Dobado::Plugin'

  spec.add_dependency 'lint_roller', '~> 1.1'
  spec.add_dependency 'rubocop', '>= 1.72.2'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
