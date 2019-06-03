Rails.application.routes.draw do
  resources :installments, only: [:create, :show, :destroy]
end
