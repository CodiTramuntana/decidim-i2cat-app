# DECIDIM.I2CAT.APP

This is a Decidim I2CAT app.

## Overrides

### Topbar menu

Check the `Rails.application.config.to_prepare` block in `config/initializers/decidim.rb` initializer.

### Proposals

There are some overrides that must be checked on every upgrade:

- app/views/decidim/proposals/proposals/\_filters.html.erb hides some filters
- app/views/decidim/proposals/proposals/show.html.erb:73 simply hides the follow button
