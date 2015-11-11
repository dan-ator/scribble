class PostsController < ApplicationController

# indent one step inside a class! (everything below)
#index
def index
  @posts = Post.all
end

#new
def new
  @post = Post.new
end

#create
def create
  @post = Post.create!(post_params)
  redirect_to post_path(@post)
end


#show
def show
  @post = Post.find(params[:id])
  @comments = @post.comments # nice use of the association method!
end

#edit
def edit
  @post = Post.find(params[:id])
end

#update
def update
  @post = Post.find(params[:id])
  @post.update!(post_params)
  redirect_to post_path(@post)
end

#destroy
def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path
end

private
def post_params
    params.require(:post).permit(:title, :body, :author, :photo_url)
end

end
