class CreateStats < ActiveRecord::Migration
  def self.up
    create_table :stats do |t|
      t.integer :user_id, :null => false
      t.text :url, :null => false
      t.integer :hit_count, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :stats
  end
end
