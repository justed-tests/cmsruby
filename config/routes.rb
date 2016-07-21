Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
    resources :pages
    resources :categories
    resources :settings, only: [:update, :index]
    resources :menus, except: [:show]
    resources :types, except: [:show]
  end

  Page.where.not('slug', nil).all.each do |page|
    get "/#{page.slug}", controller: 'pages', action: 'show', id: page.id
  end

  root "admin/pages#index"

  resources :pages, only: [:show]
  resources :categories, only: [:show]
end
