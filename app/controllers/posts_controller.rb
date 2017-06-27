class PostsController < ApplicationController

  before_action :require_logged_in

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_url(@post) #show page
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end


  def update
    @post = current_user.posts.find(params[:id])
    # @post.sub_id = params[:sub_id]
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = ['You are not the owner of this Post']
      # render :edit
      redirect_to post_url(@post)
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to subs_url # look at this later
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :user_id, :sub_id, sub_ids: [])
  end
end
