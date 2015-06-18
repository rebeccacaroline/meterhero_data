class CreateMeters < ActiveRecord::Migration
  def change
    create_table :meters do |t|
      t.string :utility
      t.decimal :units_saved
      t.decimal :dollar_amount_saved
      t.string :city
      t.string :state
      t.timestamps null: false
    end
  end
end
