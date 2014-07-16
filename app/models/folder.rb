class Folder < ActiveRecord::Base
  has_many :documents
  belongs_to :parent_folder, class_name: "Folder", foreign_key: :parent_id
  has_many :child_folders, class_name: "Folder", foreign_key: :parent_id

  validates_uniqueness_of :name, scope: :parent_id
  validate :parent_exists

  private
  def parent_exists
    true if parent_id.nil?
    Folder.exists?(parent_id)
  end
end
