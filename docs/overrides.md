# Overrides

This document lists all the overrides that have been done at the Decidim platform. Those overrides can conflict with platform updates. During a platform upgrade they need to be compared to the ones of the Decidim project.

The best way to spot these problems is by reviewing the changes in the files that are overridden using git history and apply the changes manually.

## Modified

- Add notification when a user follows an Assembly and followers list for each Assembly. (https://github.com/CodiTramuntana/decidim-i2cat-app/pull/22)
	- `app/cells/decidim/follow_button/show.erb`
	- `app/controllers/decidim/follows_controller.rb`
	- `app/views/layouts/decidim/admin/assembly.html.erb`

- Redirect index Pages to "smartcataloniachallenge" help Page. (https://github.com/CodiTramuntana/decidim-i2cat-app/pull/33)
  - `app/controllers/decidim/pages_controller.rb`
