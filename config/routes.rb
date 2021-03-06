Rails.application.routes.draw do
#signup
devise_for :users
# , controllers: {
#   registrations: 'users/registrations'
# }
# #signin
# devise_scope :user do
#   root to: "devise/sessions#new"
# end
root to: "items#index"

resources :items do
  collection do
    get 'search'
  end
 member do
  post '/carts/add_item' => 'carts#add_item'
  post '/carts/update_item' => 'carts#update_item'
  delete '/carts/delete_item' => 'carts#delete_item'
  end
end


resources :orders, only:[:index,:create,:show]
  resources :orders do
   collection do
    patch :update
  end
end


resources :tables do
   resources :carts, only:[:index,:new,:create] do
   end
    resources :purchases, only:[:new,:create] do
      collection do
        patch :update
        get :show
      end
   end
end  


end

