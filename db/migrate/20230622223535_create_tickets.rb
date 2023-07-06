class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.references :user, null:false, foreign_key: {to_table: 'users'}, index: true
      t.references :automobile, null:false, foreign_key: {to_table: 'automobiles'}, index: true
      t.date :date

      t.timestamps
    end
  end
end
