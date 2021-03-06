# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.11'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# View関連
gem 'bootstrap'
gem 'html2slim'
gem 'jquery-rails'
gem 'slim-rails'

# 検索機能
gem 'ransack'

# URLクリックでリンク先遷移
gem 'rails_autolink'

# ページネーション機能
gem 'kaminari'

# ユーザー管理機能
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'

# devise日本語化
gem 'devise-i18n'
gem 'devise-i18n-views'

# 関連テーブル（いいね！）のカウント
gem 'counter_culture'

# タグ機能
gem 'acts-as-taggable-on', '~> 6.0'

# プロフィール画像
gem 'carrierwave'
gem 'mini_magick'
gem 'fog-aws'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 4.11'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'capistrano' # 本体
  gem 'capistrano-bundler' # bundlerを使っているならこれも
  gem 'capistrano-rails' # Rails向けのプラグイン
  gem 'capistrano3-puma' # pumaを使う場合はこれも必要
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Rails で ER図を出してくれるツール。
  gem 'rails-erd'

  # View開発用
  gem 'xray-rails'

  # RSpec
  # ブラウザ操作によるコード実装
  gem 'heavens_door'
  # 高速化
  gem 'spring-commands-rspec'
  # フィクスチャの代替としてテストデータ作成を支援
  gem 'factory_bot_rails', '~> 4.11'

  # デバッグ
  gem 'pry-byebug'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
