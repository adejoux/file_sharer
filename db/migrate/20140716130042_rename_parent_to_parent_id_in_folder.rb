class RenameParentToParentIdInFolder < ActiveRecord::Migration
  def change
    rename_column :folders, :parent, :parent_id
  end
end
