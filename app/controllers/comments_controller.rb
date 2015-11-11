class CommentsController < ApplicationController

  #index
  def index

  end

  #new
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  #create
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(song_params)
    redirect_to post_path(@post)
  end


  #show
  def show
    @post = Post.find(params[:id])
  end

  #edit
  def edit
    @comment = Comment.find(params[:id])
  end

  #update
  def update
    @comment = Comment.find(params[:id])
    redirect_to post_path(@post)
  end
  #
  # #destroy
  # def destroy
  #   @post = Post.find(params[:id])
  #   @post.destroy
  #   redirect_to posts_path
  # end

  private
  def song_params
      params.require(:comment).permit(:title, :body, :author)
  end

end
