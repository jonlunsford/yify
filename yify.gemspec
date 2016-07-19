# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yify/version'

Gem::Specification.new do |spec|
  spec.name          = "yify"
  spec.version       = Yify::VERSION
  spec.authors       = ["Jon Lunsford"]
  spec.email         = ["jon@capturethecastle.net"]
  spec.summary       = %q{YIFY Torrents API}
  spec.description   = %q{A Ruby wrapper for the YIFY Torrents API}
  spec.homepage      = "http://github.com/jonlunsford/yify"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"
  spec.add_dependency "dotenv"
  spec.add_dependency "virtus"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry-byebug"
end
