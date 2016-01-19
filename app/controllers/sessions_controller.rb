class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      # FIX REDIRECT (to backend_view)
      redirect_to root_path
    else
      flash.now[:danger] = "Mistyped? Or not authorized to enter this site "
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    #FIX REDIRECT (to root (home))
    redirect_to root_path
  end
end
