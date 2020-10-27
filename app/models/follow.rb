class Follow < ApplicationRecord
  belongs_to :following_user, class_name: 'User', foreign_key: 'following_id'
  belongs_to :follower_user, class_name: 'User', foreign_key: 'follower_id'
end
