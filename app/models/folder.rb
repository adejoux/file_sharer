class Folder < ActiveRecord::Base
  has_ancestry
  has_many :documents

end
