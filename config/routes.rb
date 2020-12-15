Rails.application.routes.draw do

devise_for :users,controllers: {
  registrations: 'users/registrations'
}
 devise_scope :user do
  root to: "devise/sessions#new"
end


resources :items do
  collection do
    get 'search'
  end
  member do
    resources :carts, only: [:show] 
     post '/add_item' => 'carts#add_item'
     post '/update_item' => 'carts#update_item'
     delete '/delete_item' => 'carts#delete_item'
   
   end
end

resources :tables do
   resources :carts,only:[:new,:create]
end  

end

