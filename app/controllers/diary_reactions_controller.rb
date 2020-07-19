class DiaryReactionsController < ApplicationController
  before_action :set_diary_reaction, only: [:show, :update, :destroy]

  # GET /diary_reactions
  # GET /diary_reactions.json
  def index
    @diary_reactions = DiaryReaction.all
  end

  # GET /diary_reactions/1
  # GET /diary_reactions/1.json
  def show
  end

  # POST /diary_reactions
  # POST /diary_reactions.json
  def create
    @diary_reaction = DiaryReaction.new(diary_reaction_params)

    if @diary_reaction.save
      render :show, status: :created, location: @diary_reaction
    else
      render json: @diary_reaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /diary_reactions/1
  # PATCH/PUT /diary_reactions/1.json
  def update
    if @diary_reaction.update(diary_reaction_params)
      render :show, status: :ok, location: @diary_reaction
    else
      render json: @diary_reaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /diary_reactions/1
  # DELETE /diary_reactions/1.json
  def destroy
    @diary_reaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diary_reaction
      @diary_reaction = DiaryReaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def diary_reaction_params
      params.require(:diary_reaction).permit(:user_id, :diary_id, :reaction_type)
    end
end
