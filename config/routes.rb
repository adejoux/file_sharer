Rails.application.routes.draw do
  resources :documents, except: [:update, :edit, :destroy]
  resources :folders, except: [:update, :edit, :destroy]

  root to: 'folders#index'
end
