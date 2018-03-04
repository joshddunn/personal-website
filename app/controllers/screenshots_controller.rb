class ScreenshotsController < ApplicationController

  before_action :authenticate_user!

  def create
    @screenshot = Screenshot.new(screenshot_params)
    if @screenshot.save
      respond_to do |format|
        format.html {}
        format.js
      end
    else
      respond_to do |format|
        format.html {}
        format.js { render text: 'alert();' }
      end
    end
  end

  def destroy
    @screenshot = Screenshot.find(params[:id]).destroy
    respond_to do |format|
      format.html {}
      format.js
    end
  end

  private

    def screenshot_params
      filtered = params.require(:screenshot).permit(:article_id, :image)
      filtered
    end
end
