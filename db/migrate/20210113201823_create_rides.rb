class CreateRides < ActiveRecord::Migration[6.0]
  def change
    create_table :rides do |t|
      t.text :date
      t.text :duration
      t.text :distance
      t.text :average_speed
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
