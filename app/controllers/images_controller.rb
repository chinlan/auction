class ImagesController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
  end
end
