Rails.application.routes.draw do
  get "/" => "site#home"
  get "/contact" => "site#contact"

  resources :projects, only: [:index, :new, :show, :create] do
    resources :time_entries, only: [:index, :new, :show, :create, :edit, :update, :destroy]
  end

  # Routes replaced by resources helper method
  #
  # get "/projects" => "projects#index"
  # get "/projects/new" => "projects#new"
  # get "/projects/:id" => "projects#show"
  # post "/projects" => "projects#create"
  #
  # get "/projects/:project_id/entries" => "entries#index"
  # get "/projects/:project_id/entries/new" => "entries#new"
  # get "/projects/:project_id/entries/:id" => "entries#show"
  # post "/projects/:project_id/entries" => "entries#create", as: :project_time_entries

  root "site#home"
end
