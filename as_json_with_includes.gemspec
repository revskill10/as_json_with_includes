# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'as_json_with_includes/version'

Gem::Specification.new do |spec|
  spec.name          = "as_json_with_includes"
  spec.version       = AsJsonWithIncludes::VERSION
  spec.authors       = ["Truong Hoang Dung"]
  spec.email         = ["checkraiser11@gmail.com"]

  spec.summary       = %q{Treat your active_record includes as as_json include}
  spec.description   = %q{Treat your active_record includes as as_json include}
  spec.homepage      = "https://github.com/checkraiser/as_json_with_includes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency 'activerecord'
end
