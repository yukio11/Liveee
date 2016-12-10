class CreateLives < ActiveRecord::Migration
  def change
    create_table :lives do |t|
      t.string :title
      t.string :day
      t.string :starting_time
      t.string :place
      t.string :price
      t.text :performer
      t.text :detail
      t.timestamps null: false
    end
  end
end
