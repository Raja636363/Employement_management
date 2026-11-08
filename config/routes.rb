Rails.application.routes.draw do
  resources :employees do
    member do
      get :team   # /employees/:id/team
    end
  end

  resources :departments

  get "up" => "rails/health#show", as: :rails_health_check
end
