Rails.application.routes.draw do
  devise_for :users

  scope "/admin" do
    resources :users do
      collection do
        put :approve
      end
    end
  end

  resources :documents, except: [:update, :edit]
  resources :folders

  root to: 'folders#index'
end
