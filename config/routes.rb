Rails.application.routes.draw do
  # 管理者用
  # URL/admin/sign_in...
  devise_for :admin, skip: %i[registrations passwords], controllers: {
    sessions: 'admin/sessions'
  }

  # 会員用
  # URL/customers/sign_in...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
    resources :books, only: %i[index show edit update destroy] do
      resources :book_comments, only: %i[create destroy]
    end
    resources :customers, only: %i[index show edit update]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    resources :books do
      resources :book_comments, only: %i[create destroy]
      get :search, on: :collection
      resource :bookmarks, only: [:create, :destroy]
    end
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    resources :customers, only: %i[show edit update]
    resources :genres, only: %i[create index edit update]
  end

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
