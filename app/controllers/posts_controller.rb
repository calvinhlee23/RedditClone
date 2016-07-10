class PostsController < ApplicationController
  before_action :authorized?, only: [:edit, :update]
  before_action :consequences_of_not_logged_in
  def new
    @post = Post.new
    render :new
  end

  def create
    post = Post.new(post_params)
    post.author_id = @current_user.id
    if post.save!
      redirect_to post_url(post)
    else
      post.errors.full_messages
    end
  end

  def update
    post = Post.find_by_id(params[:id])
    post.update!(post_params)
    redirect_to post_url(post)
  end

  def show
    @post = Post.find_by_id(params[:id])
    render :show
  end

  def edit
    @post = POst.find_by_id(params[:id])
    render :edit
  end

  private
  def authorized?
    unless self.author_id == @current_user.id
      flash[:notice] = "you are not authorized to perform this action"
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :url, sub_id: [])
  end
end
