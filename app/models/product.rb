class Product < ApplicationRecord
  #Specifies that each product belongs to a user
  belongs_to :user

  #Used to upload image
  mount_uploader :image, ImageUploader
end
