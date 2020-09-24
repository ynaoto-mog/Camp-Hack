class Insect < ApplicationRecord
    #mount_uploader :image, ImageUploader
    has_many :likes
    has_many :comments
    belongs_to :user
end
