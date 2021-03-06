BlogTwo::Application.routes.draw do
  namespace :admin do
    # root :to => 'home#login'
    root :to => 'index#index'

    resources :index

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

  resources :courses

  # ==============================
  resources :file_uploaders
  # ==============================

  root :to => "frontpages#index"

  #用户登陆认证
  post '/login' => 'admins#login'
  
  namespace :api do
    
    #博客
    get '/blog_lists' => 'blog_lists#pull'
    get '/blog_lists/all' => 'blog_lists#all'
    
    #分类
    get '/category_lists' => 'category_lists#pull'
  end


  post '/upload' => 'file_entities#upload'
  post '/kindeditor_upload' => 'file_entities#kindeditor_upload'
  get  '/download/:download_id' => 'file_entities#download'
  post '/file_entities/:id/re_encode'  => 'file_entities#re_encode'

   # /auth/weibo/callback
  get '/auth/:provider/callback' => 'oauth#callback'
  get '/account/sync' => 'oauth#sync'
  post '/auth/:provider/unbind' => 'oauth#unbind'

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
