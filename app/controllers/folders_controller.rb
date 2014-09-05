class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:edit, :update, :destroy]

  # GET /folders
  # GET /folders.json
  def index
    @folders = Folder.roots
    @new_folder = Folder.new
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
    @new_folder = Folder.new(parent_id: @folder.id)
    @new_document = Document.new(folder_id: @folder.id)
  end

  # GET /folders/new
  def new
    @folder = Folder.new(parent_id: params[:parent_id])
  end

  # GET /folders/1/edit
  def edit
  end

  def move
    folder = Folder.find(params[:folder])
  end

  # POST /folders
  # POST /folders.json
  def create
    @folder = Folder.new(folder_params)

    respond_to do |format|
      if @folder.save
        format.html { redirect_to @folder, notice: 'Folder was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /folders/1
  # PATCH/PUT /folders/1.json
  def update
    respond_to do |format|
      if @folder.update(folder_params)
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder.destroy
    respond_to do |format|
      format.html { redirect_to folders_url, notice: 'Folder was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit(:name, :parent_id)
    end
end
