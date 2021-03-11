class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true , format: {with: /\A[a-z._]+[0-9]*\Z/}, length: {in: 3..25}

  has_one_attached :avatar
  has_many :posts
  has_many :comments

  has_many :followings, class_name: "Follow", foreign_key: :follower_id
  has_many :following_users, through: :followings


  has_many :followers, class_name: "Follow", foreign_key: :following_id
  has_many :follower_users, through: :followers

  has_many :timeline_posts, through: :following_users,source: :posts


  def serializable_hash(options = {})
    if self.avatar.attached?
      avatar_url = Rails.application.routes.url_helpers.rails_blob_path(self.avatar, only_path: true)
      super(options).tap do |hash|
        hash["avatar_url"] = avatar_url
      end
    else
      super({})
    end
  end

end
