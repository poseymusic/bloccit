Rails.application.routes.draw do
#  get 'sponsored_posts/show'

#  get 'sponsored_posts/new'

#  get 'sponsored_posts/edit'

  resources :advertisements
  # get '/advertisements', controller: 'advertisements', action: 'index'
  # get '/advertisements/:id', controller: 'advertisements', action: 'show'
  # get '/advertisements/new' => 'advertisements#new'
  # post '/advertisements' => 'advertisements#create'
  # get '/advertisements/:id/edit' => 'advertisements#edit'
  # put(patch) '/advertisements/:id' => 'advertisements#update'
  # delete '/advertisements/:id' => 'advertisements#destroy'

  resources :topics do
     resources :posts, except: [:index]
     # get 'topics/:topic_id/posts', controller: 'posts', action: 'index'
     resources :sponsored_posts, except: [:index]
  end

  resources :questions

  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'

  get 'faq' => 'welcome#faq'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

end
