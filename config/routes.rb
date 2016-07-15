Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
    resources :pages
    resources :categories
    resources :menus, except: [:show]
  end

  Page.where.not('slug', nil).all.each do |page|
    get "/#{page.slug}", controller: 'pages', action: 'show', id: page.id
  end

  resources :pages, only: [:show]
  resources :categories, only: [:show]
end
