class AvatarsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @avatar = ActiveStorage::Attachment.find params[:id]
    @avatar.purge
  end
end
