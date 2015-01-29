class CommentsController < ApplicationController

  def index
    @comments = Comment.find_with_reputation(:votes, :all, order: "votes desc")
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    @user = current_user
    @comment.user_name = @user.name
    if @comment.save
      redirect_to comments_path
    end
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @comment = Comment.find(params[:id])
    @comment.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting"
  end

  def update
    respond_to do |format|
    @comment = Comment.find_by_id(params[:id])
      if @comment.update_attributes(comment_params)
        format.html { redirect_to comments_path, notice: 'Comment was successfully updated.' }
        format.json { render :index, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to "/", notice: 'Comments was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :title, :venue_name, :user_name, :city_and_state)
    end
end
