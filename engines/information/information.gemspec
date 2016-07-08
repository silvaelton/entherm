$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "information/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "information"
  s.version     = Information::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "https://github.com/silvaelton/entherm.git"
  s.summary     = "Summary of Information."
  s.description = "Description of Information."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end
