class DiariesController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :set_diary, only: [:show, :update, :destroy]
  # before_action :authenticate
  
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
        auth_user = User.find_by(token: token)
        auth_user != nil ? true : false
    end
  end
  # GET /diaries
  # GET /diaries.json
  def index
    @diaries = Diary.all
  end

  # GET /diaries/1
  # GET /diaries/1.json
  def show
  end

  # POST /diaries
  # POST /diaries.json
  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = User.find_by(public_uid: params[:user_id]).id
    if @diary.save
      render :show, status: :created, location: @diary
    else
      render json: @diary.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /diaries/1
  # PATCH/PUT /diaries/1.json
  def update
    if @diary.update(diary_params)
      render :show, status: :ok, location: @diary
    else
      render json: @diary.errors, status: :unprocessable_entity
    end
  end

  # DELETE /diaries/1
  # DELETE /diaries/1.json
  def destroy
    @diary.destroy
  end

  # GET /diaries/1/comments
  def comments
    @diary = Diary.find_by(id: params[:diary_id])
    if @diary != nil
      render json: {"diary_id": @diary.id, "comments": @diary.comments}, status: :ok
    else
      render json: {"error": "diary notw found"}, status: 404
    end
  end

  # GET /diaries/1/reactions
  def diary_reactions
    @diary = Diary.find_by(id: params[:diary_id])
    p "ok"
    p @diary
    if @diary != nil
      render json: {"diary_id": @diary.id, "reactions": @diary.diary_reactions}, status: :ok
    else
      render json: {"error": "diary not found"}, status: 404
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diary
      @diary = Diary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def diary_params
      params.require(:diary).permit(:user_id, :status, :title, :content)
    end
end
