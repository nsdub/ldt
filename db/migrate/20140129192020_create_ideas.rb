class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :creator_id
      t.string :video_url
      t.datetime :created_at

      t.timestamps
    end
  end
end
