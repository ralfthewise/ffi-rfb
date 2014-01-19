# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ffi_rfb/version'

Gem::Specification.new do |spec|
  spec.name          = "ffi-rfb"
  spec.version       = FfiRfb::VERSION
  spec.authors       = ["Tim Garton"]
  spec.email         = ["garton.tim@gmail.com"]
  spec.summary       = %q{Ruby FFI wrapper of libvncserver.}
  spec.description   = %q{Ruby FFI wrapper of libvncserver.}
  spec.homepage      = "https://github.com/ralfthewise/ffi-rfb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "ffi-swig-generator", "~> 0.3.2"
  spec.add_runtime_dependency "ffi", "~> 1.9"
end
