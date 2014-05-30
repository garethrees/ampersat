# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ampersat/version'

Gem::Specification.new do |s|
  s.name        = 'ampersat'
  s.version     = Ampersat::VERSION
  s.authors     = ['Gareth Rees', 'Robert Coleman']
  s.email       = ['gareth.h.rees@gmail.com', 'github@robert.net.nz']
  s.homepage    = 'http://github.com/garethrees/ampersat'
  s.summary     = 'Calculates which email domains your subscribers use'
  s.description = 'Calculates which email domains your subscribers use'

  s.rubyforge_project = "ampersat"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.7'
  s.add_dependency 'thor', '~> 0.19.1'
  s.add_dependency 'public_suffix', '~> 1.4.4'
  s.add_dependency 'ruby-progressbar', '~> 1.5.1'
  s.add_dependency 'celluloid', '0.15.2'
  s.add_dependency 'celluloid-pmap', '~> 0.1.0'
end
