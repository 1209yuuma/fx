class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :date, presence: true
  validates :alphanumeric, presence: true
  validates :risk_reward, presence: true
  validates :content, presence: true, length: { maximum: 180 }

 
end
