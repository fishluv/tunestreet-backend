class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.integer :type, null: false
      t.integer :entity_type, null: false
      t.string :entity_id, null: false
      t.decimal :value, null: false, precision: 3, scale: 2

      t.timestamps
    end
  end
end
