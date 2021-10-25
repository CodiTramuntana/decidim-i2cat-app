# frozen_string_literal: true

source 'https://rubygems.org'

ruby RUBY_VERSION

DECIDIM_VERSION = { git: 'https://github.com/CodiTramuntana/decidim.git', branch: 'release/0.24-stable' }

gem 'daemons'
gem 'delayed_job_active_record'
gem 'puma'
gem 'uglifier', '>= 1.3.0'
gem 'whenever'
gem 'deface'

gem 'figaro', '>= 1.1.1'
gem 'openssl'

gem 'decidim', DECIDIM_VERSION
gem 'decidim-term_customizer', git: 'https://github.com/CodiTramuntana/decidim-module-term_customizer'
gem 'decidim-conferences', DECIDIM_VERSION
gem 'decidim-challenges', '~> 0.0.9', git: 'https://github.com/gencat/decidim-challenges.git'

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug', platform: :mri
  gem 'faker'
  gem 'decidim-dev', DECIDIM_VERSION
end

group :development do
  gem 'letter_opener_web'
  gem 'listen', '~> 3.1.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'
end
