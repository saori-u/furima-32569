class Item < ApplicationRecord
  belongs_to        :user
  has_one_attached  :image
  has_one           :purchase_history

  with_options presence: true do
    validates  :image
    validates  :name
    validates  :text
    validates  :price
  end
    
    validates    :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    validates    :price, numericality: { message: 'Half-width number' }

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates  :category_id
    validates  :condition_id
    validates  :shipping_charge_id
    validates  :area_id
    validates  :delivery_time_id
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_time
end