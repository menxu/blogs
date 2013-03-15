BlogTwo::Application.routes.draw do
  namespace :admin do
    root :to => 'home#login'
    resources :comments

    resources :blogs

    resources :users

    resources :categories

    resource :home, :controller => :home do
      post :sessions
      get :login
    end
  end

  namespace :auth do
    root :to => 'logins#index'
    resources :logins
    get  '/logout' => 'logins#destroy'
  end

  resources :frontpages do
    collection do
      get :nihao
    end
  end
  resources :logintest

  resources :categories

  resources :comments
  
  resources :blogs

  root :to => "frontpages#index"

  #用户登陆认证
  post '/login' => 'admins#login'
  namespace :api do 
    #博客
    get '/blog_lists' => 'blog_lists#pull'
  end


  # get  '/api/blog_lists'  => 'blogs'

  # http_post http://localhost:3000/login

# 你写一条
# resources :users
# 相当于写了：

# get '/users' => 'users#index'
# get '/users/:id' => 'users#show'
# get '/users/:id/edit' => 'users#edit'
# post '/users' => 'users#create'
# put '/users/:id' => 'users#update'
# delete '/users/:id' => 'users#destroy'
# get '/users/new' => 'users#new'

# 这七条配置

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
