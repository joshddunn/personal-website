class ResumesController < ApplicationController

  before_action :authenticate_user!

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    Resume.find(params[:id]).destroy
    redirect_to root_path
  end

  private

    def resume_params
      params.fetch(:resume, {}).permit(:id, :user_id, :pdf).tap do |p|
        p[:user_id] = current_user.id
      end
    end

end
