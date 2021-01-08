class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :area_id, :city, :house_num, :building, :phone_num, :purchase_history_id, :token

  with_options presence: true do
    validates :postcode,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :area_id,   numericality: { other_than: 1 }
    validates :city
    validates :house_num
    validates :phone_num,  length: { maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, area_id: area_id, city: city, house_num: house_num, building: building, phone_num: phone_num, purchase_history_id: purchase_history.id)
  end
end 
