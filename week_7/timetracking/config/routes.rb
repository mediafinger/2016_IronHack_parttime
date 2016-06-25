Rails.application.routes.draw do
  get "/" => "site#home"
  get "/contact" => "site#contact"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  resources :projects, only: [:index, :new, :show, :create] do
    resources :time_entries, only: [:index, :new, :show, :create, :edit, :update, :destroy]
  end

  root "site#home"
end
