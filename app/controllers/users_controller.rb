class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :diaries]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/<public_uid>
  # GET /users/<public_uid>.json
  def show
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/<public_uid>
  # PATCH/PUT /users/<public_uid>.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  # GET /users/1/diaries
  def diaries
    if @user != nil
      render json: {"user_id": @user.public_uid, "diaries": @user.diaries}, status: :ok
    else
      render json: {"error": "user is not found"}, status: 404
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(public_uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :pass, :email, :public_uid, :token)
    end
end
