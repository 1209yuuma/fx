class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :diaries, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorites_posts, through: :favorites, source: :post

    
    before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
        remember_digest
    end

    def session_token
        remember_digest || remember
    end

    def mine?(object)
        object.user_id == id
    end

    def favorite(post)
        favorites_posts << post
    end
     
    def unfavorite(post)
        favorites_posts.destroy(post)
    end
     

    def favorite?(post)
        favorites_posts.include?(post)
    end
     
    
end
