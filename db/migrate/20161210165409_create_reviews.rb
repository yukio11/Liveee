class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string  :nickname
      t.integer  :rate
      t.text  :review
      t.integer  :live_id
      t.timestamps null: false
    end
  end
end
