class Review < ActiveRecord::Base
  attr_accessible :address, :comments, :name, :phone
  belongs_to :user

  before_save do |review| 
        review.name = name.upcase 
        end

  validates :address, presence: true
  validates :comments, presence: true
  validates :name, presence: true
  validates :phone, presence: true
        
  default_scope order: 'reviews.created_at DESC'
end
