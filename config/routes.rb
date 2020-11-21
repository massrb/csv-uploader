Rails.application.routes.draw do
  get 'csv_files/index'
  get 'csv_files/show'
  post 'csv_files/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "csv_files#index"
end
