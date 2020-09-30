class Content < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :kind

  #def self.search(search)
   # if search != ""
     # Content.where('name LIKE(?)',"%#{search}%" )
    #else
      #Content.all
    #end 
  #end
   
  validates :name, presence: true
  validates :kind_id, presence: true

end
