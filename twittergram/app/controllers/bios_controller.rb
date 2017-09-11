class BiosController < ApplicationController
  before_action :set_bio, only: [:show, :update, :edit, :destroy]
  before_action :set_user, only: [:create]
  
  def index
    @bios = Bio.all
  end

  def show
  end

  def new
    @bio = Bio.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @user.bio = Bio.new(bio_params)
    if @user.bio.save
      redirect_to bios_path
    else
      render partial: "form"
    end
  end


  def update
    if @bio.update(bio_params)
      redirect_to bios_path(current_user)
    else
      render partial: "form"
    end
  end

  def destroy
    @bio.destroy
    redirect_to bio_path
  end

  private

    def set_bio
      @bio = Bio.find(params[:id])
    end

    def bio_params
      params.require(:bio).permit(:profile_image, :description, :user_id)
    end

    def set_user
      @user = current_user
    end
end