class UploadsController < ApplicationController
  def index
    @uploads = Upload.all(:limit => 10)
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def new
    @upload = Upload.new
  end

  def create
    puts "PARAMETERS #{upload_params}"
    upload = Upload.create(upload_params)
    current_user.uploads << upload
    current_user.save
    redirect_to upload_path(upload)
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.delete if @upload.user == current_user
    redirect_to :uploads
  end

  def friend_stream
    @uploads = Upload.all.where("user_id = ?", current_user.friend_ids)
  end

  private
    def upload_params
      params.require(:upload).permit!
    end

end
