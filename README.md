# DECIDIM.I2CAT.APP

This is a Decidim I2CAT app.

## Testing

Prepare the database:

```bash
RAILS_ENV=test bin/rake db:create db:migrate
bundle exec rails decidim_conferences:install:migrations
bundle exec rails decidim_challenges:install:migrations
RAILS_ENV=test bundle exec rails db:migrate
```

And run tests:

```bash
bundle exec rspec spec
```
