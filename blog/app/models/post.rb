class Post < ApplicationRecord
    has_attached_file :image, styles: { large: "600x600" ,medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
   
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    belongs_to :user
    validates :title,presence:true
    validates :body,presence:true
    has_many :comments  , dependent: :delete_all
    acts_as_taggable_on :categories
end
