# DECIDIM.I2CAT.APP

This is a Decidim I2CAT app.

## Keep your fork synced

To keep your fork up-to-date with the upstream repository, i.e., to upgrade decidim, you must configure a remote that points to the upstream repository in Git.

You can do it with the included rake task:

```bash
bin/rake clean_app:install
```

or do it manually:


```bash
# List the current configured remote repository for your fork.
$ git remote -v
# Specify the new remote upstream repository that will be synced with the fork.
$ git remote add clean-app https://github.com/CodiTramuntana/decidim-clean-app.git
# Verify the new decidim-clean repository you've specified for your fork.
$ git remote -v
```

Syncing a fork

You can do it with the included rake task:

```bash
# Pull from master by default
bin/rake clean_app:sync
# Or pull from a specific branch
bin/rake clean_app:sync[release/0.27-stable]
```

or do it manually:

```bash
# Create a new branch in your fork to start a PR.
$ git checkout master
# Incorporate changes from the decidim-clean repository into the current branch.
$ git pull clean-app master --allow-unrelated-histories
```

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

## Migrate an app to synchronize from clean-app

Documentation in `docs/migrate_to_clean_app.md`.

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

### Customize process navbar in participatory process

Changed the process nav to always show as a dropdown for the assemblies/atles.

  - `app/views/decidim/shared/_extended_navigation_bar.html.erb`
