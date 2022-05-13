Rails.application.routes.draw do




  namespace :admin do
    root to: "homes#top"
    resources :books, only: [:index, :show]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  namespace :public do
    resources :books
    root to: "homes#top"
    get 'homes/about'
    resources :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    resources :genres, only: [:create, :index, :edit, :update]
  end
  #管理者用
  #URL/admin/sign_in...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #会員用
  #URL/customers/sign_in...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
