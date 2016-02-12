class SayingsController < ApplicationController
  def index
    @sayings = Saying.paginate(page: params[:page])
  end

  def new
    @saying = Saying.new
  end
end
