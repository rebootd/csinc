Csinc::Application.routes.draw do
  root 'home#home'

  get 'blog', to: redirect('/')
  get 'posts', to: redirect('/')
  get 'about' => 'home#about'
  get 'contact' => 'home#contact'
  get 'resources' => 'home#resources'
  get '/sitemap.xml' => 'sitemap#index'

end
