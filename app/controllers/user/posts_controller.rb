class User::PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def create
    @post = Post.new(post_params)

    # respond_to do |format|
    if @post.save
      redirect_to user_profile_path
      # format.html { redirect_to @post, notice: "Post was successfully created." }
      # format.json { render :show, status: :created, location: @post }
    else
      render "user/profile/show"
      # format.html { render :new, status: :unprocessable_entity }
      # format.json { render json: @post.errors, status: :unprocessable_entity }
    end
    # end
  end

  private

  def post_params
    params.permit(:post_text)
  end
end
