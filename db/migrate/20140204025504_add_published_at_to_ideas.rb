class AddPublishedAtToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :published_at, :timestamp
  end
end
