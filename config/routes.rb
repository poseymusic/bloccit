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
    # get 'topics/:topic_id/sponsored_posts' => 'sponsored_posts#index', as: :topic_sponsored_posts
    # topic_sponsored_posts_url(topic)
    # => 'http://localhost:3000/topics/topic.id/sponsored_posts'
    # link_to 'Text for the link', topic_sponsored_posts_url(@topic)
    # => <a href='http://localhost:3000/topics/3/sponsored_posts'>Text for the link</a>
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :questions

  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'

  get 'faq' => 'welcome#faq'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

end
