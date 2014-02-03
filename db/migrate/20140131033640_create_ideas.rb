class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :creator_id
      t.string :title
      t.text :video_url

      t.timestamps
    end
  end
end
