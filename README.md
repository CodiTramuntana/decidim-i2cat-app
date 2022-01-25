# DECIDIM.I2CAT.APP

This is a Decidim I2CAT app.

## Testing

Create a dummy app in your application:

```
rake decidim:generate_external_test_app
cd spec/decidim_dummy_app/
bundle exec rails decidim_conferences:install:migrations
bundle exec rails decidim_challenges:install:migrations
RAILS_ENV=test bundle exec rails db:migrate
```

And run tests:

```bash
bundle exec rspec spec
```
