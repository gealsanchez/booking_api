class CreateAutomobiles < ActiveRecord::Migration[7.0]
  def change
    create_table :automobiles do |t|
      t.string :model, null: false
      t.string :photo
      t.string :location, null: false
      t.decimal :year, null: false
      t.decimal :rate, null: false

      t.timestamps
    end
  end
end
