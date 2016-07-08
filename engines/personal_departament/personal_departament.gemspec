$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "personal_departament/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "personal_departament"
  s.version     = PersonalDepartament::VERSION
  s.authors     = ["elton silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "https://github.com/silvaelton/entherm.git"
  s.summary     = "Summary of PersonalDepartament."
  s.description = "Description of PersonalDepartament."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end
