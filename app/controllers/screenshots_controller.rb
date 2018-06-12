# screenshots controller
class ScreenshotsController < ApplicationController
  before_action :authenticate_user!

  def create
    @screenshot = Screenshot.new(screenshot_params)
    if @screenshot.save
      respond_to do |format|
        format.html { raise 'Unsupported' }
        format.js
      end
    else
      respond_to do |format|
        format.html { raise 'Unsupported' }
        format.js { render 'errors' }
      end
    end
  end

  def destroy
    @screenshot = Screenshot.find_by(hex: params[:id]).destroy
    respond_to do |format|
      format.html { raise 'Unsupported' }
      format.js
    end
  end

  private

  def screenshot_params
    params.require(:screenshot).permit(:article, :article_id, :image)
  end
end
