Rails.application.routes.draw do
  root 'readies#landing'
  resource :readies, except: %i[edit update destroy] do
    collection do
      get :readme
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
