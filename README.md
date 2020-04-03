# DECIDIM.I2CAT.APP

This is a Decidim I2CAT app.

## Overrides

### Topbar menu

Check the `Rails.application.config.to_prepare` block in `config/initializers/decidim.rb` initializer.

### Recaptcha

To provide recaptcha capabilities the `recaptcha` gem is used.
The implementation tweaks:

- *render the recaptcha widget*: app/overrides/decidim/devise/registrations/new/recaptcha.html.erb.deface
- *check if recaptcha is valid in the controller*: app/decorators/decidim/devise/registrations_controller_decorator.rb
- The recaptcha js tag that should appear in all views has been set via admin panel Configuration / Appearance

### Proposals

There are some overrides that must be checked on every upgrade:

- app/views/decidim/proposals/proposals/\_filters.html.erb hides some filters
- app/views/decidim/proposals/proposals/show.html.erb:73
  - hides the follow button
  - hides the versioning of the proposal
