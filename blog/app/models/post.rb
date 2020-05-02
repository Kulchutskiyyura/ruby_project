class Post < ApplicationRecord
    belongs_to :user
    validates :title,presence:true
    validates :body,presence:true
    has_many :comments  , dependent: :delete_all
    acts_as_taggable_on :categories
end
