Rails.application.routes.draw do
  resources :csv_files, only: [:index, :show, :create] do
    get :check, on: :member
  end
  root "csv_files#index"
end
