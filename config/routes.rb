TimelineNoir::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :clue_info
  resources :case_info
  resources :admin
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

  # Example of regular route:
      get 'case/:id' => 'welcome#archive', as: :case_show

  # get 'case/:id' => 'welcome#mainpage'
  match 'cases', to: 'welcome#mainpage', via: [:get, :post], :as=>"case_page"
  match 'cases_page', to: 'welcome#main', via: [:get, :post], :as=>"cases_pages"

  match '/get_case_title/:case_id', to: 'welcome#get_case_title', via: [:get, :post], :as=>"get_case_title"
  match '/get_case_info/:case_id', to: 'welcome#get_case_info', via: [:get, :post], :as=>"get_case_info"
  match '/test_link', to: 'welcome#test_link', via: [:get, :post], :as=>"test_link"
  match '/get_case_description/:case_id', to: 'welcome#get_case_description', via: [:get, :post], :as=>"get_case_description"
  match '/get_suspect_info/:case_id', to: 'welcome#get_suspect_info', via: [:get, :post], :as=>"get_suspect_info"
  match '/get_victim_info/:case_id', to: 'welcome#get_victim_info', via: [:get, :post], :as=>"get_victim_info"
  match '/get_clue_info/:case_id', to: 'welcome#get_clue_info', via: [:get, :post], :as=>"get_clue_info"
  match '/get_clue_crime_info_cord/:case_id', to: 'welcome#get_clue_crime_info_cord', via: [:get, :post], :as=>"get_clue_crime_info_cord"
  match '/get_clue_stmt_info/:case_id', to: 'welcome#get_clue_stmt_info', via: [:get, :post], :as=>"get_clue_stmt_info"
  match '/get_child_cord/:case_id', to: 'welcome#get_child_cord', via: [:get, :post], :as=>"get_child_cord"
  match '/get_children_data/:case_id', to: 'welcome#get_children_data', via: [:get, :post], :as=>"get_children_data"
  match '/get_suspects_name/:case_id', to: 'welcome#get_suspects_name', via: [:get, :post], :as=>"get_suspects_name"
  match '/get_images/:case_id', to: 'welcome#get_images', via: [:get, :post], :as=>"get_images"
  match '/get_suspect_sr/:case_id', to: 'welcome#get_suspect_sr', via: [:get, :post], :as=>"get_suspect_sr"
  match '/get_suspect_bios/:case_id', to: 'welcome#get_suspect_bios', via: [:get, :post], :as=>"get_suspect_bios"
  match '/get_clue_image_comments/:case_id', to: 'welcome#get_clue_image_comments', via: [:get, :post], :as=>"get_clue_image_comments"
  match '/get_clue_image_url/:case_id', to: 'welcome#get_clue_image_url', via: [:get, :post], :as=>"get_clue_image_url"
  match '/save_post', to: 'welcome#save_post', via: [:post], :as=>"save_post"

  # match "/helpcenter" => "forums#create", :via => :post, :as => :create_forum

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
