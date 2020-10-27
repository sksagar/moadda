Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get 'instagram/profile',to: "profile#show"
  post 'profile_image',to: "profile#image"
  post 'photo_post',to: "posts#create_post"
 
  get 'users_profile/:id',to: "users#profile",as: "users_profile"
  post 'follow',to: "users#follow"
  post 'unfollow',to: "users#unfollow"
 
  post 'comments',to: "comments#create"

  get "post/:id", to: "posts#find_post"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
