
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rails/ci/version"

Gem::Specification.new do |spec|
  spec.name          = "rails-ci"
  spec.version       = Rails::Ci::VERSION
  spec.authors       = ["Adam Pallozzi"]
  spec.email         = ["adampallozzi@gmail.com"]

  spec.summary       = "Automatically install all required gems for Rails-CI to parse testing output"
  spec.description   = "Rails-CI can automatially parse your testing output so we can give you detailed feedback. Add this gem so we can automatically add the gems required to parse your test output."
  spec.homepage      = "https://github.com/adampal/rails-ci-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/adampal/rails-ci-gem"
    spec.metadata["changelog_uri"] = "https://github.com/adampal/rails-ci-gem/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", ">= 12.3.3"

  # Used to output detailed results for Rails-CI to parse when using minitest:
  spec.add_runtime_dependency "minitest-reporters", ">=1.4"
end
