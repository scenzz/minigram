class Gram < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :content, :image
  mount_uploader :image, ImageUploader
end
