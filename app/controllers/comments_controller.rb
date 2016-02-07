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

    # option 1
    @comment = @post.comments.create(comment_params.merge(user: current_user))

    # option 2
    # @comment = @post.comments.create(comment_params)
    # @comment.user = current_user
    # @comment.save


    redirect_to post_path(@post)
  end


  #show
  def show
    @post = Post.find(params[:id])
  end

  #edit
  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  #update
  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id]).update(comment_params)

    redirect_to post_path(@post)
  end

  #destroy
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
      params.require(:comment).permit(:title, :body)
  end

end
