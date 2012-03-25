class UsersController < ApplicationController
  ## skip_before_filter :require_login, :only => [:index, :new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end


  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    # respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @user }
    # end
  end


  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end


  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = 'User was successfully created.'
      redirect_to users_path()
    else
      flash[:error] = 'Couldn\'t save user.'
      render action: "new"
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to users_path()
    else
      flash[:notice] = 'Couldn\'t update user.'
      render action: "edit"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path()
  end
end
