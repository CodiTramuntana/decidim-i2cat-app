# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = { git: "https://github.com/CodiTramuntana/decidim.git", branch: "release/0.28-stable" }.freeze

gem "daemons"
gem "deface"
gem "delayed_job_active_record"

gem "decidim", DECIDIM_VERSION
gem "decidim-cdtb"
gem "decidim-challenges", git: "https://github.com/gencat/decidim-module-challenges.git", tag: "v0.5.1"
gem "decidim-conferences", DECIDIM_VERSION
gem "decidim-term_customizer", git: "https://github.com/mainio/decidim-module-term_customizer", branch: "main"

gem "matrix"
gem "puma"
gem "whenever"
gem "uglifier", ">= 1.3.0"

gem "openssl"

gem "figjam"

group :development, :test do
  gem "better_errors"
  gem "binding_of_caller"
  gem "bootsnap"
  gem "byebug", platform: :mri
  gem "decidim-dev", DECIDIM_VERSION
  gem "faker"
  # Set versions because Property AutoCorrect errors.
  gem "rspec-rails", "~> 6.0.4"
  gem "rubocop-factory_bot", "2.25.1"
  gem "rubocop-rspec", "2.26.1"
end

group :development do
  gem "letter_opener_web"
  gem "listen"
  gem "web-console"
end
