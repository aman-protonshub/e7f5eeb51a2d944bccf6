Rails.application.routes.draw do
  devise_for :users

  get '/', to: 'home#index'

  resources :questions do
    resources :answers, only: [:create]
  end
  resources :topics

  post 'question/:id/follow_topic', to: 'follower#follow_topic', as: :follow_topic
  post 'question/:id/follow_user', to: 'follower#follow_user', as: :follow_user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
