class Document < ActiveRecord::Base
  mount_uploader :file, FileUploader
  validates_presence_of :folder_id

  belongs_to :folder
end
