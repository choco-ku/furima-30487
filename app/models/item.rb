class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_place
  belongs_to_active_hash :shipping_date
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do 
    validates :image
    validates :name
    validates :content
    validates :category
    validates :condition
    validates :shipping_fee
    validates :shipping_place
    validates :shipping_date
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 999999999, message: 'is invalid.' }
  end

  with_options numericality: { other_than: 1 }  do 
  validates :category_id
  validates :condition_id
  validates :shipping_fee_id
  validates :shipping_place_id
  validates :shipping_date_id
  end

end
