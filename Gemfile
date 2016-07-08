source 'https://rubygems.org'

ruby '2.2.1'

gem 'rails', '4.2.3'

gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'pundit', git: 'https://github.com/silvaelton/pundit.git'

gem 'simple_form', '~> 3.1.0'
gem 'haml-rails'

gem 'validates_cpf_cnpj'
gem 'validates_timeliness'
gem 'email_validator'

gem 'chartkick'

gem 'carrierwave',  '~> 0.10.0'

gem 'has_scope'
gem 'jquery-datatables-rails', '~> 3.3.0'

group :development, :test do
  gem 'guard-rails'
  gem 'guard-livereload'
  gem 'byebug'
  gem 'sqlite3'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :production do 
  gem 'fog'
	gem 'pg'
  gem 'rails_12factor'
  gem 'puma'
end


#init engines

gem 'dashboard',                  path: 'engines/dashboard'
gem 'commercial',                 path: 'engines/commercial'
gem 'deal',                       path: 'engines/deal'
gem 'information',                path: 'engines/information'
