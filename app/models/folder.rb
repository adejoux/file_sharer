class Folder < ActiveRecord::Base
  has_ancestry
  has_many :documents

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :ancestry

end
