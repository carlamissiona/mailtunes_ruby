Rails.application.routes.draw do 
   
  get  "/", to: "pages_static#home"
  get "/search", to: "pages_static#search"
  post "/search_post", to: "pages_static#search_post"
 post "/radios/search", to: "radios#search"
  # get  "/radio", to: "radios#index"
  # get  "/radio-search", to: "radios#index"
   resources :radios do
      collection do
        get :search
      end
    end
end
