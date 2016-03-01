$:.push File.expand_path('../lib', __FILE__)

require 'espinita/version'

Gem::Specification.new do |s|
  s.name        = 'espinita'
  s.version     = Espinita::VERSION
  s.authors     = ['Miguel Michelson']
  s.email       = ['miguelmichelson@gmail.com']
  s.homepage    = 'http://github.com/continuum/espinita'
  s.summary     = 'Auditable Rails Engine.'
  s.description = 'Audit activerecord models like a boss'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '>= 4.0'
  s.add_dependency 'request_store'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails', '~>3.0'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'shoulda', '3.5.0'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'capybara'
end
