Csinc::Application.routes.draw do
  get "posts/index"
  get "posts/show"
  get "posts/get"
  root 'home#index'

  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  get 'about' => 'home#about', as: :about
  get 'contact' => 'home#contact', as: :contact

  get "feed/rss" => 'feed#rss'
  get "feed/all" => 'feed#all'
  scope "/blog" do
    resources :posts
  end
  get 'blog' => 'posts#index'
  # match 'blog/categories/:name' => 'categories#show', :as => :full_category
  get '/sitemap.xml' => 'sitemap#index'

  get 'blog/syndication.axd' => 'feed#rss', :as => :rss_posts
  get 'blog/author/*other' => 'home#about'
  get 'blog/posts/:year/:month/:day/:slug' => 'posts#show'
  get 'blog/posts/:year/:month/:slug' => 'posts#show', :as => :full_post
end
