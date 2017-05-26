class AddStoriesUpdatedAt < ActiveRecord::Migration
  def change
    add_column :stories, :updated_at, :timestamp
  end
end
