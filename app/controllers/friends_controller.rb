class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :update, :destroy]

  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.all
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
  end

  """
  # POST /friends
  # POST /friends.json
  {user_id: 申請者, friend_id: 申請される人}
  """
  def create
    @friend = Friend.new(friend_params)
    user_id = User.find_by(public_uid: params[:user_id]).id
    friend_id = User.find_by(public_uid: params[:friend_id]).id
    @friend.user_id = user_id
    @friend.friend_id = friend_id
    @friend.status = "apply"
    if @friend.save
      f2 = Friend.new(user_id: friend_id, friend_id: user_id, status: "applied")
      f2.save
      render :show, status: :created, location: @friend
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end

  """
  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  {user_id: 承諾者, friend_id: 承諾される人}
  """
  def update
    friend_id = User.find_by(public_uid: friend_params[:friend_id]).id
    user_id = User.find_by(public_uid: friend_params[:user_id]).id
    if @friend.update(friend_id: friend_id, user_id: user_id, status: "accept")
      f2 = Friend.find_by(user_id: friend_id, friend_id: user_id)
      f2.update(status: "accepted")
      render :show, status: :ok, location: @friend
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:user_id, :friend_id, :status)
    end

end
