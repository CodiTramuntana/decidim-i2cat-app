# frozen_string_literal: true

Rails.application.routes.draw do
  mount Decidim::Core::Engine => '/'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #scope path: "/admin" do
    get 'assemblies/:assembly_slug/followers', to: 'decidim/assemblies/admin/assembly_followers#index', as: 'assembly_followers'
  #end
end
