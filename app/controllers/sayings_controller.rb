class SayingsController < ApplicationController
#before_action :admin_user, only: [:index, :new, :destroy]

  def index
    @sayings = Saying.paginate(page: params[:page])
  end

  def new
     @saying = Saying.new
    # params[:language]
    # Saying.find(params[:id])
    # @sayings = Saying.all
    # respond_to do |format|
    #   format.html
    #   format.xml {render :xml => @saying}
    #end
  end

  def create
    @saying = Saying.new(saying_params)
    if @saying.save
      flash[:success] = "New Saying created"
      redirect_to sayings_path
    else
      render 'new'
    end
  end

  def destroy
    Saying.find(params[:id]).destroy
    flash[:success] = "Saying deleted"
    redirect_to sayings_path
  end

  def lookup
    @saying = Saying.lookup_translation(sayings_params[:language], sayings_params[:phrase])
    #params[:sayings][:german]
  end

 # def translate
 #   Saying.all.each do |saying|
 #     if saying == "textfield_input" do
 #       put_translation_into_textfield_2
 #
 #       OR
 #
 #       Saying.where(:german == "textfield_input").pluck(:english)
 #
 #     end


  private

  def saying_params
    params.require(:saying). permit(:german, :english)
  end

  def sayings_params
    params.require(:sayings).permit(:german, :english, :phrase, :phrase2, :language)
  end

  def admin_user
    @user = User.find(params[:id])
    redirect_to (root_url) unless @user
  end
end
