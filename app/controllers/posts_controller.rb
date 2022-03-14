class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: "desc")
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(content: params[:content])
    if @post.save
      redirect_to("/posts/index")
      flash[:notice] = "Post successfully created"
    else
      render "posts/new"
    end
  end
  def show
    @post = Post.find_by(id: params[:id])
  end
  def edit
    @post = Post.find_by(id: params[:id])
  end
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      redirect_to("/posts/index")
      flash[:notice] = "Post successfully edited"
    else
      render "posts/edit"
    end
  end
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
    flash[:notice] = "Post successfully deleted"
  end
end
