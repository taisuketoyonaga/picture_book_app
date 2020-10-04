class Content < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :kind

  validates :name, presence: true
  validates :kind_id, presence: true
end
