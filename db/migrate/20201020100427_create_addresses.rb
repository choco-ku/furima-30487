class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer     :post_code             , null: false
      t.integer    :shipping_place_id     , null: false
      t.string     :city                  , null: false
      t.string     :house_num             , null: false
      t.string     :building              
      t.string     :telephone             , null: false
      t.references :purchase              , null: false,  foreign_key: true
      t.timestamps
    end
  end
end



