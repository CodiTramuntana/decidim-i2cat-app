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

## Overrides

This document lists all the overrides that have been done at the Decidim platform. Those overrides can conflict with platform updates. During a platform upgrade they need to be compared to the ones of the Decidim project.

The best way to spot these problems is by reviewing the changes in the files that are overridden using git history and apply the changes manually.

### Modified

- Add notification when a user follows an Assembly and followers list for each Assembly. (https://github.com/CodiTramuntana/decidim-i2cat-app/pull/22)
	- `app/cells/decidim/follow_button/show.erb`
	- `app/controllers/decidim/follows_controller.rb`
	- `app/views/layouts/decidim/admin/assembly.html.erb`

- Hide "àmbits", "àreas" and "mostrar" filters. (https://github.com/CodiTramuntana/decidim-i2cat-app/pull/35)
  - `app/views/decidim/assemblies/_filter_by_type.html.erb`
  - `app/views/decidim/shared/participatory_space_filters/_filters.html.erb`

- Redirect index Pages to "smartcataloniachallenge" help Page. (https://github.com/CodiTramuntana/decidim-i2cat-app/pull/33)
  - `app/controllers/decidim/pages_controller.rb`

## Decorators

This document lists all the decorators that have been done at the Decidim platform. Those decorators can conflict with platform updates. During a platform upgrade they need to be compared to the ones of the Decidim project.

The best way to spot these problems is by reviewing the changes in the files that are overridden using git history and apply the changes manually.

### Modified

- `decidim-core/app/controllers/decidim/pages_controller.rb`
- `decidim-assemblies/app/cells/decidim/assemblies/assembly_m_cell.rb`
- `decidim-core/app/views/layouts/decidim/_main_footer.html.erb`
- `decidim-core/app/views/layouts/decidim/_head.html.erb`