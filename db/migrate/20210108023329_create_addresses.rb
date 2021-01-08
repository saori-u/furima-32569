class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postcode,           null: false
      t.integer    :area_id,            null: false
      t.string     :city,               null: false
      t.string     :house_num,          null: false
      t.string     :building
      t.string     :phone_num,          null: false
      t.references :purchase_history,   null: false, foreign_key: true

      t.timestamps
    end
  end
end
