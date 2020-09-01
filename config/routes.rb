Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # This enforces the 1:m relationship
  resources :todos do
    resources :items
  end
end
