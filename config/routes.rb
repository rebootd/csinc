Csinc::Application.routes.draw do
  get "posts/index"
  get "posts/show"
  root 'home#index'

  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  get 'about' => 'home#about', as: :about
  get 'contact' => 'home#contact', as: :contact

  get "feed/rss" => 'feed#rss'
  scope "/blog" do 
    resources :posts
  end
  get 'blog' => 'posts#index'
  # match 'blog/categories/:name' => 'categories#show', :as => :full_category
  get '/sitemap.xml' => 'sitemap#index'
  
  # match 'blog/syndication.axd' => 'feed#rss', :as => :rss_posts
  # match 'blog/author/*other' => 'home#about'
  # match 'blog/posts/:year/:month/:day/:slug' => 'posts#show'
  get 'blog/posts/:year/:month/:slug' => 'posts#show', :as => :full_post
end
