Rails.application.routes.draw do

  devise_for :users
  root to: redirect(Setting.find_by(key: 'homepage').value)

  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
    resources :pages
    resources :categories
    resources :menus, except: [:show]
    resources :types, except: [:show]

    get 'settings' => 'settings#index'
    put 'settings' => 'settings#update'
  end

  Page.where.not('slug', nil).all.each do |page|
    get "/#{page.slug}", controller: 'pages', action: 'show', id: page.id
  end


  resources :pages, only: [:show]
  resources :categories, only: [:show]
end
