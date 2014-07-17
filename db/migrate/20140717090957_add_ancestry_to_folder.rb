class AddAncestryToFolder < ActiveRecord::Migration
  def self.up
    add_column :folders, :ancestry, :string
    remove_column :folders, :parent_id
    add_index :folders, :ancestry
  end

  def self.down
    remove_index :folders, :ancestry
    remove_column :folders, :ancestry
    add_column :folders, :parent_id, :integer
  end
end
