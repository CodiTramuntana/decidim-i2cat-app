# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = { git: "https://github.com/CodiTramuntana/decidim.git", branch: "release/0.27-stable" }.freeze

gem "daemons"
gem "deface"
gem "delayed_job_active_record"

gem "decidim", DECIDIM_VERSION
gem "decidim-challenges", git: "https://github.com/gencat/decidim-module-challenges.git", tag: "v0.4.1"
gem "decidim-conferences", DECIDIM_VERSION
gem "decidim-term_customizer", git: "https://github.com/mainio/decidim-module-term_customizer", branch: "release/0.27-stable"

gem "decidim-cdtb"

# temporal solution while gems embrace new psych 4 (the default in Ruby 3.1) behavior.
gem "psych", "< 4"

# required by puma
gem "matrix"
gem "puma"
gem "uglifier", ">= 1.3.0"
gem "webpacker"
gem "whenever"

gem "figaro", ">= 1.1.1"
gem "openssl"

# Remove this nokogiri forces version at any time but make sure that no __truncato_root__ text appears in the cards in general.
# More exactly in comments in the homepage and in processes cards in the processes listing
gem "nokogiri", "1.14.3"

group :development, :test do
  gem "better_errors"
  gem "binding_of_caller"
  gem "bootsnap"
  gem "byebug", platform: :mri
  gem "decidim-dev", DECIDIM_VERSION
  gem "faker"
end

group :development do
  gem "letter_opener_web"
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console"
end
