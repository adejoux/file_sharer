class RemoveNameFromDocument < ActiveRecord::Migration
  def change
    remove_column :documents, :name, :string
  end
end
