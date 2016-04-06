Rails.application.routes.draw do

  namespace :api do 
    resources :designs, only: [:index, :show, :create, :update, :destroy], defaults: { format: "json" }
    resources :slices, except: [:new, :edit], defaults: { format: "json" }
  end

end
