class CreateMeters < ActiveRecord::Migration
  def change
    create_table :meters do |t|
      t.string :type
      t.integer :units_saved
      t.integer :dollar_amount_saved
      t.string :city
      t.string :state
      t.timestamps null: false
    end
  end
end
