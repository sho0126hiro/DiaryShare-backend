class CommentReactionsController < ApplicationController
  before_action :set_comment_reaction, only: [:show, :update, :destroy]

  # GET /comment_reactions
  # GET /comment_reactions.json
  def index
    @comment_reactions = CommentReaction.all
  end

  # GET /comment_reactions/1
  # GET /comment_reactions/1.json
  def show
  end

  # POST /comment_reactions
  # POST /comment_reactions.json
  def create
    @comment_reaction = CommentReaction.new(comment_reaction_params)

    if @comment_reaction.save
      render :show, status: :created, location: @comment_reaction
    else
      render json: @comment_reaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comment_reactions/1
  # PATCH/PUT /comment_reactions/1.json
  def update
    if @comment_reaction.update(comment_reaction_params)
      render :show, status: :ok, location: @comment_reaction
    else
      render json: @comment_reaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comment_reactions/1
  # DELETE /comment_reactions/1.json
  def destroy
    @comment_reaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_reaction
      @comment_reaction = CommentReaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_reaction_params
      params.require(:comment_reaction).permit(:user_id, :comment_id, :reaction_type)
    end
end
