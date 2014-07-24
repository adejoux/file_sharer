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
    link_to doc.file_url do
      image_tag(image_path('mini_file.png') ) + doc.file_identifier
    end
  end
end
