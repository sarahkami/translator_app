class SayingsController < ApplicationController
# before_action :admin_user, only: [:index, :new, :destroy]

  def index
    @sayings = Saying.paginate(page: params[:page])
  end

  def new
     @saying = Saying.new
    # Saying.find(params[:id])
  end

  def create
    # @sayings = Saying.new(saying_params)
    # if @sayings.save
    #   flash[:success] = "New Saying created"
    #   redirect_to sayings_path
    # else
    #   render 'new'
    # end
  end

  def destroy
    Saying.find(params[:id]).destroy
    flash[:success] = "Saying deleted"
    redirect_to sayings_path
  end

  private

  def saying_params
    params.require(:saying). permit(:german, :english)
  end
end
