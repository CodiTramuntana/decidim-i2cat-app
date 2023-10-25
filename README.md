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

## Decorators, overrides and more

### Add notification when a user follows an Assembly and followers list for each Assembly. (https://github.com/CodiTramuntana/decidim-i2cat-app/pull/22)

#### Decorators
  - `app/decorators/decidim/follows_controller_decorator.rb`

#### Overrides
  - `app/cells/decidim/follow_button/show.erb`
  - `app/views/layouts/decidim/admin/assembly.html.erb` --> !!!!!! TO REVIEW

#### Others
  - `app/events/decidim/admin/user_follow_event.rb`
  - `app/controllers/decidim/assemblies/admin/assembly_followers_controller.rb`
  - `app/views/decidim/assemblies/admin/assembly_followers/index.html.erb`

### Hide "àmbits", "àreas" and "mostrar" filters. (https://github.com/CodiTramuntana/decidim-i2cat-app/pull/35)

#### Overrides
  - `app/views/decidim/assemblies/_filter_by_type.html.erb`
  - `app/views/decidim/shared/participatory_space_filters/_filters.html.erb`

### Redirect index Pages to "smartcataloniachallenge" help Page. (https://github.com/CodiTramuntana/decidim-i2cat-app/pull/33)
  
#### Decorators
  - `app/decorators/controllers/decidim/pages_controller_decorator.rb`

### Change statuses tags

#### Decorators
  - `app/decorators/cells/decidim/assemblies/assembly_m_cell_decorator.rb`

### Order challenges alphabetically

#### Overrides
 - `app/controllers/concerns/decidim/challenges/orderable_challenges.rb`

### Custom footer
#### Overrides
  - `decidim-core/app/views/layouts/decidim/_main_footer.html.erb`

### Other stuff
  - `decidim-core/app/views/layouts/decidim/_head.html.erb`
