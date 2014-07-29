module FoldersHelper

  def folder_link(folder)
    link_to folder_path(folder) do
      image_tag(image_path('mini_folder.png')) + folder.name
    end
  end

  def back_link(id)
    link_to folder_path(id) do
      image_tag(image_path('mini_back.png') ) + '..'
    end
  end

  def file_link(doc)
    link_to full_link(doc.file_url) do
      image_tag(image_path('mini_file.png') ) + doc.file_identifier
    end
  end

  def full_link(file_url)
    if ApplicationController.config.relative_url_root
      ApplicationController.config.relative_url_root + file_url
    else
      file_url
    end
  end
end
