class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string   :postal_code,   null: false
      t.integer  :prefecture_id,   null: false
      t.string   :city,   null: false
      t.string   :address,   null: false
      t.string   :building_name
      t.string   :phone_num,   null: false
      t.references   :purchase_history,   null: false
      t.timestamps
    end
  end
end
