source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'cancan'
#Build JSON
gem 'jbuilder', '~> 2.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
#be able to use external API
gem 'httparty'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
#database to deploy to heroku
gem 'pg'
#now we can upload pdfs
gem "payday"
#Let's get some Cars data and inventory
gem 'edmunds_ruby'
#because Heroku likes Puma
gem 'puma'
#lets have Amazon manage user upload files
gem 'aws-sdk', '< 2'
# #To manage our app!!!
gem 'foreman'
#Paper clip to upload pictures
gem "paperclip", "~> 4.3"
#Paginations gets easier with Kaminari
gem 'kaminari'
#Mandrill api to make out app post a request to mandriill
gem 'mandrill-api', '~> 1.0.53', require: 'mandrill'
# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
#debugging gem
  gem 'pry'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'rack-cors', require: 'rack/cors'
  gem 'rails_12factor'

end

ruby "2.1.5"
