class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  authorize_resource
  # GET /users
  # GET /users.json
  def index
    @users = User.all.alphabetical_last.paginate(:page => params[:users]).per_page(10)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @upcoming_events = Event.for_user(@user.id).upcoming
    @past_events = Event.for_user(@user.id).past
    @organizations = Organization.by_user(@user.id)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

    @user = User.new(user_params)

    if @user.save
      if @user.role == "manager"
        Leadership.create(user_id: @user.id, organization_id: 1)
      end
      session[:user_id] = @user.id
      redirect_to home_path, :notice => 'User was successfully created.'
    else
      render :action => "new"
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update_attributes(user_params)
      redirect_to @user, :notice => 'User was successfully updated.'
    else
      render :action => "edit"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:andrew_id, :role, :first_name, :last_name, :password, :password_digest, :active)
    end
end
