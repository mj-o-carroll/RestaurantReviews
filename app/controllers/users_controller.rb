class UsersController < ApplicationController
   before_filter :signed_in_user, only: [:edit, :update]
   before_filter :correct_user,   only: [:edit, :update]

	def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end
	
  def new
    @user = User.new
  end

  def index
  @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
    	flash[:success] = "Welcome to the Restaurant Reviews!"    # NEW LINE
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end