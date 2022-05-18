# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = { git: "https://github.com/CodiTramuntana/decidim.git", branch: "release/0.24-stable" }.freeze

gem "daemons"
gem "deface"
gem "delayed_job_active_record"
gem "puma"
gem "uglifier", ">= 1.3.0"
gem "whenever"

gem "figaro", ">= 1.1.1"
gem "openssl"

gem "bootsnap", "~> 1.3"

# Remove this nokogiri forces version at any time but make sure that no __truncato_root__ text appears in the cards in general.
# More exactly in comments in the homepage and in processes cards in the processes listing
gem "nokogiri", "1.13.3"

gem "decidim", DECIDIM_VERSION
gem "decidim-challenges", "~> 0.0.13", git: "https://github.com/gencat/decidim-module-challenges.git"
gem "decidim-conferences", DECIDIM_VERSION
gem "decidim-term_customizer", git: "https://github.com/mainio/decidim-module-term_customizer", branch: "0.24-stable"

group :development, :test do
  gem "better_errors"
  gem "binding_of_caller"
  gem "byebug", platform: :mri
  gem "decidim-dev", DECIDIM_VERSION
  gem "faker", "~> 2.14.0"
end

group :development do
  gem "letter_opener_web"
  gem "listen", "~> 3.1.0"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console"
end
