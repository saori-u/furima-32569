class User < ApplicationRecord
  devise          :database_authenticatable, :registerable,
                  :recoverable, :rememberable, :validatable
  has_many        :items
  has_many        :purchases       
  with_options     presence: true do
    validates     :nickname
    validates     :birthday
      with_options format: { with: /\A[a-z0-9]+\z/i.freeze } do
        validates :password, length: { minimum: 6 }
      end              
      with_options format: { with: /\A[ぁ-んァ-ン一-龥]/.freeze } do
        validates :family_name
        validates :given_name
      end                
      with_options format: { with: /\A[ァ-ヶー－]+\z/.freeze } do
        validates :family_name_kana
        validates :given_name_kana
      end
  end
end