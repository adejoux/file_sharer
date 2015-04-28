module FoldersHelper
  def full_link(file_url)
    if ApplicationController.config.relative_url_root
      ApplicationController.config.relative_url_root + file_url
    else
      file_url
    end
  end

  def label_name(folder)
    if folder.parent
      "#{folder.parent.name} -> #{folder.name}"
    else
      "#{folder.name}"
    end
  end
end
