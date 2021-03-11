Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get 'moadda/:username',to: "profile#show",as: "instagram_profile"
  post 'profile_image',to: "profile#image"
  post 'photo_post',to: "posts#create_post"
 
  get 'users_profile/:id',to: "users#profile",as: "users_profile"
  post 'follow',to: "users#follow"
  post 'unfollow',to: "users#unfollow"
 
  post 'comments',to: "comments#create"

  get "post/:id", to: "posts#find_post"

  get "home", to: "home#index"
  get "search_user", to: "search#users"

  post "likes",to: "likes#create_like"
  post "unlike", to: "likes#unlike"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
