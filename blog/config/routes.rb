Rails.application.routes.draw do
  get '/tagged', to: "posts#tagged", as: :tagged
  devise_for :users
  root 'posts#index'
  resources :posts do
   resources :comments
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
