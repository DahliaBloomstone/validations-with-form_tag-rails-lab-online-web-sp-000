class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.update(params[:id])
    if @post.valid?
    redirect_to post_path(@post)
  else
    render :edit
  end
end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
