class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :nickname
  has_many :reviews, dependent: :destroy
  has_secure_password

 
  before_save do |user| 
        user.email = email.downcase 
        user.remember_token = SecureRandom.urlsafe_base64
        user.nickname = nickname.upcase 
        end
  
  validates :name, presence: true, length: { in: 9..30 }

  validates :nickname, presence: true, 
                       length: { in: 3..10 }


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  									format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end