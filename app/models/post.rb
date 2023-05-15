class Post < ApplicationRecord
  
  #validates :feature_image, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/webp'], size_range: 1..(2.megabytes) }
  
  has_one_attached :feature_image
end
