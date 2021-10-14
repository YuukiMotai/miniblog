Rails.application.routes.draw do

  get 'top/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  root to: "top#index"
  resources :posts, only: [:index, :create, :new]
  get '/posts/:id', to: 'posts#index', defaults: { format: :json }

end
