Csinc::Application.routes.draw do
  root 'home#index'

  get 'blog', to: redirect('/')
  get 'posts', to: redirect('/')
  get '/sitemap.xml' => 'sitemap#index'

end
