class AddFolderIdToDocument < ActiveRecord::Migration
  def change
    add_reference :documents, :folder_id, index: true
  end
end
