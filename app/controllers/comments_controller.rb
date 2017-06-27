class CommentsController < ApplicationController
  before_action :require_logged_in

    def create
      @comment = Comment.new(comment_params)
      @comment.user_id = current_user.id
      if @comment.save
        redirect_to post_url(@comment.post_id)
      else
        flash[:errors] = @comment.errors.full_messages
        render :new
      end
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to post_url(@comment.post_id) 
    end

    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end

end
