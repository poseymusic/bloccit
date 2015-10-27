Rails.application.routes.draw do
  resources :labels, only: [:show]
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
     resources :posts, except: [:index]     # get 'topics/:topic_id/posts', controller: 'posts', action: 'index'
     resources :sponsored_posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
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
