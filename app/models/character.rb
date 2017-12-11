class Character < ApplicationRecord
    has_many :comments, dependent: :destroy
end