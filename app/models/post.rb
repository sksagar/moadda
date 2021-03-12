class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image,dependent: :destroy


  def as_json(options = {})
    image = Rails.application.routes.url_helpers.rails_blob_path(self.image, only_path: true)
    super(options).merge({image_url: image})
  end

  
  def liked(user_id)
    Like.where(user_id: user_id,post_id: self.id).exists?
  end
end
