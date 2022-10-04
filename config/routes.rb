Rails.application.routes.draw do
  resources :doctorspecialties
  resources :specialties
  resources :doctors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :patients
  # resources :students, only: [:index, :show, :create, :update]
end
