class PostsController < ApplicationController
  #http_basic_authenticate_with name:"kk", password:"kk", only: [:destroy]
  def show
    @user =  User.find(params[:user_id])
    @post = @user.posts.find(params[:id])

  end
  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
  end
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)
    @post.poster = @user.username
    if @post.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end
  def update
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to user_post_path(@user,@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:user_id]);
    @post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to @user, status: :see_other
  end
  private
    def post_params
      params.require(:post).permit(:content, :status, :title)
    end
end
