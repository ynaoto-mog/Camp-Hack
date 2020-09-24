class Comment < ApplicationRecord
    belongs_to :insect
    belongs_to :user
end
