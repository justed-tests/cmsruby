Rails.application.routes.draw do

  namespace :admin do
    resources :pages
    resources :categories
  end

  Page.where.not('slug', nil).all.each do |page|
    get "/#{page.slug}", controller: 'pages', action: 'show', id: page.id
  end

  resources :pages, only: [:show]
  resources :categories, only: [:show]

end
