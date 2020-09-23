class Insect < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :insects
end
