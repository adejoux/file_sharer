class DocumentsController < ApplicationController
  before_action :set_document, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:index, :edit, :update, :destroy]

  def index
    @documents = Document.page params[:page]

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @folder = params[:folder]
    @document = Document.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
  end

  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to folder_path(@document.folder), notice: 'document was successfully created.' }
      else
        format.html { render new_document_path(@document.folder) }
      end
    end
  end

  def update
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(document_params)
        format.html { redirect_to folder_path(@document.folder), notice: 'document was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
    end
  end

  private
  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:file, :folder_id)
  end
end
