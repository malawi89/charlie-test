Rails.application.routes.draw do

  scope "/api/v1" do
    resources :users do
      resource :menu, only: %i[show], controller: "users/menu"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
