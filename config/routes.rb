Rails.application.routes.draw do
  root to: 'contacts#index'

  resources :contacts do
    collection do
      get :check_number
    end
   end
end
