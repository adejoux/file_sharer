class RenameFolderIdIdToFolderId < ActiveRecord::Migration
  def change
    rename_column :documents, :folder_id_id, :folder_id
  end
end
