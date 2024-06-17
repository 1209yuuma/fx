class Diary < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 200 }
  validates :title, presence: true, length: { maximum: 100 }
end


