class CreateLivesPerformers < ActiveRecord::Migration
  def change
    create_table :lives_performers do |t|
      t.integer       :live_id
      t.integer       :performer_id
      t.timestamps null: false
    end
  end
end
