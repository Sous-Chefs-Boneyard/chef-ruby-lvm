$:.unshift(File.expand_path("lib", __dir__))
require "lvm/version"

Gem::Specification.new do |gem|
  gem.authors       = ["Tim Smith", "Greg Symons", "Matthew Kent"]
  gem.email         = ["tsmith@chef.io", "mkent@magoazul.com", "gsymons@gsconsulting.biz"]
  gem.description   = "A wrapper for the LVM2 administration utility, lvm."
  gem.license       = "MIT"
  gem.summary       = "A wrapper for the LVM2 administration utility, lvm."
  gem.homepage      = "https://github.com/chef/chef-ruby-lvm"
  gem.files         = `git ls-files`.split($\)
  gem.name          = "chef-ruby-lvm"
  gem.require_paths = ["lib"]
  gem.version       = LVM::VERSION

  gem.add_dependency "chef-ruby-lvm-attrib", ">= 0.3"
  gem.add_dependency "open4", ">= 0.9.6", "< 2.0"
end
