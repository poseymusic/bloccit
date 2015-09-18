class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    # if params['cancel'].present?
    #   redirect_to root_path, notice: 'You canceled'
    # else
      @user = User.new
      @user.name = params[:user][:name]
      @user.email = params[:user][:email]
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
      if @user.save
        flash[:notice] = "Welcome to Bloccit #{@user.name}!"
        redirect_to root_path
      #  redirect_to :action => "confirm"
      else
        flash[:error] = "There was an error creating your account. Please try again."
        render :new
      end
    # end
  end

  def confirm
   @user = User.new
   # raise params.inspect
   @user.name = params[:user][:name]
   @user.email = params[:user][:email]
   @user.password = params[:user][:password]
   @user.password_confirmation = params[:user][:password_confirmation]
   # render 'confirm'


    # if @user.save
    #   flash[:notice] = "Welcome to Bloccit #{@user.name}!"
    #   redirect_to root_path
    # else
    #   flash[:error] = "There was an error creating your account. Please try again."
    #   render :new
    # end
  end
end
